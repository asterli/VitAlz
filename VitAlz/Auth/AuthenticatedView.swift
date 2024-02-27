import SwiftUI

extension AuthenticatedView where Unauthenticated == EmptyView {
    init(@ViewBuilder content: @escaping () -> Content) {
        self.unauthenticated = nil
        self.content = content
    }
}

struct AuthenticatedView<Content, Unauthenticated>: View where Content: View, Unauthenticated: View {
    @StateObject private var viewModel = AuthenticationViewModel()
    @State private var presentingLoginScreen = false
    @State private var presentingProfileScreen = false

    var unauthenticated: Unauthenticated?
    @ViewBuilder var content: () -> Content

    public init(unauthenticated: Unauthenticated?, @ViewBuilder content: @escaping () -> Content) {
        self.unauthenticated = unauthenticated
        self.content = content
    }

    public init(@ViewBuilder unauthenticated: @escaping () -> Unauthenticated, @ViewBuilder content: @escaping () -> Content) {
        self.unauthenticated = unauthenticated()
        self.content = content
    }

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            switch viewModel.authenticationState {
            case .unauthenticated, .authenticating:
                VStack {
                    if let unauthenticated {
                        unauthenticated
                    } else {
                        Text("You're not logged in.")
                    }
                    Button("Log In!") {
                        viewModel.reset()
                        presentingLoginScreen.toggle()
                    }.padding()
                        .background(Color.white)
                        .clipShape(Capsule())
                        .foregroundColor(.purple)
                        .font(.custom("Utendo-SemiBold", size: 18))

                }
                .sheet(isPresented: $presentingLoginScreen) {
                    AuthenticationView()
                        .environmentObject(viewModel)
                }
                .padding()
            case .authenticated:
                VStack {
                    content()
                }
            }
        }
    }
}

struct AuthenticatedView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticatedView {
            Text("You're signed in.")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(.yellow)
        }
    }
}
