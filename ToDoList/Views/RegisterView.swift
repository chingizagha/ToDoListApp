//
//  RegisterView.swift
//  ToDoList
//
//  Created by Chingiz on 24.03.24.
//

import SwiftUI

struct RegisterView: View {
    
    @State var username = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack{
            HeaderView(title: "Register", subTitle: "Start organizing todos", angle: -15, backgroundColor: .orange)
            
            Form{
                TextField("Username", text: $username)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Register", backgroundColor: .green) {
                    // Attempt register
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
