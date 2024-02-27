import SwiftUI

struct GameView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Image("vitalzIcon")
                        .resizable() // Make the image resizable
                        .aspectRatio(contentMode: .fit) // Maintain the aspect ratio
                        .frame(width: 75, height: 75) // Set your desired size
                    Text("Games")
                        .font(.custom("Utendo-Black", size: 40))
                        .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                        .padding(.leading) // Add some leading padding to separate the image and text
                    Spacer()
                }
                .padding() // Padding for the HStack
                
                Spacer() // Spacer to push the following content higher up

                NavigationLink(destination: GameScreen()) {
                    Image("alSaysIcon") // Load image from Assets.xcassets
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                }
                Text("Simon Says... Let's Play Al Says!")
                                .font(.custom("Utendo-Semibold", size: 30))
                                .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                                .multilineTextAlignment(.center)
                                .padding(.top, 10)
                Spacer() // Spacer to add some space between the text and the button
                Spacer()
                Spacer()
                Spacer()
                
                Text("More games coming soon...")
                                .font(.custom("Utendo-Regular", size: 20))
                                .foregroundColor(Color(red: 115.0/255.0, green: 79.0/255.0, blue: 150.0/255.0))
                                .padding(.bottom, 20)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Expand VStack to fill the whole screen
            .background(Color.purple.opacity(0.1)) // Set the background color of the ContentView
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
