import SwiftUI

struct LoginView: View {
    
    let onBack: () -> Void
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @StateObject private var vm = LoginViewModel()
    @EnvironmentObject var session: AuthSession
    
    var body: some View {
        ZStack {
            
            // MARK: - Background
            AuthBackgroundView()
            
            GeometryReader { geo in
                VStack(spacing: 0) {
                    
                    // MARK: - Header text
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Örülünk, hogy\nújra itt vagy!")
                            .font(.system(size: 44, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)
                    .padding(.top, geo.size.height * 0.32)
                    
                    Spacer()
                    
                    // MARK: - Login card
                    VStack(spacing: 24) {
                        
                        Text("Bejelentkezés")
                            .font(.system(size: 30, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(spacing: 8) {
                            TextField("E-mail cím", text: $email)
                                .font(.system(size: 20))
                                .keyboardType(.emailAddress)
                                .textInputAutocapitalization(.never)
                                .padding(.vertical, 12)
                                .onChange(of: email) {
                                    vm.email = email
                                }
                            Divider()
                        }
                        
                        VStack(spacing: 8) {
                            HStack {
                                if isPasswordVisible {
                                    TextField("Jelszó", text: $password)
                                        .font(.system(size: 20))
                                        .onChange(of: password) {
                                            vm.password = password
                                        }
                                } else {
                                    SecureField("Jelszó", text: $password)
                                        .font(.system(size: 20))
                                        .onChange(of: password) {
                                            vm.password = password
                                        }
                                }
                                
                                Button {
                                    isPasswordVisible.toggle()
                                } label: {
                                    Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                        .foregroundColor(Color("AuthBackgroundTop"))
                                }
                            }
                            .padding(.vertical, 12)
                            
                            Divider()
                        }
                        
                        HStack {
                            Button("Vissza") {
                                onBack()
                            }
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                            
                            Spacer()
                            
                            PrimaryButton("Belépés") {
                                Task {
                                    await vm.login()
                                }
                            }
                            .font(.system(size: 20))
                            .frame(width: 180)
                        }
                        
                        // Forgot password
                        VStack(spacing: 4) {
                            Text("Elfelejtetted a jelszavad?")
                                .foregroundColor(.gray)
                            
                            Button("Koppints a visszaállításhoz") {
                            }
                            .fontWeight(.semibold)
                        }
                        .font(.system(size: 16))
                        .padding(.top, 8)
                        
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
            .ignoresSafeArea(edges: .bottom)
            .onChange(of: vm.isLoggedIn) {
                if vm.isLoggedIn {
                    session.loginSucceeded()
                    print("LOGIN OK")
                }
            }


        }
    }
}
#Preview {
    LoginView(onBack: {})
}
