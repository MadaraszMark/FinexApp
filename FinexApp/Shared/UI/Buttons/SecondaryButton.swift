import SwiftUI

struct SecondaryButton: View {

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
                    .stroke(Color.white, lineWidth: 1.5)
            )
        }
    }
}

#Preview {
    SecondaryButton("Bejelentkezés") {}
        .padding()
        .background(Color.purple)
}

