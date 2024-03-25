//
//  NewItemsView.swift
//  ToDoList
//
//  Created by Chingiz on 24.03.24.
//

import SwiftUI

struct NewItemsView: View {
    @StateObject var viewModel = NewItemsViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Task")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form{
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TLButton(title: "Save", backgroundColor: .pink) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Error"), 
                      message: Text("Please fill in all fields and select due date that is today or newer."))
            })
        }
    }
}

#Preview {
    NewItemsView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}

