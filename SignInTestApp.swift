//
//  SignInTestApp.swift
//  SignInTest
//
//  Created by Michael Donnelly on 6/3/24.
//

import SwiftUI
import FirebaseCore

@main
struct SignInTestApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
