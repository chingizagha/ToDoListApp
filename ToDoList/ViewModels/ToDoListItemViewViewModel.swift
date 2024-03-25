//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Chingiz on 24.03.24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

// ViewModel for only one item
class ToDoListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        guard let id = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
