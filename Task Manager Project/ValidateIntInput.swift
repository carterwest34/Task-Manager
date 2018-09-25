//
//  ValidateIntInput.swift
//  Task Manager Project
//
//  Created by Carter West on 9/20/18.
//  Copyright © 2018 Carter West. All rights reserved.
//

import Foundation

class ValidateIntInput {
    
    func addPrioChoiceValidate() -> Int {
        var prioAddChoice = Int(readLine()!)
        while prioAddChoice == nil || prioAddChoice! < 1 || prioAddChoice! > 10 {
            print("Please provide a valid priority")
            prioAddChoice = Int(readLine()!)
        }
        return prioAddChoice!
    }
    
    func markCompleteValidate() -> Int {
        var markCompleteChoice = Int(readLine()!)
        while markCompleteChoice == nil || markCompleteChoice! <= 0 || markCompleteChoice! > taskArray.count {
            print("Please provide a valid task index")
            markCompleteChoice = Int(readLine()!)
        }
        return markCompleteChoice!
    }
    
    func markIncompleteValidate() -> Int {
        var markIncompleteChoice = Int(readLine()!)
        while markIncompleteChoice == nil || markIncompleteChoice! <= 0 || markIncompleteChoice! > completedArray.count {
            print("Please provide a valid task index")
            markIncompleteChoice = Int(readLine()!)
        }
        return markIncompleteChoice!
    }
    
    func deleteTaskValidate() -> Int {
        var deleteChoice = Int(readLine()!)
        while deleteChoice == nil || deleteChoice! <= 0 || deleteChoice! > taskArray.count {
            print("Please provide a valid task index")
            deleteChoice = Int(readLine()!)
        }
        return deleteChoice!
    }
    
    func chooseEditTask() -> Int {
        var editTaskChoice = Int(readLine()!)
        while editTaskChoice == nil || editTaskChoice! <= 0 || editTaskChoice! > sortedTask.count {
            print("Please provide a valid task index")
            editTaskChoice = Int(readLine()!)
        }
        return editTaskChoice!
}
    
    func chooseEditAspect() -> Int {
        var editAspectChoice = Int(readLine()!)
        while editAspectChoice == nil || editAspectChoice! < 1 || editAspectChoice! > 4 {
            print("Please provide a valid index (1 - 4)")
            editAspectChoice = Int(readLine()!)
        }
        return editAspectChoice!
}
    func editPriorityChoice() -> Int {
        var editPriorityValidate = Int(readLine()!)
        while editPriorityValidate == nil || editPriorityValidate! < 1 || editPriorityValidate! > 10 {
            print("Please provide a valid priority")
            editPriorityValidate = Int(readLine()!)
        }
        return editPriorityValidate!
    }
    func chooseEditAspectIfNoDateAvailable() -> Int {
        var editAspectChoice2 = Int(readLine()!)
        while editAspectChoice2 == nil || editAspectChoice2! < 1 || editAspectChoice2! > 3 {
            print("Please provide a valid index (1 - 3)")
            editAspectChoice2 = Int(readLine()!)
        }
        return editAspectChoice2!
    }
}
