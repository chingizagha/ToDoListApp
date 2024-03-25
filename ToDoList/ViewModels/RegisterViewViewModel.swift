//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Chingiz on 24.03.24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject {
    
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    init() {}
    
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let self else {return}
            guard let userId = result?.user.uid else {
                return
            }
            
            self.insertUserRecord(userId: userId)
            
            
        }
    }
    
    private func insertUserRecord(userId: String) {
        let newUser = User(id: userId, username: username, email: email, joinDate: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .setData(newUser.asDictionary())


    }
    
    private func validate() -> Bool {
        guard !username.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
}
