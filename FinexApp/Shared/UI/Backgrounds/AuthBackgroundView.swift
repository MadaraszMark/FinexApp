import SwiftUI

struct AuthBackgroundView: View {

    var body: some View {
        ZStack {

            // MARK: - Gradient background
            LinearGradient(
                colors: [
                    Color("AuthBackgroundTop"),
                    Color("AuthBackgroundBottom")
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            // MARK: - Large soft shapes

            Circle()
                .fill(Color.white.opacity(0.08))
                .frame(width: 260, height: 260)
                .offset(x: 190, y: -280)

            Circle()
                .fill(Color.black.opacity(0.10))
                .frame(width: 320, height: 320)
                .offset(x: -180, y: 220)

            Circle()
                .fill(Color.white.opacity(0.10))
                .frame(width: 140, height: 140)
                .offset(x: 0, y: -80)

            // MARK: - Dot grid

            VStack(spacing: 8) {
                ForEach(0..<3, id: \.self) { _ in
                    HStack(spacing: 8) {
                        ForEach(0..<4, id: \.self) { _ in
                            Circle()
                                .fill(Color.white.opacity(0.22))
                                .frame(width: 6, height: 6)
                        }
                    }
                }
            }
            .offset(x: 120, y: 40)
            VStack(spacing: 8) {
                ForEach(0..<3, id: \.self) { _ in
                    HStack(spacing: 8) {
                        ForEach(0..<4, id: \.self) { _ in
                            Circle()
                                .fill(Color.white.opacity(0.22))
                                .frame(width: 6, height: 6)
                        }
                    }
                }
            }
            .offset(x: -140, y: -190)

            // MARK: - Decorative lines

            Group {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white.opacity(0.12))
                    .frame(width: 42, height: 6)
                    .rotationEffect(.degrees(-15))
                    .offset(x: -140, y: -300)

                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white.opacity(0.12))
                    .frame(width: 42, height: 6)
                    .rotationEffect(.degrees(-15))
                    .offset(x: -120, y: -285)

                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white.opacity(0.10))
                    .frame(width: 50, height: 6)
                    .rotationEffect(.degrees(15))
                    .offset(x: 140, y: 280)

                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white.opacity(0.08))
                    .frame(width: 36, height: 6)
                    .rotationEffect(.degrees(20))
                    .offset(x: 100, y: -140)
            }
        }
    }
}

#Preview {
    AuthBackgroundView()
}
