//
//  HomeView.swift
//  VitAlz
//
//  Created by Jonathan Wu on 2/17/24.
//

import SwiftUI
import Combine
import FirebaseAnalytics
import FirebaseAnalyticsSwift


struct HomeView: View {
    @StateObject var viewModel = AuthenticationViewModel()
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            // Ur highest score
            // Reminders you have this to do at 8 pm
            HomeScreen()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            
            WelcomeView(userId: "1O97YLcDmCQv7soe4JlzQ3X5zcc2")
                .tabItem{
                    Label("List", systemImage: "square.and.pencil")
                }

            ResourceView()
                .tabItem{
                    Label("Resources", systemImage: "doc.richtext")
                }
            GameView()
                .tabItem{
                    Label("Game", systemImage: "gamecontroller")
                }
            UserProfileView().environmentObject(viewModel)
                .tabItem{
                    Label("Account", systemImage: "person")
                }
        }.onAppear {
            Task {
                await viewModel.fetchUserData()
            }
        }
    }

}



struct VitAlzView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      HomeView()
    }
  }
}
