import SwiftUI

struct HomeView: View {

    var body: some View {
        ZStack {

            Color.white.ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {

                    // MARK: - Header
                    GreetingHeader()
                        .padding(.top, 16)

                    // MARK: - Balance card
                    BalanceCard()

                    // MARK: - Transactions
                    VStack(alignment: .leading, spacing: 16) {

                        HStack {
                            Text("Legutóbbi tranzakciók")
                                .font(.system(size: 20, weight: .semibold))

                            Spacer()

                            Text("Részletek")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(Color("AuthBackgroundTop"))
                        }
                        .padding(.horizontal, 24)
                        .padding(.top, 20)

                        VStack(spacing: 12) {
                            TransactionRow(
                                title: "Bér",
                                subtitle: "2025. márc. 14.",
                                amount: "+420 000 Ft",
                                isIncome: true,
                                icon: "arrow.down"
                            )

                            TransactionRow(
                                title: "SPAR",
                                subtitle: "Kártyás fizetés",
                                amount: "-12 430 Ft",
                                isIncome: false,
                                icon: "cart"
                            )

                            TransactionRow(
                                title: "Netflix",
                                subtitle: "Előfizetés",
                                amount: "-3 990 Ft",
                                isIncome: false,
                                icon: "tv"
                            )
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 24)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 28, style: .continuous)
                            .fill(Color.white)
                            .shadow(
                                color: Color.black.opacity(0.06),
                                radius: 16,
                                x: 0,
                                y: 8
                            )
                    )
                    .padding(.horizontal, 16)

                    Spacer(minLength: 32)
                }
                .padding(.top, 8)
                .padding(.bottom, 120)
            }
        }
    }
}
#Preview {
    HomeView()
}
