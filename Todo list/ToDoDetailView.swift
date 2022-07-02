//
//  ToDoDetailView.swift
//  Todo list
//
//  Created by Wong Jun heng on 25/6/22.
//

import SwiftUI

struct ToDoDetailView: View {
    
    @Binding var todo: Todo
    var body: some View {
        VStack{
            TextField("Please enter a title", text: $todo.title)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .padding()
            
            Button {
                withAnimation{
                todo.isCompleted.toggle()
                }
            } label: {
                Text("Mark as \(todo.isCompleted ? "incomplete" : "complete")")
                    .padding()
                    .background(Color.blue)
                     .foregroundColor(.white)
                     .cornerRadius(8)
                     
            }
        }
        .navigationTitle(todo.title)
    }
}

struct ToDoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
