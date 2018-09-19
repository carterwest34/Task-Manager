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
        print("On a scale of 1 - 10, what level of priority is this task?")
        var userPriorityChoice = Int(readLine()!)!
        while userPriorityChoice == nil || userPriorityChoice > 10 || userPriorityChoice < 1 {
            print("Please enter a valid priority choice.")
            userPriorityChoice = Int(readLine()!)!
        }
        print("Would you like to add a date to this task to be completed by? (Y/N)")
        var userAddDate = readLine()?.uppercased()
        while userAddDate != "Y" && userAddDate != "N" {
            print("Please enter a valid answer.")
            userAddDate = readLine()?.uppercased()
        }
        if userAddDate == "Y" {
            
            print("Please add a complete due date (MM/dd/yyyy)")
            var userDueDateAddition = readLine()
            while userDueDateAddition == "" {
                print("Please enter a valid date.")
                userDueDateAddition = readLine()
            }
            
            var validDateObject = false
            
            while validDateObject == false {
                if let dueDateValidOrNot = dateFormatter.date(from: userDueDateAddition!) {
                    let newTask = Task(task: userCreateNewTask, description: userAddDescription, completed: false, completeByDate: dateFormatter.date(from: userDueDateAddition!), priority: userPriorityChoice)
                    taskArray.append(newTask)
                    validDateObject = true
                } else {
                    print("Please enter a valid date object.")
                    userDueDateAddition = readLine()
                    validDateObject = false
                }
            }
            
            if let dueDate = userDueDateAddition {
                print("You have successfully added the task: \(userCreateNewTask) to your task manager! It is due to be completed by \(String(describing: dueDate))")
            }
            
        } else {
            let newTask2 = Task(task: userCreateNewTask, description: userAddDescription, completed: false, completeByDate: nil, priority: userPriorityChoice)
            
            taskArray.append(newTask2)
            
            print("You have successfully added the task: \(userCreateNewTask) to your task manager!")
        }
        
    }
    
    func seeListOfAllTasks() {
        print("Here's a list of all tasks:")
        var counter = 1
        
        for tasks in 0..<taskArray.count {
            
            if let dueDate2 = taskArray[tasks].completeByDate {
                print("\(counter)) \(taskArray[tasks].task) - Completed: \(taskArray[tasks].completed) - Designated Complete Due Date: \(dateFormatter.string(from: dueDate2))")
                counter += 1
            } else {
                print("\(counter)) \(taskArray[tasks].task) - Completed: \(taskArray[tasks].completed)")
                counter += 1
            }
            if taskArray.count == 0 {
                print("There are no tasks, completed or uncompleted.")
            }
            
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
    
    func editTask() {
        
        taskManager.seeListOfAllTasks()
        print("Which task would you like to edit?")
        var userEditChoice = Int(readLine()!)! - 1
        while userEditChoice == nil || userEditChoice < 0 || userEditChoice > taskArray.count {
            print("Please enter a valid answer.")
            userEditChoice = Int(readLine()!)! - 1
        }
        
        if let dueDate3 = taskArray[userEditChoice].completeByDate {
            
            print("""
                
                Ok! Here's the different aspects of the task: \(taskArray[userEditChoice].task) you are able to edit:
                
                1) Task: \(taskArray[userEditChoice].task)
                2) Task Description: \(taskArray[userEditChoice].description)
                3) Task Complete Due Date: \(dateFormatter.string(from: dueDate3))
                
                """)
            print("Which aspect of task: \(taskArray[userEditChoice].task) would you like to alter? (1 - 3)")
            var userEditAspectChoice = Int(readLine()!)!
            while userEditAspectChoice == nil || userEditAspectChoice < 1 && userEditAspectChoice > 3 {
                print("Please enter a valid index (1 - 3)")
                userEditAspectChoice = Int(readLine()!)!
            }
            switch userEditAspectChoice {
                
            case 1:
                print("You have chosen to change the task aspect of task: \(taskArray[userEditChoice].task)")
                print("Current task: \(taskArray[userEditChoice].task)")
                print("What are you changing the task to?")
                var editTask = readLine()
                while editTask == "" {
                    print("Please enter a valid task.")
                    editTask = readLine()
                }
                taskArray[userEditChoice].task = editTask!
                print("You have successfully changed the task to: \(editTask!))")
                
            case 2:
                print("You have chosen to change the description aspect of task: \(taskArray[userEditChoice].task)")
                print("Current description: \(taskArray[userEditChoice].description)")
                print("What are you changing the description to?")
                var editDescription = readLine()
                while editDescription == "" {
                    print("Please enter a valid description.")
                    editDescription = readLine()
                }
                taskArray[userEditChoice].description = editDescription!
                print("You have successfully changed the description of task: \(taskArray[userEditChoice].task) to \(taskArray[userEditChoice].description)")
                
            case 3:
                if let dueDate4 = taskArray[userEditChoice].completeByDate {
                    print("You have chosen to change the completed date aspect of the task: \(taskArray[userEditChoice].task)")
                    print("Current date to be completed: \(dateFormatter.string(from: dueDate4))")
                    print("What are you changing the date to? (MM/dd/yyyy)")
                    var editDate = readLine()
                    while editDate == "" {
                        print("Please enter a valid date.")
                        editDate = readLine()
                    }
                    
                    var validDateObject = false
                    
                    while validDateObject == false {
                        if let dueDateValidOrNot = dateFormatter.date(from: editDate!) {
                            taskArray[userEditChoice].completeByDate = dueDateValidOrNot
                            print("You have successfully chenged the date of task: \(taskArray[userEditChoice].task) to \(dueDateValidOrNot)")
                            validDateObject = true
                        } else {
                            print("Please enter a valid date object.")
                            editDate = readLine()
                            validDateObject = false
                        }
                    }
                    
                }
            default:
                break
            }
        } else {
            print("""
                
                Ok! Here's the different aspects of the task: \(taskArray[userEditChoice].task) you are able to edit:
                
                1) Task: \(taskArray[userEditChoice].task)
                2) Task Description: \(taskArray[userEditChoice].description)
                
                """)
            print("Which aspect of task: \(taskArray[userEditChoice].task) would you like to alter? (1 - 2)")
            var userEditAspectChoice = Int(readLine()!)!
            while userEditAspectChoice == nil || userEditAspectChoice < 1 || userEditAspectChoice > 2 {
                print("Please enter a valid index (1 - 2")
                userEditAspectChoice = Int(readLine()!)!
            }
            switch userEditAspectChoice {
                
            case 1:
                print("You have chosen to change the task aspect of task: \(taskArray[userEditChoice].task)")
                print("Current task: \(taskArray[userEditChoice].task)")
                print("What are you changing the task to?")
                var editTask = readLine()
                while editTask == "" {
                    print("Please enter a valid task.")
                    editTask = readLine()
                }
                taskArray[userEditChoice].task = editTask!
                print("You have successfully changed the task to: \(editTask!))")
                
            case 2:
                print("You have chosen to change the description aspect of task: \(taskArray[userEditChoice].task)")
                print("Current description: \(taskArray[userEditChoice].description)")
                print("What are you changing the description to?")
                var editDescription = readLine()
                while editDescription == "" {
                    print("Please enter a valid description.")
                    editDescription = readLine()
                }
                taskArray[userEditChoice].description = editDescription!
                print("You have successfully changed the description of task: \(taskArray[userEditChoice].task) to \(taskArray[userEditChoice].description)")
                
            default:
                break
            }
        }
        
    }
}



