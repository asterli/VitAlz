import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel = AuthenticationViewModel()
    
    var body: some View {
        NavigationView {
            VStack() {
                RoundedRectangle(cornerRadius: 30, style: .continuous).foregroundStyle(.linearGradient(colors:[.white, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)).frame(width: 370, height: 600).rotationEffect(.degrees(-70)).offset(y:-150)
                Text(greeting())
                    .font(.custom("Utendo-Black", size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 115/255, green: 79/255, blue: 150/255))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding().offset(y:-200)
                Image("dinosaur")
                    .resizable() // Make the image resizable
                    .aspectRatio(contentMode: .fit) // Maintain the aspect ratio
                    .frame(width: 500, height: 500)
                    .offset(y:-225)

                Spacer()
            }
            
            .navigationBarTitle("", displayMode: .inline)
        }
        .onAppear {
            Task {
                await viewModel.fetchUserData()
            }
        }
    }
    
    func greeting() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        
        if hour >= 0 && hour < 12 {
            return "Good morning, \(viewModel.fullName)!"
        } else if hour >= 12 && hour < 18 {
            return "Good afternoon, \(viewModel.fullName)!"
        } else {
            return "Good evening,\(viewModel.fullName)!"
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeScreen()
        }
    }
}
