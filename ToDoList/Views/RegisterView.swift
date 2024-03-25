//
//  RegisterView.swift
//  ToDoList
//
//  Created by Chingiz on 24.03.24.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack{
            HeaderView(title: "Register", subTitle: "Start organizing todos", angle: -15, backgroundColor: .orange)
            
            Form{
                TextField("Username", text: $viewModel.username)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Register", backgroundColor: .green) {
                    viewModel.register()
                }
                .padding()
            }
            .offset(y: -50)
            
        }
        
        Spacer()
    }
}

#Preview {
    RegisterView()
}
