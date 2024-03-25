//
//  ProfileViewViewModel.swift
//  ToDoList
//
//  Created by Chingiz on 24.03.24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class ProfileViewViewModel: ObservableObject {
    @Published var user: User? = nil
    
    init() {}
    
    func fetch() {
        guard let userId = Auth.auth().currentUser?.uid else { return}
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .getDocument { [weak self] snapshot, error in
                guard let self else {return}
                guard let data = snapshot?.data(), error == nil else {
                    return
                }
                
                DispatchQueue.main.async {
                    self.user = User(id: data["id"] as? String ?? "",
                                      username: data["username"] as? String ?? "",
                                      email: data["email"] as? String ?? "",
                                      joinDate: data["joinDate"] as? TimeInterval ?? 0
                    )
                }
            }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
