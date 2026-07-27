import SwiftUI

struct ContentView: View {
    @EnvironmentObject var progress: PlayerProgress

    var body: some View {
        HomeView()
            .preferredColorScheme(.dark)
            .statusBarHidden()
            .persistentSystemOverlays(.hidden)
    }
}

#Preview {
    ContentView()
        .environmentObject(PlayerProgress())
}
