//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Chingiz on 24.03.24.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
