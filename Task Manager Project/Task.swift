//
//  task.swift
//  Task Manager Project
//
//  Created by Carter West on 9/17/18.
//  Copyright © 2018 Carter West. All rights reserved.
//

import Foundation

class TaskManager {
    
    func createNewTask() {
        
        print("What task would you like to add?")
        var userCreateNewTask = readLine()!
        while userCreateNewTask == "" {
            print("Please enter a task.")
            userCreateNewTask = readLine()!
        }
        print("What would be the description of this task?")
        var userAddDescription = readLine()!
        while userAddDescription == "" {
            print("Please enter a category")
            userAddDescription = readLine()!
        }
        let newTask = Task(task: userCreateNewTask, description: userAddDescription, completed: false)
        
        taskArray.append(newTask)
        
        print("You have successfully added the task: \(userCreateNewTask)")
    }
    
    func seeListOfAllTasks() {
        print("Here's a list of all tasks:")
        var counter = 1
        for tasks in 0..<taskArray.count {
            print("\(counter)) \(taskArray[tasks].task) - Completed: \(taskArray[tasks].completed)")
            counter += 1
        }
        if taskArray.count == 0 {
            print("There are no tasks, completed or uncompleted.")
        }
        
    }
    
    func seeListOfCompletedTasks() {
        print("Here's a list of all completed tasks:")
        var taskNumber = 0
        
            for _ in taskArray {
                if taskArray[taskNumber].completed == true {
                print("\(taskNumber + 1)) \(taskArray[taskNumber].task)")
               
                taskNumber += 1
            }
                
        }
        if taskNumber == 0 {
            print("There are no completed tasks.")
        }
        
        
        
    }
    
    func seeListOfUncompletedTasks() {
        print("Here's a list of all uncompleted tasks:")
        
        var taskNumber2 = 0
        
        for _ in taskArray {
            if taskArray[taskNumber2].completed == false {
                print("\(taskNumber2 + 1)) \(taskArray[taskNumber2].task)")
                
                taskNumber2 += 1
            }
           
            }
        if taskNumber2 == 0 {
            print("There are no uncompleted tasks.")
        }
        
    }
    
    func markTaskComplete() {
        
        print("Here's a list of possible tasks to mark complete:")
        var taskNumber3 = 0
        for _ in taskArray {
            if taskArray[taskNumber3].completed == false {
                print("\(taskNumber3 + 1)) \(taskArray[taskNumber3].task)")
                
                taskNumber3 += 1
            }
            
        }
        if taskNumber3 == 0 {
            print("There are no uncompleted tasks.")
        
        }
        
        print("Which task would you like to mark as complete?")
        var userMarkCompleteAnswer = Int(readLine()!)! - 1
        while userMarkCompleteAnswer == nil || userMarkCompleteAnswer < 0 || userMarkCompleteAnswer > taskArray.count {
            print("Please enter a valid answer (1 - \(taskArray.count)")
            userMarkCompleteAnswer = Int(readLine()!)! - 1
        }
        completedArray.append(taskArray[userMarkCompleteAnswer])
        print("You have succesfully marked task: \(taskArray[userMarkCompleteAnswer].task) as completed.")
        taskArray[userMarkCompleteAnswer].completed = true
        
        
    }
    
    func markTaskIncomplete() {
        print("Here's a list of possible tasks you can mark incomplete:")
        var counter7 = 0
        for _ in completedArray {
            print("\(counter7 + 1)) \(completedArray[counter7].task)")
            counter7 += 1
            
        }
        
        if completedArray.count > 0 {
        print("Which task would you like to mark as incomplete?")
        var userMarkIncompleteAnswer = Int(readLine()!)! - 1
        while userMarkIncompleteAnswer == nil || userMarkIncompleteAnswer < 0 || userMarkIncompleteAnswer > completedArray.count {
            print("Please enter a valid answer. (1 - \(completedArray.count)")
            userMarkIncompleteAnswer = Int(readLine()!)! - 1
        }
        print("You have succesfully marked task: \(completedArray[userMarkIncompleteAnswer].task) as incomplete")
        taskArray[userMarkIncompleteAnswer].completed = false
            completedArray.remove(at: userMarkIncompleteAnswer)
        } else {
            print("There are no possible tasks to mark incomplete.")
        }
        
    }
    
    func deleteTask() {
        print("Here's a list of tasks you can delete:")
        var counter4 = 1
        for tasks in 0..<taskArray.count {
            print("\(counter4)) \(taskArray[tasks].task) - Completed: \(taskArray[tasks].completed)")
            counter4 += 1
        }
        if taskArray.count == 0 {
            print("There are no tasks to delete.")
        }
        
        print("Which task would you like to delete?")
        var userRemoveAnswer = Int(readLine()!)! - 1
        while userRemoveAnswer == nil || userRemoveAnswer > taskArray.count || userRemoveAnswer < 0 {
            print("Please enter a valid index. (1 - \(taskArray.count)")
            userRemoveAnswer = Int(readLine()!)!
        }
        
        print("You have successfully removed \(taskArray[userRemoveAnswer].task).")
        
        taskArray.remove(at: userRemoveAnswer)
        
    }
    
    func quitTaskManager() {
        exit(0)
    }
    
    func postUseOptions() {
        print("Would you like to do anything else? (Y/N)")
        var userWantToDoAnythingAgain = readLine()!.uppercased()
        while userWantToDoAnythingAgain != "Y" && userWantToDoAnythingAgain != "N" {
            print("Please enter a valid answer. (Y/N)")
            userWantToDoAnythingAgain = readLine()!.uppercased()
        }
        if userWantToDoAnythingAgain == "Y" {
            printMenu.taskMenu()
            print("What would you like to do?")
        } else {
            print("Thanks for using the application.")
        }
        
    }
}
