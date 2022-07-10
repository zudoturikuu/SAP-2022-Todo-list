//
//  MainTodoListView.swift
//  Todo list
//
//  Created by Wong Jun heng on 10/7/22.
//

import SwiftUI

struct MainTodoListView: View {
    
    @AppStorage("username") var username: String = ""
    @ObservedObject var todoManager: TodoManager
    @State var isSheetPresented = false
    
    var body: some View {
        NavigationView {
        List {
            TextField("Enter Username", text: $username)
            ForEach($todoManager.todos) { $todo in
                NavigationLink {
                    ToDoDetailView(todo: $todo)
                 } label: {
                    HStack {
                        Image(systemName: todo.isCompleted ? "checkmark.seal.fill"
                              :"seal")
                    Text(todo.title)
                            .strikethrough(todo.isCompleted)
                            .foregroundColor(todo.isCompleted ?  .blue : .red)
                    Text(todo.isCompleted ? "✔️" : "⚠️")
                        Text(todo.details)
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                }
            }
        }
            .onDelete { indexSet in todoManager.todos.remove(atOffsets: indexSet)
                
            }
            .onMove {
                indices, newOffset in todoManager.todos.move(fromOffsets: indices, toOffset: newOffset)
            }
            
    }
        .navigationTitle("PAW PATROL TODO LIST")
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isSheetPresented = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $isSheetPresented) {
            NewToDoView(todos: $todoManager.todos)
}
    
    }
    }
    }


struct MainTodoListView_Previews: PreviewProvider {
    static var previews: some View {
        MainTodoListView(todoManager: TodoManager())
    }
}
