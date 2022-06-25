//
//  ContentView.swift
//  Todo list
//
//  Created by Wong Jun heng on 25/6/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var todos = [
        Todo(title: "Watch Paw Patrol and simp for chase"),
        Todo(title: "Die"),
        Todo(title: "Become a vampire"),
        Todo(title: "Get Reborn")
    ]
    var body: some View {
        List(todos) {
            todo in Text(todo.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
