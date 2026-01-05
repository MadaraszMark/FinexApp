import SwiftUI

struct BalanceCard: View {

    let balanceText: String

    var body: some View {
        ZStack {

            AuthCardBackground()
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 28,
                        style: .continuous
                    )
                )

            VStack(alignment: .leading) {

                Text("Fő számla")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.white.opacity(0.9))

                Spacer()

                Text(balanceText)
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .minimumScaleFactor(0.75)
            }
            .padding(.vertical, 28)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
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
    BalanceCard(balanceText: "1 252 578 Ft")
}
