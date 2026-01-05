import SwiftUI

struct MainTabView: View {

    @State private var selectedTab: AppTab = .home

    var body: some View {
        ZStack(alignment: .bottom) {

            Color(.systemGroupedBackground)
                .ignoresSafeArea()

            BottomTabBar(selected: $selectedTab)
        }
    }
}

#Preview {
    MainTabView()
}
