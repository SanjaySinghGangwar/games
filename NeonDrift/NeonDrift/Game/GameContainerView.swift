import SwiftUI

struct GameContainerView: View {
    @StateObject private var model = GameModel()
    @State private var pulsePlay = false
    @State private var showShop = false
    @State private var showDaily = false

    var body: some View {
        GeometryReader { geo in
            let size = geo.size

            ZStack {
                // Draw-only canvas — never mutate model here (that blocked START RUN taps).
                TimelineView(.animation(minimumInterval: 1.0 / 60.0, paused: false)) { _ in
                    Canvas { context, canvasSize in
                        GameRenderer.draw(context: context, size: canvasSize, model: model)
                    }
                }
                .allowsHitTesting(false)

                // Touch layer only while playing (does not cover menu buttons).
                if model.phase == .playing {
                    Color.clear
                        .contentShape(Rectangle())
                        .gesture(dragGesture)
                }

                // CADisplayLink-driven game loop (safe vs SwiftUI view updates).
                DisplayLinkHost { timestamp in
                    model.configure(size: size)
                    switch model.phase {
                    case .playing:
                        model.update(now: timestamp)
                    case .menu, .gameOver:
                        model.updateMenuAmbience(now: timestamp)
                    case .paused:
                        break
                    }
                }
                .frame(width: 0, height: 0)
                .allowsHitTesting(false)

                hudOverlay
                    .zIndex(10)
            }
            .onAppear {
                model.configure(size: size)
                model.dailyStore.refreshIfNeeded()
                withAnimation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true)) {
                    pulsePlay = true
                }
            }
            .onChange(of: size) { newSize in
                model.configure(size: newSize)
            }
            .sheet(isPresented: $showShop) {
                ShopSheet(model: model)
            }
            .sheet(isPresented: $showDaily) {
                DailySheet(model: model) {
                    showDaily = false
                    // Dismiss first, then start on next runloop so sheet doesn't eat the transition.
                    DispatchQueue.main.async {
                        model.startGame(daily: true)
                    }
                }
            }
        }
        .background(Color.black)
    }

    private var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { value in
                model.setTouch(x: value.location.x)
            }
            .onEnded { _ in
                model.setTouch(x: nil)
            }
    }

    @ViewBuilder
    private var hudOverlay: some View {
        switch model.phase {
        case .menu: menuOverlay
        case .playing: playingHUD
        case .paused: pausedOverlay
        case .gameOver: gameOverOverlay
        }
    }

    // MARK: - Menu

    private var menuOverlay: some View {
        VStack(spacing: 0) {
            HStack {
                statChip(icon: "diamond.fill", label: "BANK", value: "\(model.bankedCrystals)", tint: .pink)
                Spacer()
                Button {
                    model.toggleMute()
                } label: {
                    Image(systemName: model.isMuted ? "speaker.slash.fill" : "speaker.wave.2.fill")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(width: 40, height: 40)
                        .background(.ultraThinMaterial, in: Circle())
                }
                .buttonStyle(.plain)
                statChip(icon: "flag.checkered", label: "RUNS", value: "\(model.totalRuns)", tint: .cyan)
            }
            .padding(.horizontal, 16)
            .padding(.top, 54)

            Spacer(minLength: 4)

            Image("MenuHero")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 230, maxHeight: 200)
                .shadow(color: Color.cyan.opacity(0.65), radius: pulsePlay ? 34 : 18, y: 10)
                .scaleEffect(pulsePlay ? 1.03 : 1.0)

            VStack(spacing: 6) {
                Text("NEON DRIFT")
                    .font(.system(size: 40, weight: .black, design: .rounded))
                    .foregroundStyle(premiumGradient)
                    .shadow(color: Color.cyan.opacity(0.7), radius: 18)

                Text("Mayhem · Nova · Drones · Black holes · Chains")
                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                    .foregroundStyle(.white.opacity(0.5))
            }

            if model.highScore > 0 {
                glassCard {
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("PERSONAL BEST")
                                .font(.system(size: 10, weight: .bold, design: .rounded))
                                .foregroundStyle(.white.opacity(0.45))
                            Text("\(model.highScore)")
                                .font(.system(size: 24, weight: .black, design: .rounded))
                                .foregroundStyle(.white)
                                .monospacedDigit()
                        }
                        Spacer()
                        Image(systemName: "trophy.fill")
                            .font(.system(size: 26))
                            .foregroundStyle(
                                LinearGradient(colors: [.yellow, .orange], startPoint: .top, endPoint: .bottom)
                            )
                    }
                }
                .padding(.horizontal, 28)
                .padding(.top, 12)
            }

            // Daily teaser
            Button {
                showDaily = true
            } label: {
                HStack(spacing: 10) {
                    Image(systemName: model.dailyStore.challenge.modifier.symbol)
                        .foregroundStyle(.yellow)
                    VStack(alignment: .leading, spacing: 2) {
                        Text("DAILY CHALLENGE")
                            .font(.system(size: 10, weight: .bold, design: .rounded))
                            .foregroundStyle(.white.opacity(0.45))
                        Text(model.dailyStore.challenge.modifier.title)
                            .font(.system(size: 15, weight: .heavy, design: .rounded))
                            .foregroundStyle(.white)
                    }
                    Spacer()
                    if model.dailyStore.completedToday {
                        Text("DONE")
                            .font(.system(size: 11, weight: .black, design: .rounded))
                            .foregroundStyle(.green)
                    } else {
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.white.opacity(0.4))
                    }
                }
                .padding(14)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .strokeBorder(Color.yellow.opacity(0.25), lineWidth: 1)
                )
            }
            .buttonStyle(.plain)
            .padding(.horizontal, 28)
            .padding(.top, 12)

            Spacer()

            premiumButton(title: "START RUN", icon: "play.fill", accent: true) {
                model.startGame(daily: false)
            }
            .scaleEffect(pulsePlay ? 1.02 : 1.0)
            .buttonStyle(.plain)
            .zIndex(20)

            HStack(spacing: 12) {
                miniMenuButton(title: "SHOP", icon: "cart.fill") {
                    model.refreshBankFromDefaults()
                    showShop = true
                }
                miniMenuButton(title: "DAILY", icon: "calendar") {
                    showDaily = true
                }
            }
            .padding(.top, 10)
            .padding(.bottom, 28)
        }
    }

    // MARK: - Playing

    private var playingHUD: some View {
        VStack(spacing: 8) {
            HStack(alignment: .top, spacing: 10) {
                glassCard(compact: true) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(model.isDailyRun ? "DAILY" : "SCORE")
                            .font(.system(size: 10, weight: .bold, design: .rounded))
                            .foregroundStyle(.white.opacity(0.45))
                        Text("\(model.score)")
                            .font(.system(size: 24, weight: .black, design: .rounded))
                            .foregroundStyle(.white)
                            .monospacedDigit()
                    }
                }

                Spacer(minLength: 0)

                VStack(spacing: 6) {
                    HStack(spacing: 3) {
                        ForEach(0..<model.maxShieldsDisplay, id: \.self) { i in
                            Image(systemName: i < model.shields ? "shield.fill" : "shield")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundStyle(i < model.shields ? Color.cyan : Color.white.opacity(0.22))
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 7)
                    .background(.ultraThinMaterial, in: Capsule())

                    Text("SEC \(model.sector)")
                        .font(.system(size: 11, weight: .heavy, design: .rounded))
                        .foregroundStyle(.white.opacity(0.7))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Color.white.opacity(0.08), in: Capsule())
                }

                Spacer(minLength: 0)

                Button { model.togglePause() } label: {
                    Image(systemName: "pause.fill")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(width: 44, height: 44)
                        .background(.ultraThinMaterial, in: Circle())
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 14)
            .padding(.top, 50)

            if model.bossActive && model.bossMaxHP > 0 {
                VStack(spacing: 4) {
                    Text("BOSS")
                        .font(.system(size: 11, weight: .black, design: .rounded))
                        .foregroundStyle(.red)
                    GeometryReader { g in
                        ZStack(alignment: .leading) {
                            Capsule().fill(Color.white.opacity(0.12))
                            Capsule()
                                .fill(
                                    LinearGradient(colors: [.red, .orange], startPoint: .leading, endPoint: .trailing)
                                )
                                .frame(width: g.size.width * CGFloat(model.bossHP) / CGFloat(max(1, model.bossMaxHP)))
                        }
                    }
                    .frame(height: 10)
                    .padding(.horizontal, 40)
                }
                .padding(.top, 2)
            }

            // Nova charge bar
            if model.phase == .playing {
                VStack(spacing: 4) {
                    Text(model.novaCharge >= 1 ? "NOVA READY" : "NOVA")
                        .font(.system(size: 10, weight: .black, design: .rounded))
                        .foregroundStyle(model.novaCharge >= 1 ? .yellow : .white.opacity(0.5))
                    GeometryReader { g in
                        ZStack(alignment: .leading) {
                            Capsule().fill(Color.white.opacity(0.1))
                            Capsule()
                                .fill(
                                    LinearGradient(
                                        colors: [.purple, .pink, .yellow],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .frame(width: g.size.width * CGFloat(min(1, model.novaCharge)))
                        }
                    }
                    .frame(height: 8)
                    .padding(.horizontal, 50)
                }
            }

            if hasActiveEffects {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        if model.multiplierTime > 0 { effectPill(title: "×2", time: model.multiplierTime, color: .yellow) }
                        if model.magnetTime > 0 { effectPill(title: "MAG", time: model.magnetTime, color: .pink) }
                        if model.slowMoTime > 0 { effectPill(title: "SLOW", time: model.slowMoTime, color: .blue) }
                        if model.nitroTime > 0 { effectPill(title: "NITRO", time: model.nitroTime, color: .green) }
                        if model.rapidTime > 0 { effectPill(title: "RAPID", time: model.rapidTime, color: .orange) }
                        if model.droneTime > 0 { effectPill(title: "DRONES", time: model.droneTime, color: .purple) }
                        if model.chaosTime > 0 { effectPill(title: "CHAOS", time: model.chaosTime, color: .red) }
                    }
                    .padding(.horizontal, 16)
                }
            }

            if model.mayhemActive {
                Text("⚡ MAYHEM ×\(model.combo) ⚡")
                    .font(.system(size: 17, weight: .black, design: .rounded))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.yellow, .pink, .cyan, .purple],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .padding(.horizontal, 16)
                    .padding(.vertical, 6)
                    .background(.black.opacity(0.4), in: Capsule())
                    .shadow(color: .pink.opacity(0.6), radius: 10)
            } else if model.combo > 1 {
                Text(model.combo >= 12 ? "COMBO ×\(model.combo) · MAYHEM @18" : "COMBO ×\(model.combo)")
                    .font(.system(size: 15, weight: .black, design: .rounded))
                    .foregroundStyle(LinearGradient(colors: [.pink, .cyan], startPoint: .leading, endPoint: .trailing))
                    .padding(.horizontal, 14)
                    .padding(.vertical, 6)
                    .background(.black.opacity(0.35), in: Capsule())
            }

            if model.toastLife > 0 {
                Text(model.toast)
                    .font(.system(size: 17, weight: .black, design: .rounded))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 9)
                    .background(
                        LinearGradient(colors: [Color.cyan.opacity(0.35), Color.pink.opacity(0.35)], startPoint: .leading, endPoint: .trailing),
                        in: Capsule()
                    )
            }

            Spacer()

            HStack {
                miniStat(title: "KILLS", value: "\(model.asteroidsDestroyed)")
                Spacer()
                miniStat(title: "GEMS", value: "\(model.crystalsCollected)")
                Spacer()
                miniStat(title: "BOSS", value: "\(model.bossesDefeated)")
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 26)
        }
        .animation(.spring(response: 0.35, dampingFraction: 0.8), value: model.combo)
    }

    private var hasActiveEffects: Bool {
        model.multiplierTime > 0
            || model.magnetTime > 0
            || model.slowMoTime > 0
            || model.nitroTime > 0
            || model.rapidTime > 0
            || model.droneTime > 0
            || model.chaosTime > 0
    }

    // MARK: - Pause / Game Over

    private var pausedOverlay: some View {
        ZStack {
            Color.black.opacity(0.55).ignoresSafeArea()
            glassCard {
                VStack(spacing: 16) {
                    Text("PAUSED")
                        .font(.system(size: 32, weight: .black, design: .rounded))
                        .foregroundStyle(.white)
                    Text("Score \(model.score)  ·  Sector \(model.sector)")
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                        .foregroundStyle(.white.opacity(0.55))
                    premiumButton(title: "RESUME", icon: "play.fill", accent: true) { model.togglePause() }
                    premiumButton(title: "QUIT TO MENU", icon: "house.fill", accent: false) { model.returnToMenu() }
                }
            }
            .padding(.horizontal, 28)
        }
    }

    private var gameOverOverlay: some View {
        ZStack {
            Color.black.opacity(0.62).ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                VStack(spacing: 14) {
                    if model.isNewBest {
                        Text("NEW BEST")
                            .font(.system(size: 13, weight: .black, design: .rounded))
                            .tracking(3)
                            .foregroundStyle(.black)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(LinearGradient(colors: [.yellow, .orange], startPoint: .leading, endPoint: .trailing), in: Capsule())
                    }

                    if model.dailyRewardEarned > 0 {
                        Text("DAILY CLEAR  +\(model.dailyRewardEarned) 💎")
                            .font(.system(size: 13, weight: .black, design: .rounded))
                            .foregroundStyle(.black)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.green, in: Capsule())
                    }

                    Text("RUN COMPLETE")
                        .font(.system(size: 28, weight: .black, design: .rounded))
                        .foregroundStyle(LinearGradient(colors: [.pink, .orange, .yellow], startPoint: .leading, endPoint: .trailing))

                    glassCard {
                        VStack(spacing: 12) {
                            Text("\(model.score)")
                                .font(.system(size: 46, weight: .black, design: .rounded))
                                .foregroundStyle(.white)
                                .monospacedDigit()
                            Text("BEST \(model.highScore)")
                                .font(.system(size: 14, weight: .bold, design: .rounded))
                                .foregroundStyle(.white.opacity(0.5))
                            Divider().overlay(Color.white.opacity(0.12))
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                                resultCell(title: "Sector", value: "\(model.sector)")
                                resultCell(title: "Distance", value: "\(model.distance)")
                                resultCell(title: "Gems", value: "\(model.crystalsCollected)")
                                resultCell(title: "Kills", value: "\(model.asteroidsDestroyed)")
                                resultCell(title: "Bosses", value: "\(model.bossesDefeated)")
                                resultCell(title: "Max Combo", value: "×\(model.maxCombo)")
                                resultCell(title: "Bank", value: "\(model.bankedCrystals)")
                            }
                        }
                    }
                    .padding(.horizontal, 22)

                    premiumButton(title: "RETRY", icon: "arrow.clockwise", accent: true) {
                        model.startGame(daily: model.isDailyRun)
                    }
                    premiumButton(title: "MENU", icon: "house.fill", accent: false) {
                        model.returnToMenu()
                    }
                    .padding(.bottom, 24)
                }
                .padding(.top, 48)
            }
        }
    }

    // MARK: - Components

    private var premiumGradient: LinearGradient {
        LinearGradient(
            colors: [
                Color(red: 0.4, green: 1, blue: 1),
                Color(red: 0.7, green: 0.55, blue: 1),
                Color(red: 1, green: 0.4, blue: 0.95)
            ],
            startPoint: .leading,
            endPoint: .trailing
        )
    }

    private func glassCard<Content: View>(compact: Bool = false, @ViewBuilder content: () -> Content) -> some View {
        content()
            .padding(compact ? 12 : 18)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: compact ? 16 : 22, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: compact ? 16 : 22, style: .continuous)
                    .strokeBorder(
                        LinearGradient(colors: [.white.opacity(0.28), .white.opacity(0.06)], startPoint: .topLeading, endPoint: .bottomTrailing),
                        lineWidth: 1
                    )
            )
            .shadow(color: .black.opacity(0.25), radius: 16, y: 8)
    }

    private func premiumButton(title: String, icon: String, accent: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack(spacing: 10) {
                Image(systemName: icon).font(.system(size: 15, weight: .bold))
                Text(title).font(.system(size: 17, weight: .heavy, design: .rounded))
            }
            .foregroundStyle(accent ? Color.black : Color.white)
            .frame(maxWidth: 280)
            .padding(.vertical, 16)
            .background {
                if accent {
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(premiumGradient)
                        .shadow(color: Color.cyan.opacity(0.45), radius: 16, y: 6)
                } else {
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(.white.opacity(0.08))
                        .overlay(
                            RoundedRectangle(cornerRadius: 18, style: .continuous)
                                .strokeBorder(.white.opacity(0.28), lineWidth: 1.2)
                        )
                }
            }
        }
        .buttonStyle(.plain)
    }

    private func miniMenuButton(title: String, icon: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Image(systemName: icon)
                Text(title)
                    .font(.system(size: 14, weight: .heavy, design: .rounded))
            }
            .foregroundStyle(.white)
            .frame(maxWidth: 140)
            .padding(.vertical, 12)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .strokeBorder(.white.opacity(0.18), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }

    private func statChip(icon: String, label: String, value: String, tint: Color) -> some View {
        HStack(spacing: 8) {
            Image(systemName: icon).foregroundStyle(tint)
            VStack(alignment: .leading, spacing: 0) {
                Text(label)
                    .font(.system(size: 9, weight: .bold, design: .rounded))
                    .foregroundStyle(.white.opacity(0.4))
                Text(value)
                    .font(.system(size: 14, weight: .heavy, design: .rounded))
                    .foregroundStyle(.white)
                    .monospacedDigit()
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(.ultraThinMaterial, in: Capsule())
    }

    private func effectPill(title: String, time: CGFloat, color: Color) -> some View {
        HStack(spacing: 4) {
            Text(title).font(.system(size: 11, weight: .black, design: .rounded))
            Text(String(format: "%.0fs", time))
                .font(.system(size: 11, weight: .bold, design: .rounded))
                .monospacedDigit()
        }
        .foregroundStyle(.black.opacity(0.85))
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(color.opacity(0.9), in: Capsule())
    }

    private func miniStat(title: String, value: String) -> some View {
        VStack(spacing: 2) {
            Text(title)
                .font(.system(size: 10, weight: .bold, design: .rounded))
                .foregroundStyle(.white.opacity(0.4))
            Text(value)
                .font(.system(size: 16, weight: .heavy, design: .rounded))
                .foregroundStyle(.white.opacity(0.9))
                .monospacedDigit()
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(.black.opacity(0.28), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
    }

    private func resultCell(title: String, value: String) -> some View {
        VStack(spacing: 3) {
            Text(title.uppercased())
                .font(.system(size: 10, weight: .bold, design: .rounded))
                .foregroundStyle(.white.opacity(0.4))
            Text(value)
                .font(.system(size: 18, weight: .heavy, design: .rounded))
                .foregroundStyle(.white)
                .monospacedDigit()
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        .background(Color.white.opacity(0.05), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
}

// MARK: - Shop

private struct ShopSheet: View {
    @ObservedObject var model: GameModel
    @Environment(\.dismiss) private var dismiss
    @State private var flash: String?

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    colors: [Color(red: 0.05, green: 0.04, blue: 0.14), Color.black],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 14) {
                        HStack {
                            Label("\(model.bankedCrystals) gems", systemImage: "diamond.fill")
                                .font(.system(size: 16, weight: .heavy, design: .rounded))
                                .foregroundStyle(.pink)
                            Spacer()
                            Text("Permanent upgrades")
                                .font(.system(size: 12, weight: .semibold, design: .rounded))
                                .foregroundStyle(.white.opacity(0.45))
                        }
                        .padding(.horizontal, 4)

                        if let flash {
                            Text(flash)
                                .font(.system(size: 13, weight: .bold, design: .rounded))
                                .foregroundStyle(.green)
                        }

                        ForEach(UpgradeID.allCases) { id in
                            upgradeRow(id)
                        }
                    }
                    .padding(20)
                }
            }
            .navigationTitle("Hangar Shop")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") { dismiss() }
                }
            }
        }
        .preferredColorScheme(.dark)
    }

    private func upgradeRow(_ id: UpgradeID) -> some View {
        let lv = model.upgrades.level(of: id)
        let maxed = lv >= id.maxLevel
        let cost = id.cost(for: lv)
        let can = model.upgrades.canBuy(id, bank: model.bankedCrystals)

        return HStack(alignment: .top, spacing: 12) {
            Image(systemName: id.symbol)
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.cyan)
                .frame(width: 40, height: 40)
                .background(Color.cyan.opacity(0.12), in: RoundedRectangle(cornerRadius: 12, style: .continuous))

            VStack(alignment: .leading, spacing: 4) {
                Text(id.title)
                    .font(.system(size: 16, weight: .heavy, design: .rounded))
                    .foregroundStyle(.white)
                Text(id.detail)
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundStyle(.white.opacity(0.5))
                Text(maxed ? "MAXED" : "Lv \(lv)/\(id.maxLevel)")
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .foregroundStyle(maxed ? .green : .white.opacity(0.4))
            }

            Spacer()

            Button {
                if model.purchase(id) {
                    flash = "Upgraded \(id.title)"
                } else {
                    flash = maxed ? "Already maxed" : "Need \(cost) gems"
                }
            } label: {
                Text(maxed ? "MAX" : "\(cost) 💎")
                    .font(.system(size: 13, weight: .black, design: .rounded))
                    .foregroundStyle(can || maxed ? .black : .white.opacity(0.5))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                    .background(
                        (can ? Color.cyan : Color.white.opacity(0.12)),
                        in: Capsule()
                    )
            }
            .buttonStyle(.plain)
            .disabled(maxed)
        }
        .padding(14)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .strokeBorder(.white.opacity(0.1), lineWidth: 1)
        )
    }
}

