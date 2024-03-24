//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Chingiz on 24.03.24.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    init() {}
    
    func login(){
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        
    }
    
    func validate() {
        
    }
}
