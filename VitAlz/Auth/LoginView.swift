import SwiftUI
import Combine
import FirebaseAnalyticsSwift

private enum FocusableField: Hashable {
    case email
    case password
}

struct LoginView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss

    @FocusState private var focus: FocusableField?

    private func signInWithEmailPassword() {
        Task {
            if await viewModel.signInWithEmailPassword() == true {
                dismiss()
            }
        }
    }

    var body: some View {
    
            VStack(spacing: 20){

                RoundedRectangle(cornerRadius: 30, style: .continuous).foregroundStyle(.linearGradient(colors:[.white, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)).frame(width: 370, height: 600).rotationEffect(.degrees(70)).offset(y:-227)
                Text("Login")
                    .font(.custom("Utendo-Semibold", size: 40))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading).offset(y:-270).foregroundColor(Color(red: 115/255, green: 79/255, blue: 150/255))
                HStack {
                    Image(systemName: "at")
                    TextField("Email", text: $viewModel.email)
                        .textInputAutocapitalization(.never)
                        .font(.custom("Utendo-Regular", size: 17))
                        .disableAutocorrection(true)
                        .focused($focus, equals: .email)
                        .submitLabel(.next)
                        .onSubmit {
                            self.focus = .password
                        }
                }
                .padding(.vertical, 6)
                .background(Divider(), alignment: .bottom)
                .padding(.bottom, 4).offset(y:-280)

                HStack {
                    Image(systemName: "lock")
                    SecureField("Password", text: $viewModel.password)
                        .focused($focus, equals: .password)
                        .font(.custom("Utendo-Regular", size: 17))
                        .submitLabel(.go)
                        .onSubmit {
                            signInWithEmailPassword()
                        }
                }
                .padding(.vertical, 6)
                .background(Divider(), alignment: .bottom)
                .padding(.bottom, 8).offset(y:-280)

                if !viewModel.errorMessage.isEmpty {
                    VStack {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color(UIColor.systemRed))
                    }
                }

                Button(action: signInWithEmailPassword) {
                    if viewModel.authenticationState != .authenticating {
                        Text("Login")
                            .padding(.vertical, 8)
                            .frame(maxWidth: .infinity)
                            .font(.custom("Utendo-Regular", size: 17))
                    } else {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .padding(.vertical, 8)
                            .frame(maxWidth: .infinity)
                    }
                }
                .disabled(!viewModel.isValid)
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent).offset(y:-280)
                

                HStack {
                    Text("Don't have an account yet?")                        .font(.custom("Utendo-Regular", size: 17))

                    
                    Button(action: { viewModel.switchFlow() }) {
                        Text("Sign up")
                            .font(.custom("Utendo-SemiBold", size: 18))
                            .foregroundColor(Color(red: 115/255, green: 79/255, blue: 150/255))
                        
                    }
                }
                .padding([.top, .bottom], 50).offset(y:-280)

                Spacer() // Add a spacer at the end of VStack to push content to the top
            }
            .listStyle(.plain)
            .padding()
            .analyticsScreen(name: "\(Self.self)")
        }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
            LoginView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(AuthenticationViewModel())
    }
}