// MARK: - Daily

private struct DailySheet: View {
    @ObservedObject var model: GameModel
    var onPlay: () -> Void
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        let c = model.dailyStore.challenge
        NavigationView {
            ZStack {
                LinearGradient(
                    colors: [Color(red: 0.12, green: 0.06, blue: 0.02), Color.black],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                VStack(spacing: 18) {
                    Image(systemName: c.modifier.symbol)
                        .font(.system(size: 44, weight: .bold))
                        .foregroundStyle(.yellow)
                        .padding(.top, 12)

                    Text(c.modifier.title)
                        .font(.system(size: 28, weight: .black, design: .rounded))
                        .foregroundStyle(.white)

                    Text(c.modifier.blurb)
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                        .foregroundStyle(.white.opacity(0.65))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)

                    VStack(spacing: 10) {
                        row("Target score", "\(c.targetScore)")
                        row("Reward", "\(c.reward) gems")
                        row("Today best", "\(model.dailyStore.bestToday)")
                        row("Status", model.dailyStore.completedToday ? "Claimed" : "Open")
                    }
                    .padding(16)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                    .padding(.horizontal, 24)

                    if c.modifier == .bossHunt {
                        Text("Defeat at least 1 boss and reach half target.")
                            .font(.system(size: 12, weight: .semibold, design: .rounded))
                            .foregroundStyle(.orange.opacity(0.9))
                    }

                    Spacer()

                    Button {
                        onPlay()
                    } label: {
                        Text(model.dailyStore.completedToday ? "PLAY AGAIN" : "ACCEPT CHALLENGE")
                            .font(.system(size: 17, weight: .heavy, design: .rounded))
                            .foregroundStyle(.black)
                            .frame(maxWidth: 280)
                            .padding(.vertical, 16)
                            .background(
                                LinearGradient(colors: [.yellow, .orange], startPoint: .leading, endPoint: .trailing),
                                in: RoundedRectangle(cornerRadius: 18, style: .continuous)
                            )
                    }
                    .buttonStyle(.plain)
                    .padding(.bottom, 28)
                }
            }
            .navigationTitle("Daily Challenge")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") { dismiss() }
                }
            }
        }
        .preferredColorScheme(.dark)
        .onAppear { model.dailyStore.refreshIfNeeded() }
    }

    private func row(_ title: String, _ value: String) -> some View {
        HStack {
            Text(title)
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .foregroundStyle(.white.opacity(0.5))
            Spacer()
            Text(value)
                .font(.system(size: 15, weight: .heavy, design: .rounded))
                .foregroundStyle(.white)
        }
    }
}
