//
//  NewToDoView.swift
//  Todo list
//
//  Created by Wong Jun heng on 25/6/22.
//

import SwiftUI

struct NewToDoView: View {

 @State var todo = ""

 @Binding var todos: [Todo]

 @Environment(\.presentationMode) var presentationMode

 var body: some View {
 Form {
 TextField("Task name", text: $todo)

 Button("Save Todo") {
 // Do some magic to save todo
 todos.append(Todo(title: todo))
 presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct NewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NewToDoView(todos: .constant([]))
    }
}


//struct NewToDoView: View {
    
//@State var todo = ""
//@Binding var todos: [Todo]
//@Environment(\.presentationMode) var presentationMode

    
    //var body: some View {
    //    Form {
           // TextField("Task name", text: $todo)
            
           // Button("Save Todo") {
              //  todos.append(Todo(title: todo))
               // presentationMode.wrappedValue.dismiss()
