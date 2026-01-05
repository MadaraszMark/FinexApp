import SwiftUI

enum AuthRoute: Hashable {
    case welcome
    case login
    case register
}

struct AuthRouter: View {

    @State private var path: [AuthRoute] = []

    var body: some View {
        NavigationStack(path: $path) {

            WelcomeView(
                onRegisterTap: {
                    path.append(.register)
                },
                onLoginTap: {
                    path.append(.login)
                }
            )
            .navigationDestination(for: AuthRoute.self) { route in
                switch route {

                case .welcome:
                    WelcomeView(
                        onRegisterTap: {
                            path.append(.register)
                        },
                        onLoginTap: {
                            path.append(.login)
                        }
                    )

                case .login:
                    LoginView(
                        onBack: {
                            path.removeLast()
                        }
                    )

                case .register:
                    RegisterView(
                        onBack: {
                            path.removeLast()
                        },
                        onRegisterSuccess: {
                            path.removeAll()
                            path.append(.login)
                        }
                    )

                }
            }
        }
    }
}
