//
//  ContentView.swift
//  Todo list
//
//  Created by Wong Jun heng on 25/6/22.
//

import SwiftUI

struct ContentView: View {
    
    //@State var todos = [
        //Todo(title: "Watch Paw Patrol and fanboy over chase", isCompleted: true, details: "Episodes 69 and 420"),
        //Todo(title: "Die"),
        //Todo(title: "Become a vampire"),
        //Todo(title: "Get Reborn"),
        //Todo(title: "Exact revenge on all who wronged you"),
        //Todo(title: "Pet puppy"),
        //Todo(title: "Hit toodlers")
    //]
    
    @State var isSheetPresented = false
    
    @StateObject var todoManager = TodoManager()
    
    var body: some View {
        NavigationView {
            List {
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
    }
        .sheet(isPresented: $isSheetPresented) {
            NewToDoView(todos: $todoManager.todos)
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
             }
          }
    
    }

