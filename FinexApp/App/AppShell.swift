import SwiftUI

struct AppShell: View {

    @State private var selectedTab: AppTab = .home

    var body: some View {
        ZStack(alignment: .bottom) {

            // MARK: - Active screen
            Group {
                switch selectedTab {
                case .home:
                    HomeView()

                case .cards:
                    Color.white

                case .transactions:
                    Color.white

                case .assistant:
                    Color.white

                case .profile:
                    Color.white
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            // MARK: - Bottom navigation
            BottomTabBar(
                selected: $selectedTab
            )
        }
    }
}

#Preview {
    AppShell()
}
