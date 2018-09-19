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
    
    init(task: String, description: String, completed: Bool, completeByDate: Date?) {
        self.description = description
        self.task = task
        self.completed = completed
        self.completeByDate = completeByDate
    }
}
