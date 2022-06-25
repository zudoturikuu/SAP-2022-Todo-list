//
//  Todo.swift
//  Todo list
//
//  Created by Wong Jun heng on 25/6/22.
//

import Foundation

struct Todo: Identifiable {
    
    let id = UUID()
    
    var title: String
    var isCompleted: Bool = false
    var details = ""
}
