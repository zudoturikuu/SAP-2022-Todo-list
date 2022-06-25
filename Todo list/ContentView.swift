//
//  ContentView.swift
//  Todo list
//
//  Created by Wong Jun heng on 25/6/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var todos = [
        Todo(title: "Watch Paw Patrol and simp for chase", isCompleted: true, details: "Episodes 69 and 420"),
        Todo(title: "Die"),
        Todo(title: "Become a vampire"),
        Todo(title: "Get Reborn"),
        Todo(title: "Exact revenge on all who wronged you"),
        Todo(title: "Pet puppy")


    ]
    var body: some View {
        NavigationView {
            List {
                ForEach($todos) { $todo in
                    NavigationLink {
                        ToDoDetailView(todo: $todo)
                     } label: {
                        HStack {
                            Image(systemName: todo.isCompleted ? "checkmark.circle.fill"
                                  :"circle")
                        Text(todo.title)
                                .strikethrough(todo.isCompleted)
                            Text(todo.details)
                                .font(.caption)
                                .foregroundColor(.gray)
                                
                    }
                }
            }
                .onDelete { indexSet in todos.remove(atOffsets: indexSet)
                    
                }
                .onMove {
                    indices, newOffset in todos.move(fromOffsets: indices, toOffset: newOffset)
                }
                
        }
            .navigationTitle("TODO TODO TODO")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
             }
          }
    
    }

