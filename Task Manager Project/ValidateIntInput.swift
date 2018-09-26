//
//  ValidateIntInput.swift
//  Task Manager Project
//
//  Created by Carter West on 9/20/18.
//  Copyright © 2018 Carter West. All rights reserved.
//

import Foundation

//The purpose of this class is to have different integer input validaitons for different functions that require an integer input, for example, choosing an index of a task the user would like to delete or edit. Each function of validation will setup a user input variable and range of possible values exclusive to each function.

class ValidateIntInput {
    
    func addPrioChoiceValidate() -> Int { //Making sure that the function returns an int value, so that when we call a function later, it will use the number it returns.
        
        var prioAddChoice = Int(readLine()!)
        
        //Use while statements for all validation so that if the user keeps on putting in invalid inputs, they will keep being prompted to input a valid answer, keeping them in a loop until the answer they provide meets the criteria of the while statement.
        
        while prioAddChoice == nil || prioAddChoice! < 1 || prioAddChoice! > 10 {
            print("Please provide a valid priority")
            prioAddChoice = Int(readLine()!)
        }
        return prioAddChoice! //Returns the filtered, final correct user input for the function.
    }
    
    func markCompleteValidate() -> Int {
        
        var markCompleteChoice = Int(readLine()!)
        
        //The upperbound of the int input should be the amount of elements in the array, so I used taskArray.count.
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
