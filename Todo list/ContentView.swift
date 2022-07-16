//
//  ContentView.swift
//  Todo list
//
//  Created by Wong Jun heng on 25/6/22.
//

//Purpose: Content view to show things on screen only
import SwiftUI

struct ContentView: View {
    
    @StateObject var todoManager = TodoManager()
    
    var body: some View {
        TabView{
            MainTodoListView(todoManager: todoManager)
                .tabItem {
                    Label("Todos", systemImage: "checkmark.circle.fill")
                }
        
            
            Text("\(todoManager.todos.filter { !$0.isCompleted }.count) undone todos")
                .tabItem {
                    Label("Number of undone Todos", systemImage: "person")
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
    
    





//@State var todos = [
    //Todo(title: "Watch Paw Patrol and fanboy over chase", isCompleted: true, details: "Episodes 69 and 420"),
    //Todo(title: "Die"),
    //Todo(title: "Become a vampire"),
    //Todo(title: "Get Reborn"),
    //Todo(title: "Exact revenge on all who wronged you"),
    //Todo(title: "Pet puppy"),
    //Todo(title: "Hit toodlers")
//]
