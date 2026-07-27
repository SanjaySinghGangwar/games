import SwiftUI
import SceneKit
import UIKit

/// Full 3D stadium with free 360° orbit camera + pinch zoom.
struct Cricket3DView: UIViewRepresentable {
    @ObservedObject var model: MatchModel

    func makeCoordinator() -> Coordinator {
        Coordinator(model: model)
    }

    func makeUIView(context: Context) -> SCNView {
        let view = SCNView(frame: .zero)
        view.scene = context.coordinator.scene
        view.backgroundColor = UIColor(red: 0.45, green: 0.72, blue: 0.95, alpha: 1)
        view.antialiasingMode = .multisampling4X
        view.allowsCameraControl = false
        view.autoenablesDefaultLighting = false
        view.isPlaying = true
        view.preferredFramesPerSecond = 60
        view.rendersContinuously = true
        view.pointOfView = context.coordinator.cameraNode

        let pan = UIPanGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handlePan(_:)))
        pan.maximumNumberOfTouches = 1
        view.addGestureRecognizer(pan)

        let pinch = UIPinchGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handlePinch(_:)))
        view.addGestureRecognizer(pinch)

        let tap = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap(_:)))
        tap.require(toFail: pan)
        view.addGestureRecognizer(tap)

        context.coordinator.attach(view: view)
        return view
    }

    func updateUIView(_ uiView: SCNView, context: Context) {
        context.coordinator.model = model
        context.coordinator.syncFromModel()
    }

    final class Coordinator: NSObject {
        var model: MatchModel
        let scene = SCNScene()
        let cameraNode = SCNNode()
        let cameraOrbit = SCNNode()
        let root = SCNNode()

        private weak var scnView: SCNView?
        private var ballNode: SCNNode!
        private var ballShadow: SCNNode!
        private var batsmanNode: SCNNode!
        private var bowlerNode: SCNNode!
        private var stumpNear: SCNNode!
        private var stumpFar: SCNNode!
        private var trailNode: SCNNode!
        private var flashLight: SCNLight!

        // Orbit (radians)
        var yaw: Float = 0.35
        var pitch: Float = 0.42
        var distance: Float = 28
        private var panStartYaw: Float = 0
        private var panStartPitch: Float = 0

        // Pitch geometry (SceneKit: Y up, pitch along Z)
        // Bowler at -Z, batsman at +Z (camera default looks at center)
        private let pitchHalf: Float = 12
        private let pitchWidth: Float = 3.2

        init(model: MatchModel) {
            self.model = model
            super.init()
            buildWorld()
            updateCamera()
        }

        func attach(view: SCNView) {
            scnView = view
            // Smooth camera/ball updates
            let updater = SCNNode()
            updater.name = "ticker"
            scene.rootNode.addChildNode(updater)
            updater.runAction(.repeatForever(.sequence([
                .run { [weak self] _ in self?.syncFromModel() },
                .wait(duration: 1.0 / 60.0)
            ])))
        }

        // MARK: - World

        private func buildWorld() {
            scene.rootNode.addChildNode(root)
            scene.background.contents = UIColor(red: 0.42, green: 0.70, blue: 0.95, alpha: 1)
            scene.fogStartDistance = 40
            scene.fogEndDistance = 90
            scene.fogColor = UIColor(red: 0.55, green: 0.75, blue: 0.95, alpha: 1)

            addLights()
            addGround()
            addPitch()
            addBoundary()
            addStands()
            addStumps()
            addPlayers()
            addBall()
            addCamera()
        }

        private func addLights() {
            let ambient = SCNNode()
            ambient.light = SCNLight()
            ambient.light?.type = .ambient
            ambient.light?.intensity = 500
            ambient.light?.color = UIColor(white: 0.85, alpha: 1)
            root.addChildNode(ambient)

            let sun = SCNNode()
            sun.light = SCNLight()
            sun.light?.type = .directional
            sun.light?.intensity = 1100
            sun.light?.castsShadow = true
            sun.light?.shadowMode = .deferred
            sun.light?.shadowSampleCount = 8
            sun.light?.shadowRadius = 3
            sun.light?.color = UIColor(red: 1, green: 0.96, blue: 0.88, alpha: 1)
            sun.eulerAngles = SCNVector3(-0.9, 0.6, 0)
            root.addChildNode(sun)

            let fill = SCNNode()
            fill.light = SCNLight()
            fill.light?.type = .omni
            fill.light?.intensity = 350
            fill.position = SCNVector3(0, 18, 8)
            root.addChildNode(fill)

            let flash = SCNNode()
            flashLight = SCNLight()
            flashLight.type = .omni
            flashLight.intensity = 0
            flashLight.color = UIColor.orange
            flash.light = flashLight
            flash.position = SCNVector3(0, 12, 0)
            root.addChildNode(flash)
        }

        private func addGround() {
            let ground = SCNFloor()
            ground.reflectivity = 0.015
            let mat = SCNMaterial()
            // Generic grass texture (no branding)
            if let grass = UIImage(named: "GrassTexture") {
                mat.diffuse.contents = grass
                mat.diffuse.wrapS = .repeat
                mat.diffuse.wrapT = .repeat
                mat.diffuse.contentsTransform = SCNMatrix4MakeScale(24, 24, 1)
            } else {
                mat.diffuse.contents = UIColor(red: 0.20, green: 0.50, blue: 0.24, alpha: 1)
            }
            mat.roughness.contents = 0.9
            ground.materials = [mat]
            let node = SCNNode(geometry: ground)
            root.addChildNode(node)

            // Soft mowing stripes (generic, procedural)
            for i in -10...10 {
                let strip = SCNPlane(width: 48, height: 1.35)
                let sm = SCNMaterial()
                let dark = i % 2 == 0
                sm.diffuse.contents = UIColor(red: 0.16 + (dark ? 0 : 0.05), green: 0.46 + (dark ? 0 : 0.07), blue: 0.20, alpha: 0.55)
                sm.transparent.contents = UIColor(white: 1, alpha: 0.55)
                sm.isDoubleSided = true
                strip.materials = [sm]
                let n = SCNNode(geometry: strip)
                n.eulerAngles.x = -.pi / 2
                n.position = SCNVector3(0, 0.015, Float(i) * 1.4)
                root.addChildNode(n)
            }
        }

        private func addPitch() {
            let pitch = SCNBox(width: CGFloat(pitchWidth), height: 0.05, length: CGFloat(pitchHalf * 2 + 2), chamferRadius: 0)
            let mat = SCNMaterial()
            mat.diffuse.contents = UIColor(red: 0.76, green: 0.62, blue: 0.38, alpha: 1)
            mat.roughness.contents = 0.95
            pitch.materials = [mat]
            let node = SCNNode(geometry: pitch)
            node.position = SCNVector3(0, 0.025, 0)
            root.addChildNode(node)

            func crease(z: Float) {
                let line = SCNBox(width: CGFloat(pitchWidth + 0.9), height: 0.02, length: 0.07, chamferRadius: 0)
                let m = SCNMaterial()
                m.diffuse.contents = UIColor(white: 0.96, alpha: 1)
                line.materials = [m]
                let n = SCNNode(geometry: line)
                n.position = SCNVector3(0, 0.055, z)
                root.addChildNode(n)
            }
            crease(z: pitchHalf - 0.8)
            crease(z: -pitchHalf + 0.8)
        }

        private func addBoundary() {
            let radius: CGFloat = 32
            let ring = SCNTorus(ringRadius: radius, pipeRadius: 0.07)
            let mat = SCNMaterial()
            // Generic white boundary rope (not team-colored)
            mat.diffuse.contents = UIColor(white: 0.92, alpha: 1)
            mat.emission.contents = UIColor(white: 0.15, alpha: 1)
            ring.materials = [mat]
            let node = SCNNode(geometry: ring)
            node.position = SCNVector3(0, 0.12, 0)
            root.addChildNode(node)
        }

        private func addStands() {
            let count = 16
            for i in 0..<count {
                let a = Float(i) / Float(count) * Float.pi * 2
                let r: Float = 38
                let box = SCNBox(width: 10, height: CGFloat(6 + (i % 3)), length: 8, chamferRadius: 0.15)
                let mat = SCNMaterial()
                // Neutral concrete stands
                mat.diffuse.contents = UIColor(red: 0.62, green: 0.63, blue: 0.65, alpha: 1)
                box.materials = [mat]
                let n = SCNNode(geometry: box)
                n.position = SCNVector3(sin(a) * r, Float(box.height) * 0.5, cos(a) * r)
                n.eulerAngles.y = a + .pi
                root.addChildNode(n)

                // Generic multicolor crowd (no logos)
                let crowd = SCNBox(width: 9, height: 1.15, length: 1.4, chamferRadius: 0)
                let cm = SCNMaterial()
                let hues: [UIColor] = [
                    UIColor(red: 0.25, green: 0.45, blue: 0.75, alpha: 1),
                    UIColor(red: 0.75, green: 0.35, blue: 0.25, alpha: 1),
                    UIColor(red: 0.3, green: 0.55, blue: 0.35, alpha: 1),
                    UIColor(red: 0.85, green: 0.75, blue: 0.3, alpha: 1)
                ]
                cm.diffuse.contents = hues[i % hues.count]
                crowd.materials = [cm]
                let cn = SCNNode(geometry: crowd)
                cn.position = SCNVector3(sin(a) * (r - 2), Float(box.height) + 0.35, cos(a) * (r - 2))
                cn.eulerAngles.y = a + .pi
                root.addChildNode(cn)
            }

            for i in 0..<4 {
                let a = Float(i) / 4 * .pi * 2 + .pi / 4
                let pole = SCNCylinder(radius: 0.22, height: 18)
                let pm = SCNMaterial()
                pm.diffuse.contents = UIColor(white: 0.35, alpha: 1)
                pole.materials = [pm]
                let pn = SCNNode(geometry: pole)
                pn.position = SCNVector3(sin(a) * 34, 9, cos(a) * 34)
                root.addChildNode(pn)

                let lamp = SCNBox(width: 3, height: 1, length: 1.2, chamferRadius: 0.1)
                let lm = SCNMaterial()
                lm.diffuse.contents = UIColor(white: 0.92, alpha: 1)
                lm.emission.contents = UIColor(white: 0.55, alpha: 1)
                lamp.materials = [lm]
                let ln = SCNNode(geometry: lamp)
                ln.position = SCNVector3(sin(a) * 34, 18, cos(a) * 34)
                root.addChildNode(ln)
            }
        }

        private func makeStumps() -> SCNNode {
            let g = SCNNode()
            for i in -1...1 {
                let stump = SCNCylinder(radius: 0.06, height: 0.72)
                let m = SCNMaterial()
                m.diffuse.contents = UIColor(red: 0.95, green: 0.9, blue: 0.7, alpha: 1)
                stump.materials = [m]
                let n = SCNNode(geometry: stump)
                n.position = SCNVector3(Float(i) * 0.14, 0.36, 0)
                g.addChildNode(n)
            }
            let bail = SCNBox(width: 0.42, height: 0.05, length: 0.06, chamferRadius: 0.01)
            let bm = SCNMaterial()
            bm.diffuse.contents = UIColor(red: 0.95, green: 0.9, blue: 0.7, alpha: 1)
            bail.materials = [bm]
            let bn = SCNNode(geometry: bail)
            bn.position = SCNVector3(0, 0.74, 0)
            g.addChildNode(bn)
            return g
        }

        private func addStumps() {
            stumpNear = makeStumps()
            stumpNear.position = SCNVector3(0, 0, pitchHalf - 0.5)
            root.addChildNode(stumpNear)

            stumpFar = makeStumps()
            stumpFar.position = SCNVector3(0, 0, -pitchHalf + 0.5)
            root.addChildNode(stumpFar)
        }

        private func billboard(imageName: String, width: CGFloat, height: CGFloat) -> SCNNode {
            let plane = SCNPlane(width: width, height: height)
            let mat = SCNMaterial()
            mat.diffuse.contents = UIImage(named: imageName)
            mat.isDoubleSided = true
            mat.transparencyMode = .aOne
            mat.writesToDepthBuffer = true
            plane.materials = [mat]
            let n = SCNNode(geometry: plane)
            // Pivot at feet
            n.pivot = SCNMatrix4MakeTranslation(0, -Float(height) * 0.5, 0)
            return n
        }

        private func addPlayers() {
            batsmanNode = billboard(imageName: "BatsmanReady", width: 2.4, height: 3.4)
            batsmanNode.position = SCNVector3(0, 0, pitchHalf - 1.2)
            root.addChildNode(batsmanNode)

            bowlerNode = billboard(imageName: "Bowler", width: 1.6, height: 2.4)
            bowlerNode.position = SCNVector3(0, 0, -pitchHalf + 1.4)
            root.addChildNode(bowlerNode)
        }

        private func addBall() {
            let sphere = SCNSphere(radius: 0.12)
            let mat = SCNMaterial()
            mat.diffuse.contents = UIImage(named: "CricketBall") ?? UIColor.red
            mat.roughness.contents = 0.4
            sphere.materials = [mat]
            ballNode = SCNNode(geometry: sphere)
            ballNode.isHidden = true
            root.addChildNode(ballNode)

            let shadow = SCNPlane(width: 0.35, height: 0.2)
            let sm = SCNMaterial()
            sm.diffuse.contents = UIColor.black.withAlphaComponent(0.3)
            sm.isDoubleSided = true
            shadow.materials = [sm]
            ballShadow = SCNNode(geometry: shadow)
            ballShadow.eulerAngles.x = -.pi / 2
            ballShadow.isHidden = true
            root.addChildNode(ballShadow)

            trailNode = SCNNode()
            root.addChildNode(trailNode)
        }

        private func addCamera() {
            let cam = SCNCamera()
            cam.fieldOfView = 55
            cam.zFar = 120
            cam.wantsHDR = true
            cam.bloomIntensity = 0.35
            cam.bloomThreshold = 0.85
            cameraNode.camera = cam
            cameraOrbit.addChildNode(cameraNode)
            scene.rootNode.addChildNode(cameraOrbit)
            cameraOrbit.position = SCNVector3(0, 0, 0)
        }

        private func updateCamera() {
            pitch = max(0.12, min(1.2, pitch))
            distance = max(12, min(48, distance))
            let x = distance * sin(yaw) * cos(pitch)
            let y = distance * sin(pitch)
            let z = distance * cos(yaw) * cos(pitch)
            cameraNode.position = SCNVector3(x, y, z)
            cameraNode.look(at: SCNVector3(0, 1.2, 0))
        }

        // MARK: - Sync gameplay → 3D

        func syncFromModel() {
            // Billboard players face camera
            let cam = cameraNode.presentation.worldPosition
            batsmanNode.look(at: SCNVector3(cam.x, batsmanNode.position.y + 1.5, cam.z), up: SCNVector3(0, 1, 0), localFront: SCNVector3(0, 0, 1))
            bowlerNode.look(at: SCNVector3(cam.x, bowlerNode.position.y + 1.2, cam.z), up: SCNVector3(0, 1, 0), localFront: SCNVector3(0, 0, 1))

            // Pose swap
            if let plane = batsmanNode.geometry as? SCNPlane {
                let name = model.useSwingPose ? "BatsmanSwing" : "BatsmanReady"
                plane.firstMaterial?.diffuse.contents = UIImage(named: name)
            }

            // Slight bowler lean during windup
            if model.delivery == .bowling {
                bowlerNode.eulerAngles.z = sin(Float(model.bowlWindup) * 10) * 0.08
            } else {
                bowlerNode.eulerAngles.z = 0
            }

            // Ball mapping from model flight
            let show = model.showBall && (model.phase == .playing || model.phase == .paused)
            ballNode.isHidden = !show
            ballShadow.isHidden = !show
            if show {
                let p = mapBallTo3D()
                ballNode.position = p
                ballNode.eulerAngles.x += 0.15
                ballShadow.position = SCNVector3(p.x, 0.03, p.z)
                let scale = max(0.4, 1.0 - p.y * 0.15)
                ballShadow.scale = SCNVector3(scale, scale, scale)
            }

            // Boundary flash light
            if model.boundaryFlash > 0 {
                flashLight.intensity = CGFloat(model.boundaryFlash) * 1200
            } else {
                flashLight.intensity = 0
            }

            // Camera shake
            if model.cameraShake > 0 {
                let s = Float(model.cameraShake) * 0.15
                cameraOrbit.position = SCNVector3(
                    Float.random(in: -s...s),
                    Float.random(in: 0...s * 0.5),
                    Float.random(in: -s...s)
                )
            } else {
                cameraOrbit.position = SCNVector3Zero
            }
        }

        /// Map 2D match flight + boundary state into 3D pitch coords.
        private func mapBallTo3D() -> SCNVector3 {
            switch model.delivery {
            case .inFlight, .bowling:
                let t = Float(min(1, max(0, model.ballT)))
                let x = Float(model.ballLine) * 1.4
                // z: bowler -pitchHalf → batsman +pitchHalf
                let z = -pitchHalf + 1.5 + t * (pitchHalf * 2 - 3)
                // bounce height curve
                var y: Float = 0.8
                if t < 0.48 {
                    y = 0.35 + sin(t / 0.48 * .pi) * 1.6
                } else if t < 0.85 {
                    let t2 = (t - 0.48) / 0.37
                    y = 0.25 + sin(min(1, t2) * .pi) * 0.7 * max(0, 1 - t2)
                } else {
                    y = 0.45 + (1 - t) * 0.3
                }
                return SCNVector3(x, y, z)

            case .boundaryFlight:
                if model.lastResult == .six {
                    let flight = 1 - Float(max(0.001, model.resultTimer) / 1.65)
                    let ang = Float(model.selectedShot.angle)
                    let dist = 4 + flight * 28
                    let height = 1.2 + sin(min(1, flight) * .pi) * 8
                    return SCNVector3(sin(ang) * dist, height, cos(ang) * dist * 0.35 + pitchHalf * 0.15)
                } else {
                    let flight = 1 - Float(max(0.001, model.resultTimer) / 1.3)
                    let side: Float = model.ballVX >= 0 ? 1 : -1
                    return SCNVector3(
                        side * (3 + flight * 26),
                        0.35 + max(0, 1 - flight) * 1.2,
                        Float(model.ballLine) + pitchHalf * 0.35 - flight * 5
                    )
                }

            default:
                return SCNVector3(0, 0.5, 0)
            }
        }

        // MARK: - Gestures

        @objc func handlePan(_ g: UIPanGestureRecognizer) {
            let t = g.translation(in: g.view)
            if g.state == .began {
                panStartYaw = yaw
                panStartPitch = pitch
            }
            yaw = panStartYaw - Float(t.x) * 0.008
            pitch = panStartPitch + Float(t.y) * 0.006
            updateCamera()
        }

        @objc func handlePinch(_ g: UIPinchGestureRecognizer) {
            if g.state == .changed || g.state == .ended {
                distance /= Float(g.scale)
                g.scale = 1
                updateCamera()
            }
        }

        @objc func handleTap(_ g: UITapGestureRecognizer) {
            guard model.phase == .playing else { return }
            if model.role == .batting {
                model.swing()
            }
        }
    }
}

