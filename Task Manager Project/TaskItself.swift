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

    
    init(task: String, description: String, completed: Bool) {
        self.description = description
        self.task = task
        self.completed = completed
    }
}
