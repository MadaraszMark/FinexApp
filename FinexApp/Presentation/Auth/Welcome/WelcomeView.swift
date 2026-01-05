import SwiftUI

struct WelcomeView: View {
    
    let onRegisterTap: () -> Void
    let onLoginTap: () -> Void

    var body: some View {
        ZStack {

            // MARK: - Background
            AuthBackgroundView()

            // MARK: - Content
            VStack(spacing: 32) {

                Spacer()

                VStack(spacing: 16) {
                    Text("FineX")
                        .font(.system(size: 44, weight: .bold))
                        .foregroundColor(.white)

                    Circle()
                        .stroke(Color.white, lineWidth: 2)
                        .frame(width: 52, height: 48)
                        .overlay(
                            Image(systemName: "checkmark")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .bold))
                        )
                }

                Spacer()

                VStack(spacing: 16) {
                    PrimaryButton("Regisztráció") {
                        onRegisterTap()
                    }

                    SecondaryButton("Bejelentkezés") {
                        onLoginTap()
                    }
                }
                .padding(.horizontal, 24)

                Spacer(minLength: 32)
            }
        }
    }
}

#Preview {
    WelcomeView(
        onRegisterTap: {},
        onLoginTap: {}
    )
}
