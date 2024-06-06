//
//  SignUpView.swift
//  SignInTest
//
//  Created by Michael Donnelly on 6/3/24.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct SignUpView: View {
    
    @Binding var currentShowingView: String
    
    //@AppStorage("uid") var userID: String = ""
    
    @State private var username = ""
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    
    private func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
        
        return passwordRegex.evaluate(with: password)
    }
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Create an Account")
                        .font(.largeTitle)
                        .bold()
                    
                    
                }
                .padding()
                .padding(.top)
                
               
                
                    LoginRegistrationView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .autocapitalization(.none)
                    .padding(.horizontal)
                    .padding(.top, 12)

                    //how to make words white
                    
                    LoginRegistrationView(text: $fullname,
                              title: "Full Name",
                              placeholder: "Enter your name")
                    .padding(.horizontal)
                    .padding(.top, 12)

                    LoginRegistrationView(text: $username,
                              title: "Username",
                              placeholder: "Enter your username")
                    .padding(.horizontal)
                    .padding(.top, 12)

                    LoginRegistrationView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                    .padding(.horizontal)
                    .padding(.top, 12)

                    LoginRegistrationView(text: $confirmPassword,
                              title: "Confirm Password",
                              placeholder: "Confirm your password",
                              isSecureField: true)
                    .padding(.horizontal)
                    .padding(.top, 12)

                Button {
                    AuthService.shared.signUp(email: email, password: password, fullname: fullname, username: username)
                        
                    }
                 label: {
                    HStack {
                        Text("Sign up")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(LinearGradient(colors: [.pink, .purple, .blue], startPoint: .leading, endPoint: .trailing))
                .cornerRadius(10)
                .padding(.top, 24)
                
                Button(action: {
                    
                    withAnimation {
                        self.currentShowingView = "login"
                    }
                }) {
                    Text("Already Have an Account?")
                        .foregroundColor(.black.opacity(0.7))
                }
            }
        }
    }
}
//#Preview {
//    SignUpView()
//}
