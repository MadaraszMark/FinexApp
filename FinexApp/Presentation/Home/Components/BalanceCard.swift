import SwiftUI

struct BalanceCard: View {

    var body: some View {
        ZStack {

            // MARK: - Background
            AuthCardBackground()
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 28,
                        style: .continuous
                    )
                )

            // MARK: - Content
            VStack(alignment: .leading) {

                Text("Fő számla")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.white.opacity(0.9))

                Spacer()

                Text("1 252 578 Ft")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.white)
            }
            .padding(.vertical, 28)
            .padding(.leading, 20)
            .padding(.trailing, 110)
        }
        .frame(maxWidth: .infinity)
        .aspectRatio(1.8, contentMode: .fit)
        .shadow(
            color: Color.black.opacity(0.15),
            radius: 20,
            y: 12
        )
        .padding(.horizontal, 24)
    }
}

#Preview {
    BalanceCard()
}
