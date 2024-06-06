//
//  LoginView.swift
//  SignInTest
//
//  Created by Michael Donnelly on 6/3/24.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct LoginView: View {
    
    @Binding var currentShowingView: String
    
    //@AppStorage("uid") var userID: String = ""
    
    @State private var password: String = ""
    @State private var email: String = ""
    
    private func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@","^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
        
        return passwordRegex.evaluate(with: password)
    }
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Welcome Back")
                        .font(.largeTitle)
                        .bold()
                    
                    //Spacer()
                }
                .padding()
                .padding(.top)
                
                //Spacer()
                
                HStack {
                    Image(systemName: "mail")
                    TextField("Email", text: $email)
                    
                    Spacer()
                    
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black))
                        .padding()
                
                HStack {
                    Image(systemName: "lock")
                    SecureField("password", text: $password)
                    
                    Spacer()
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black))
                        .padding()

            }
            
            
            
        }
                
        Button(action: {
            withAnimation {
                self.currentShowingView = "Sign up"
            }
            
            
        }) {
            Text("Dont have an account?")
                .foregroundColor(.black.opacity(0.7))
        }
        
        
        Spacer()
        Spacer()
        
       Button {
           
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    print(error)
                    return
                    // ...
                }
                
                if let authResult = authResult {
                    print(authResult.user.uid)
                    withAnimation {
                        //userID = authResult.user.uid
                    }
                }
            }
            
            
        } label: {
            Text("Sign in")
                .foregroundColor(.white)
                .font(.title3)
                .bold()
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color.black))
                .padding(.horizontal)
        }
    }
}


//#Preview {
//    LoginView()
//}
