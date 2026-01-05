import SwiftUI

struct GreetingHeader: View {

    let name: String
    @EnvironmentObject var session: AuthSession

    var body: some View {
        HStack(alignment: .center) {

            VStack(alignment: .leading, spacing: 4) {
                Text("Szia,")
                    .font(.system(size: 16))
                    .foregroundColor(.secondary)

                Text(name)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.primary)
            }

            Spacer()

            HStack(spacing: 16) {

                Button(action: {}) {
                    Image(systemName: "bell")
                        .font(.system(size: 18))
                        .foregroundColor(.primary)
                        .frame(width: 40, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.gray.opacity(0.2))
                        )
                }

                Button {
                    session.logout()
                } label: {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .font(.system(size: 18))
                        .foregroundColor(.red)
                        .frame(width: 40, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.red.opacity(0.3))
                        )
                }
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, 16)
    }
}

#Preview {
    GreetingHeader(name: "John Doe")
        .environmentObject(AuthSession())
}
