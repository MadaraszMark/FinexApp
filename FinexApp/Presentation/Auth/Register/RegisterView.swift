import SwiftUI

struct RegisterView: View {

    let onBack: () -> Void
    let onRegisterSuccess: () -> Void
    @StateObject private var vm = RegisterViewModel()

    @State private var isPasswordVisible = false
    @State private var showSuccessAlert = false

    var body: some View {
        ZStack {

            // MARK: - Background
            AuthBackgroundView()

            GeometryReader { geo in
                VStack(spacing: 0) {

                    // MARK: - Header
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Fiók\nlétrehozása")
                            .font(.system(size: 44, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)
                    .padding(.top, geo.size.height * 0.10)

                    Spacer()

                    // MARK: - Register card
                    ScrollView {
                        VStack(spacing: 24) {

                            Text("Regisztráció")
                                .font(.system(size: 30, weight: .semibold))
                                .frame(maxWidth: .infinity, alignment: .leading)

                            field("Vezetéknév", text: $vm.lastName)
                            field("Keresztnév", text: $vm.firstName)
                            field("E-mail cím", text: $vm.email, keyboard: .emailAddress)
                            field("Telefonszám", text: $vm.phone, keyboard: .phonePad)

                            VStack(spacing: 8) {
                                HStack {
                                    if isPasswordVisible {
                                        TextField("Jelszó", text: $vm.password)
                                    } else {
                                        SecureField("Jelszó", text: $vm.password)
                                    }

                                    Button {
                                        isPasswordVisible.toggle()
                                    } label: {
                                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                            .foregroundColor(Color("AuthBackgroundTop"))
                                    }
                                }
                                .font(.system(size: 20))
                                .padding(.vertical, 12)

                                Divider()
                            }

                            HStack {
                                Button("Vissza", action: onBack)
                                    .font(.system(size: 20))
                                    .foregroundColor(.gray)

                                Spacer()

                                PrimaryButton("Regisztráció") {
                                    Task {
                                        await vm.register()
                                    }
                                }
                                .frame(width: 200)
                                .disabled(vm.isLoading)
                            }

                            if let error = vm.errorMessage {
                                Text(error)
                                    .foregroundColor(.red)
                                    .font(.system(size: 14))
                            }
                        }
                        .padding(24)
                        .background(
                            RoundedRectangle(cornerRadius: 28)
                                .fill(Color.white)
                                .shadow(
                                    color: Color.black.opacity(0.08),
                                    radius: 12,
                                    y: -2
                                )
                        )
                    }
                }
            }
            .ignoresSafeArea(edges: .bottom)
        }
        .onChange(of: vm.isSuccess) {
            if vm.isSuccess {
                showSuccessAlert = true
            }
        }
        .alert(
            "Sikeres regisztráció",
            isPresented: $showSuccessAlert
        ) {
            Button("Bejelentkezés") {
                onRegisterSuccess()
            }
        } message: {
            Text("A fiók sikeresen létrejött. Jelentkezz be a folytatáshoz.")
        }
    }

    // MARK: - Field helper
    private func field(
        _ title: String,
        text: Binding<String>,
        keyboard: UIKeyboardType = .default
    ) -> some View {
        VStack(spacing: 8) {
            TextField(title, text: text)
                .font(.system(size: 20))
                .keyboardType(keyboard)
                .textInputAutocapitalization(.never)
                .padding(.vertical, 12)

            Divider()
        }
    }
}

#Preview {
    RegisterView(
        onBack: {},
        onRegisterSuccess: {}
    )
}

