//
//  ContentView.swift
//  SignInTest
//
//  Created by Michael Donnelly on 6/3/24.
//

import SwiftUI
import FirebaseAuth
struct ContentView: View {
    
    //@AppStorage("uid") var userID: String = ""
    @StateObject var vm: ContentViewModel = ContentViewModel()
    
    var body: some View {
        if vm.userSession == nil {
            AuthVM()
            
        } else {
            Text("Logged in")
            
            Button(action: {
                let firebaseAuth = Auth.auth()
                do {
                  try firebaseAuth.signOut()
                    vm.userSession = nil
                } catch let signOutError as NSError {
                  print("Error signing out: %@", signOutError)
                }
            }) {
                Text("Sign out")
            }
        }
    }
    
}
#Preview {
    ContentView()
}
