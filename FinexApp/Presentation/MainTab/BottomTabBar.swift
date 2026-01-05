import SwiftUI

struct BottomTabBar: View {

    @Binding var selected: AppTab

    var body: some View {
        ZStack(alignment: .bottom) {

            // Background
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .fill(Color.white)
                .shadow(
                    color: Color.black.opacity(0.08),
                    radius: 20,
                    y: -4
                )
                .frame(height: barHeight)
                .ignoresSafeArea(edges: .bottom)

            HStack {
                ForEach(AppTab.allCases, id: \.self) { tab in
                    TabItemView(
                        tab: tab,
                        isSelected: selected == tab
                    )
                    .onTapGesture {
                        selected = tab
                    }
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 14)
            .padding(.bottom, bottomInset)
        }
    }

    // MARK: - Dynamic sizing

    private var bottomInset: CGFloat {
        UIApplication.shared
            .connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }
            .first?
            .safeAreaInsets.bottom ?? 20
    }

    private var barHeight: CGFloat {
        64 + bottomInset
    }
}
