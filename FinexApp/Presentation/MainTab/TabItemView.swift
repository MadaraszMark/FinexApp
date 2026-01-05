import SwiftUI

struct TabItemView: View {

    let tab: AppTab
    let isSelected: Bool

    var body: some View {
        VStack(spacing: 6) {

            Image(systemName: tab.icon)
                .font(.system(size: 22, weight: .medium))
                .foregroundColor(isSelected ? Color.purple : Color.gray.opacity(0.5))

            Circle()
                .fill(isSelected ? Color.purple : Color.clear)
                .frame(width: 6, height: 6)
        }
        .frame(maxWidth: .infinity)
    }
}
