//
//  ToDoDetailView.swift
//  Todo list
//
//  Created by Wong Jun heng on 25/6/22.
//

import SwiftUI

struct ToDoDetailView: View {
    
    @Binding var todo: Todo
    @State var startDate = Date()
    @State var endDate = Date()
    var body: some View {
        VStack{
            TextField("Please enter a title", text: $todo.title)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .padding()
            
            DatePicker(
                    "Start Date",
                    selection: $startDate,
                    displayedComponents: [.date]
                )
            
            DatePicker(
                    "End Date",
                    selection: $endDate,
                    displayedComponents: [.date]
                )
            
            
            Button {
                withAnimation{
                todo.isCompleted.toggle()
                }
            } label: {
                Text("Mark as \(todo.isCompleted ? "incomplete" : "complete")")
                    .padding()
                    .background(Color.blue)
                     .foregroundColor(.white)
                     .cornerRadius(10)
            }
            
        }
        .navigationTitle(todo.title)
    }
}

struct ToDoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoDetailView(todo: .constant(Todo(title: "Watch Paw Patrol")))
    }
}
