//
//  TaskItself.swift
//  Task Manager Project
//
//  Created by Carter West on 9/18/18.
//  Copyright © 2018 Carter West. All rights reserved.
//

import Foundation

class Task {
    
    var task: String
    var description: String
    var completed = false
    var completeByDate: Date?
    var priority: Int
    
    init(task: String, description: String, completed: Bool, completeByDate: Date?, priority: Int) {
        self.description = description
        self.task = task
        self.completed = completed
        self.completeByDate = completeByDate
        self.priority = priority
    }
}
