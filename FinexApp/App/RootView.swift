import SwiftUI

struct RootView: View {

    @StateObject private var session = AuthSession()

    var body: some View {
        Group {
            if session.isAuthenticated {
                AppShell()
                    .environmentObject(session)
            } else {
                AuthRouter()
                    .environmentObject(session)
            }
        }
    }
}

#Preview {
    RootView()
}
