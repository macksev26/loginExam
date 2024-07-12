//
//  ViewModel.swift
//  LoginFrontEndExam
//
//  Created by Macky Sevidal on 7/12/24.
//

import Foundation
import SwiftUI

extension ContentView {
    class ViewModel: ObservableObject {
        
        @AppStorage("AUTH_KEY") var authenticated = false {
            willSet { objectWillChange.send() }
        }
        @AppStorage("USER_KEY") var username = ""
        
        @Published var invalidLogin: Bool = false
        @Published var password = ""
        
        private var sampleUsername = "username"
        private var samplePassword = "password123"
        
        
        func toggleAuthentication() {
            self.password = ""
            
            withAnimation(.spring()) {
                authenticated.toggle()
            }
        }
        
        func authenticate() {
            guard self.username.lowercased() == sampleUsername else {
                self.invalidLogin = true
                return
            }
            
            guard self.password.lowercased() == samplePassword else {
                self.invalidLogin = true
                return
            }
            
            toggleAuthentication()
        }
        
        func invalidLoginAttempt() {
            print("Login denied")
        }
        
        func logOut() {
            toggleAuthentication()
        }
    }
}
