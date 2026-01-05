import SwiftUI

struct TransactionRow: View {

    let title: String
    let subtitle: String
    let amount: String
    let isIncome: Bool
    let icon: String

    var body: some View {
        HStack(spacing: 16) {

            // MARK: - Icon
            ZStack {
                Circle()
                    .fill(iconBackground)
                    .frame(width: 44, height: 44)

                Image(systemName: icon)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(iconColor)
            }

            // MARK: - Texts
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.primary)

                Text(subtitle)
                    .font(.system(size: 13))
                    .foregroundColor(.secondary)
            }

            Spacer()

            // MARK: - Amount
            Text(amount)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(isIncome ? .green : .red)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 20)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.white)
        )
    }


    private var iconBackground: Color {
        isIncome
        ? Color.green.opacity(0.15)
        : Color.red.opacity(0.15)
    }

    private var iconColor: Color {
        isIncome ? .green : .red
    }
}
#Preview {
    VStack(spacing: 12) {
        TransactionRow(
            title: "Bér",
            subtitle: "2025. márc. 14.",
            amount: "+420 000 Ft",
            isIncome: true,
            icon: "arrow.down"
        )

        TransactionRow(
            title: "Bolt",
            subtitle: "SPAR • kártyás fizetés",
            amount: "-12 430 Ft",
            isIncome: false,
            icon: "cart"
        )
    }
    .padding()
    .background(Color.gray.opacity(0.1))
}
