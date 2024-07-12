//
//  ContentView.swift
//  LoginFrontEndExam
//
//  Created by Macky Sevidal on 7/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        if viewModel.authenticated {
            VStack(spacing: 20) {
                Text("Welcome \n\(viewModel.username)")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                Text("Last login: \(Date().formatted(.dateTime))")
                Button("Log out", action: viewModel.logOut)
                    .tint(.red)
                    .buttonStyle(.borderedProminent)
            }
        } else {
            ZStack {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Log in")
                        .foregroundColor(.black)
                        .font(.system(size: 40, weight: .medium, design: .rounded))
                    
                    TextField("Username", text: $viewModel.username)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                    
                    Text("Hint: password is itself and counting numbers from 1 to 3 :)")
                        .font(.system(size: 10, weight: .light, design: .rounded))
                    
                    Button("Log In", role: .cancel, action: viewModel.authenticate)
                        .buttonStyle(.bordered)
                        .tint(.blue)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .alert("Username/Password is not valid", isPresented: $viewModel.invalidLogin, actions: {
                    Button("Dismiss", action: viewModel.invalidLoginAttempt)
                })
                .frame(width: 300)
                Spacer()
            }
            .containerRelativeFrame([.horizontal, .vertical])
            .background(Gradient(colors: [.teal, .cyan, .green]).opacity(0.6))
            .transition(.scale)
        }
        
    }
}

#Preview {
    ContentView()
}
