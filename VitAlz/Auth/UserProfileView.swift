import SwiftUI
import FirebaseAnalyticsSwift

struct UserProfileView: View {
  @EnvironmentObject var viewModel: AuthenticationViewModel
  @Environment(\.dismiss) var dismiss
  @State var presentingConfirmationDialog = false

  private func deleteAccount() {
    Task {
      if await viewModel.deleteAccount() == true {
        dismiss()
      }
    }
  }

  private func signOut() {
    viewModel.signOut()
  }

    var body: some View {
       List {
         VStack(spacing: 36) { // Adjust the spacing to fit your needs
           HStack {
             Spacer()
             Image(systemName: "person.fill")
               .resizable()
               .frame(width: 100, height: 100)
               .aspectRatio(contentMode: .fit)
               .clipShape(Circle())
               .clipped()
               .padding(4)
               .overlay(Circle().stroke(Color.accentColor, lineWidth: 2))
             Spacer()
           }
           Button(action: {}) {
             Text("edit")
           }
           .font(.custom("Utendo-SemiBold", size: 15))
           .frame(maxWidth: .infinity, alignment: .center)
           .padding(.bottom, 16)
         }
         .listRowBackground(Color(UIColor.systemGroupedBackground))
         .listRowInsets(EdgeInsets())

         // Custom Row for Name
         HStack {
           Text("Name")
                 .font(.custom("Utendo-Regular", size: 17))

           Spacer()
           Text(viewModel.fullName)
         }
         .padding(.vertical, 8) // Adjust padding as needed

         // Custom Row for Email
         HStack {
           Text("Email")
                 .font(.custom("Utendo-Regular", size: 17))

           Spacer()
           Text(viewModel.displayName)
         }
         .padding(.vertical, 8) // Adjust padding as needed

         // Custom Row for Birthdate
         HStack {
           Text("Birthdate")
                 .font(.custom("Utendo-Regular", size: 17))

           Spacer()
           Text(viewModel.birthdate, style: .date)                 .font(.custom("Utendo-Regular", size: 17))

         }
         .padding(.vertical, 8)
        
      Section {
        Button(role: .cancel, action: signOut) {
          HStack {
            Spacer()
            Text("Sign out")
                  .font(.custom("Utendo-SemiBold", size: 17))

            Spacer()
          }
        }
      }
      Section {
        Button(role: .destructive, action: { presentingConfirmationDialog.toggle() }) {
          HStack {
            Spacer()
            Text("Delete Account")
                  .font(.custom("Utendo-SemiBold", size: 17))

            Spacer()
          }
        }
      }
    }
    .navigationTitle("Profile")
    .navigationBarTitleDisplayMode(.inline)
    .analyticsScreen(name: "\(Self.self)")
    .confirmationDialog("Deleting your account is permanent. Do you want to delete your account?",
                        isPresented: $presentingConfirmationDialog, titleVisibility: .visible) {
      Button("Delete Account", role: .destructive, action: deleteAccount)
      Button("Cancel", role: .cancel, action: { })
    }
  }
}

struct UserProfileView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      UserProfileView()
        .environmentObject(AuthenticationViewModel())
    }
  }
}
