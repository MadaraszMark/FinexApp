import SwiftUI

struct PrimaryButton: View {

    let title: String
    let action: () -> Void

    init(_ title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.system(size: 20, weight: .semibold))

                Spacer()

                Image(systemName: "arrow.right")
            }
            .padding()
            .foregroundColor(.white)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color("AuthBackgroundTop"))
                    .shadow(
                        color: Color("AuthBackgroundTop").opacity(0.35),
                        radius: 12,
                        x: 0,
                        y: 6
                    )
            )
        }
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.2).ignoresSafeArea()
        PrimaryButton("Belépés") {}
            .padding()
    }
}
