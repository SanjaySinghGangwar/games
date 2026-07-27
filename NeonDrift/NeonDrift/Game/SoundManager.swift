import Foundation
import AVFoundation
import AudioToolbox

/// Procedural SFX + light ambient music (no external audio files required).
final class SoundManager {
    static let shared = SoundManager()

    private let engine = AVAudioEngine()
    private let sfxNode = AVAudioPlayerNode()
    private let musicNode = AVAudioPlayerNode()
    private var sfxBuffers: [String: AVAudioPCMBuffer] = [:]
    private var musicBuffer: AVAudioPCMBuffer?
    private let sampleRate: Double = 22_050
    private var started = false
    private var musicOn = false

    var isMuted: Bool {
        get { UserDefaults.standard.bool(forKey: "NeonDriftMuted") }
        set {
            UserDefaults.standard.set(newValue, forKey: "NeonDriftMuted")
            if newValue {
                stopMusic()
            } else if musicOn {
                startMusic()
            }
        }
    }

    private init() {
        configureSession()
        engine.attach(sfxNode)
        engine.attach(musicNode)
        let format = AVAudioFormat(standardFormatWithSampleRate: sampleRate, channels: 1)!
        engine.connect(sfxNode, to: engine.mainMixerNode, format: format)
        engine.connect(musicNode, to: engine.mainMixerNode, format: format)
        engine.mainMixerNode.outputVolume = 0.9
        buildBuffers(format: format)
        try? engine.start()
        started = true
    }

    private func configureSession() {
        let session = AVAudioSession.sharedInstance()
        try? session.setCategory(.ambient, mode: .default, options: [.mixWithOthers])
        try? session.setActive(true)
    }

    // MARK: - Public API

    func play(_ name: String, volume: Float = 0.55) {
        guard !isMuted, started else { return }
        guard let buffer = sfxBuffers[name] else {
            AudioServicesPlaySystemSound(1104)
            return
        }
        // Never let audio failures crash gameplay transitions.
        do {
            if !engine.isRunning {
                try engine.start()
            }
            sfxNode.volume = volume
            if !sfxNode.isPlaying { sfxNode.play() }
            sfxNode.scheduleBuffer(buffer, at: nil, options: [], completionHandler: nil)
        } catch {
            AudioServicesPlaySystemSound(1104)
        }
    }

    func startMusic() {
        musicOn = true
        guard !isMuted, started, let musicBuffer else { return }
        do {
            if !engine.isRunning {
                try engine.start()
            }
            musicNode.stop()
            musicNode.volume = 0.18
            musicNode.play()
            scheduleMusicLoop(musicBuffer)
        } catch {
            // Ambient music is optional.
        }
    }

    func stopMusic() {
        musicNode.stop()
    }

    func setMusicEnabled(_ on: Bool) {
        if on { startMusic() } else {
            musicOn = false
            stopMusic()
        }
    }

    private func scheduleMusicLoop(_ buffer: AVAudioPCMBuffer) {
        musicNode.scheduleBuffer(buffer, at: nil, options: [.loops], completionHandler: nil)
    }

    // MARK: - Buffer synthesis

    private func buildBuffers(format: AVAudioFormat) {
        sfxBuffers["collect"] = tone(format: format, freqs: [880, 1320], durs: [0.05, 0.08], type: .sine, gain: 0.35)
        sfxBuffers["gold"] = tone(format: format, freqs: [660, 990, 1320], durs: [0.05, 0.06, 0.1], type: .triangle, gain: 0.4)
        sfxBuffers["power"] = tone(format: format, freqs: [440, 554, 659], durs: [0.06, 0.06, 0.12], type: .squareSoft, gain: 0.28)
        sfxBuffers["hit"] = noiseBurst(format: format, duration: 0.18, gain: 0.4)
        sfxBuffers["explode"] = noiseBurst(format: format, duration: 0.35, gain: 0.5, lowPass: true)
        sfxBuffers["near"] = tone(format: format, freqs: [1200, 1600], durs: [0.03, 0.05], type: .sine, gain: 0.22)
        sfxBuffers["boss"] = tone(format: format, freqs: [110, 146, 90], durs: [0.12, 0.12, 0.2], type: .sawSoft, gain: 0.35)
        sfxBuffers["bossHit"] = tone(format: format, freqs: [180, 90], durs: [0.08, 0.14], type: .squareSoft, gain: 0.4)
        sfxBuffers["bossDown"] = tone(format: format, freqs: [523, 659, 784, 1046], durs: [0.08, 0.08, 0.1, 0.2], type: .triangle, gain: 0.4)
        sfxBuffers["sector"] = tone(format: format, freqs: [392, 523, 659], durs: [0.07, 0.07, 0.14], type: .sine, gain: 0.3)
        sfxBuffers["ui"] = tone(format: format, freqs: [700], durs: [0.04], type: .sine, gain: 0.2)
        sfxBuffers["buy"] = tone(format: format, freqs: [523, 784], durs: [0.05, 0.1], type: .triangle, gain: 0.32)
        sfxBuffers["daily"] = tone(format: format, freqs: [440, 554, 659, 880], durs: [0.06, 0.06, 0.06, 0.14], type: .sine, gain: 0.34)
        sfxBuffers["start"] = tone(format: format, freqs: [330, 440, 660], durs: [0.06, 0.06, 0.12], type: .sine, gain: 0.3)
        sfxBuffers["shoot"] = tone(format: format, freqs: [980, 720], durs: [0.025, 0.03], type: .squareSoft, gain: 0.18)
        sfxBuffers["missile"] = tone(format: format, freqs: [220, 180, 140], durs: [0.05, 0.05, 0.08], type: .sawSoft, gain: 0.3)
        sfxBuffers["zap"] = tone(format: format, freqs: [1400, 900, 1600], durs: [0.03, 0.03, 0.04], type: .squareSoft, gain: 0.22)
        sfxBuffers["nova"] = tone(format: format, freqs: [120, 180, 240, 360, 480], durs: [0.06, 0.06, 0.06, 0.08, 0.16], type: .triangle, gain: 0.4)
        sfxBuffers["blackhole"] = tone(format: format, freqs: [80, 60, 40], durs: [0.12, 0.14, 0.2], type: .sawSoft, gain: 0.35)
        sfxBuffers["mayhem"] = tone(format: format, freqs: [330, 415, 554, 659, 880], durs: [0.05, 0.05, 0.05, 0.05, 0.12], type: .squareSoft, gain: 0.32)

        musicBuffer = buildMusicLoop(format: format)
    }

