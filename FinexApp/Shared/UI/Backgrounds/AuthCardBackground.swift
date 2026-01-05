import SwiftUI

struct AuthCardBackground: View {

    var body: some View {
        ZStack {

            // MARK: - Base gradient
            LinearGradient(
                colors: [
                    Color("AuthBackgroundTop"),
                    Color("AuthBackgroundBottom")
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            // MARK: - Soft depth shapes

            Circle()
                .fill(Color.white.opacity(0.08))
                .frame(width: 140, height: 140)
                .offset(x: 90, y: -80)

            Circle()
                .fill(Color.black.opacity(0.10))
                .frame(width: 180, height: 180)
                .offset(x: -100, y: 100)

            // MARK: - Dot texture

            VStack(spacing: 6) {
                ForEach(0..<3, id: \.self) { _ in
                    HStack(spacing: 6) {
                        ForEach(0..<4, id: \.self) { _ in
                            Circle()
                                .fill(Color.white.opacity(0.22))
                                .frame(width: 5, height: 5)
                        }
                    }
                }
            }
            .offset(x: 70, y: 30)
        }
    }
}

#Preview {
    AuthCardBackground()
        .frame(height: 180)
        .clipShape(RoundedRectangle(cornerRadius: 28))
}
