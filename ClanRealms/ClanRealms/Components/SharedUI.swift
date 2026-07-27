import SwiftUI

struct StarRow: View {
    let stars: Int
    var maxStars: Int = 3
    var size: CGFloat = 14

    var body: some View {
        HStack(spacing: 3) {
            ForEach(0..<maxStars, id: \.self) { i in
                Image(systemName: i < stars ? "star.fill" : "star")
                    .foregroundStyle(i < stars ? Color.yellow : Color.white.opacity(0.25))
                    .font(.system(size: size))
            }
        }
    }
}

/// Nine-slice-ish button using Kenney UI art when available.
struct GameButton: View {
    let title: String
    var color: Color = .orange
    var enabled: Bool = true
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(.headline, design: .rounded).weight(.black))
                .foregroundStyle(.white)
                .shadow(color: .black.opacity(0.4), radius: 1, y: 1)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background {
                    ZStack {
                        if UIImage(named: "ui_y_button_rectangle_depth_gloss") != nil {
                            Image("ui_y_button_rectangle_depth_gloss")
                                .resizable()
                                .interpolation(.high)
                        } else {
                            RoundedRectangle(cornerRadius: 14)
                                .fill(LinearGradient(colors: [color, color.opacity(0.75)], startPoint: .top, endPoint: .bottom))
                        }
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .opacity(enabled ? 1 : 0.45)
        }
        .buttonStyle(.plain)
        .disabled(!enabled)
    }
}

struct ResourcePill: View {
    let icon: String
    let value: Int
    let tint: Color

    var body: some View {
        HStack(spacing: 6) {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 22, height: 22)
            Text("\(value)")
                .font(.system(.subheadline, design: .rounded).weight(.bold))
                .foregroundStyle(tint)
                .monospacedDigit()
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 7)
        .background(
            Capsule()
                .fill(Color.black.opacity(0.45))
                .overlay(Capsule().stroke(tint.opacity(0.45), lineWidth: 1.5))
        )
    }
}

struct PanelBackground: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 18, style: .continuous)
            .fill(Color.black.opacity(0.45))
            .overlay(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .stroke(
                        LinearGradient(colors: [.white.opacity(0.25), .white.opacity(0.05)], startPoint: .topLeading, endPoint: .bottomTrailing),
                        lineWidth: 1.5
                    )
            )
    }
}