    private enum Wave { case sine, triangle, squareSoft, sawSoft }

    private func tone(
        format: AVAudioFormat,
        freqs: [Double],
        durs: [Double],
        type: Wave,
        gain: Float
    ) -> AVAudioPCMBuffer? {
        let total = zip(freqs, durs).map(\.1).reduce(0, +)
        let frames = AVAudioFrameCount(total * sampleRate)
        guard let buffer = AVAudioPCMBuffer(pcmFormat: format, frameCapacity: frames) else { return nil }
        buffer.frameLength = frames
        guard let data = buffer.floatChannelData?[0] else { return nil }

        var offset = 0
        for (freq, dur) in zip(freqs, durs) {
            let n = Int(dur * sampleRate)
            for i in 0..<n {
                let t = Double(i) / sampleRate
                let env = attackRelease(i: i, n: n)
                let phase = 2 * Double.pi * freq * t
                let sample: Double
                switch type {
                case .sine:
                    sample = sin(phase)
                case .triangle:
                    sample = abs((phase / Double.pi).truncatingRemainder(dividingBy: 2) - 1) * 2 - 1
                case .squareSoft:
                    sample = tanh(sin(phase) * 2.5)
                case .sawSoft:
                    let saw = 2 * ((freq * t).truncatingRemainder(dividingBy: 1)) - 1
                    sample = saw * 0.7 + sin(phase) * 0.3
                }
                data[offset + i] = Float(sample) * gain * env
            }
            offset += n
        }
        return buffer
    }

    private func noiseBurst(format: AVAudioFormat, duration: Double, gain: Float, lowPass: Bool = false) -> AVAudioPCMBuffer? {
        let frames = AVAudioFrameCount(duration * sampleRate)
        guard let buffer = AVAudioPCMBuffer(pcmFormat: format, frameCapacity: frames) else { return nil }
        buffer.frameLength = frames
        guard let data = buffer.floatChannelData?[0] else { return nil }
        var prev: Float = 0
        let n = Int(frames)
        for i in 0..<n {
            let env = attackRelease(i: i, n: n)
            var s = Float.random(in: -1...1) * gain * env
            if lowPass {
                s = prev * 0.82 + s * 0.18
                prev = s
            }
            data[i] = s
        }
        return buffer
    }

    private func attackRelease(i: Int, n: Int) -> Float {
        let a = max(1, n / 12)
        let r = max(1, n / 4)
        let attack = Float(min(i, a)) / Float(a)
        let release = Float(min(n - 1 - i, r)) / Float(r)
        return max(0, min(1, attack)) * max(0, min(1, release))
    }

    private func buildMusicLoop(format: AVAudioFormat) -> AVAudioPCMBuffer? {
        // Soft sci-fi arpeggio pad ~4s loop
        let seconds = 4.0
        let frames = AVAudioFrameCount(seconds * sampleRate)
        guard let buffer = AVAudioPCMBuffer(pcmFormat: format, frameCapacity: frames) else { return nil }
        buffer.frameLength = frames
        guard let data = buffer.floatChannelData?[0] else { return nil }

        let chord: [Double] = [110, 164.81, 220, 329.63] // A minor-ish
        let arp: [Double] = [220, 261.63, 329.63, 392, 440, 392, 329.63, 261.63]
        let n = Int(frames)

        for i in 0..<n {
            let t = Double(i) / sampleRate
            var sample = 0.0
            // pad
            for (idx, f) in chord.enumerated() {
                let det = 1 + Double(idx) * 0.002
                sample += sin(2 * .pi * f * det * t) * 0.08
                sample += sin(2 * .pi * f * 2 * t) * 0.02
            }
            // arpeggio eighths
            let step = Int(t * 4) % arp.count
            let af = arp[step]
            let local = t.truncatingRemainder(dividingBy: 0.25)
            let env = exp(-local * 6)
            sample += sin(2 * .pi * af * t) * 0.07 * env
            // soft pulse bass
            sample += sin(2 * .pi * 55 * t) * 0.05 * (0.6 + 0.4 * sin(2 * .pi * 0.5 * t))

            // gentle fade at loop edges
            let edge = min(t, seconds - t, 0.08) / 0.08
            data[i] = Float(sample * min(1, edge) * 0.9)
        }
        return buffer
    }
}
