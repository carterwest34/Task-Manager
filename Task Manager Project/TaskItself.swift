//
//  TaskItself.swift
//  Task Manager Project
//
//  Created by Carter West on 9/18/18.
//  Copyright © 2018 Carter West. All rights reserved.
//

import Foundation

//Setting up class for our tasks that we will be adding. Our parameters will include our task, descritption of our task, complete status, an optional value of due date, and the priority rating. When we add our tasks, we will pass in eahc user input for the parameters of the class.

class Task {
    
    var task: String
    
    var description: String
    
    var completed = false //Set completed status to false by default. It's not like the task will be completed as soon as they create it...
    
    var completeByDate: Date? //Make sure the due date variable is optional, because not always will the user want to add a date to be completed by.
    
    var priority: Int
    
    init(task: String, description: String, completed: Bool, completeByDate: Date?, priority: Int) {
        self.description = description
        self.task = task
        self.completed = completed
        self.completeByDate = completeByDate
        self.priority = priority
    }
}
