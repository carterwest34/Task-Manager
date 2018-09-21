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
            print("Please enter a description.")
            userAddDescription = readLine()!
        }
        print("On a scale of 1 - 10, what level of priority is this task?")
        let handlePrioInput = validateIntInput.addPrioChoiceValidate()
        
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
                    let newTask = Task(task: userCreateNewTask, description: userAddDescription, completed: false, completeByDate: dateFormatter.date(from: userDueDateAddition!), priority: handlePrioInput)
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
            let newTask2 = Task(task: userCreateNewTask, description: userAddDescription, completed: false, completeByDate: nil, priority: handlePrioInput)
            
            taskArray.append(newTask2)
            
            print("You have successfully added the task: \(userCreateNewTask) to your task manager!")
        }
        
    }
    
    func seeListOfAllTasks() {
        let orderTaskArray = orderTasks()
        
        if orderTaskArray.count == 0 {
            print("There are no available tasks, complete or incomplete.")
        }
        print("Here's a list of all tasks:")
        
        var counter12 = 0
        for _ in orderTaskArray {
            if let dueDate4 = orderTaskArray[counter12].completeByDate {
                print("\(counter12 + 1)) Task: \(orderTaskArray[counter12].task) - Description: \(orderTaskArray[counter12].description) - Priority Level - \(orderTaskArray[counter12].priority) - Designated Complete Date: \(dateFormatter.string(from: dueDate4))")
                counter12 += 1
            } else {
                print("\(counter12 + 1)) Task: \(orderTaskArray[counter12].task) - Description: \(orderTaskArray[counter12].description) - Priority Level - \(orderTaskArray[counter12].priority)")
                counter12 += 1
            }
        }
        
        
    }
    enum Priority: Int {
        case one = 1
        case two = 2
        case three = 3
        case four = 4
        case five = 5
        case six = 6
        case seven = 7
        case eight = 8
        case nine = 9
        case ten = 10
        
    }
    
    func orderTasks() -> [Task]{
        for tasks in taskArray {
            if tasks.priority == Priority.ten.rawValue{
                sortedTask.append(tasks)
            }
        }
        for tasks in taskArray {
            if tasks.priority == Priority.nine.rawValue{
                sortedTask.append(tasks)
            }
        }
        for tasks in taskArray {
            if tasks.priority == Priority.eight.rawValue{
                sortedTask.append(tasks)
            }
        }
        for tasks in taskArray {
            if tasks.priority == Priority.seven.rawValue{
                sortedTask.append(tasks)
            }
        }
        for tasks in taskArray {
            if tasks.priority == Priority.six.rawValue{
                sortedTask.append(tasks)
            }
        }
        for tasks in taskArray {
            if tasks.priority == Priority.five.rawValue{
                sortedTask.append(tasks)
            }
        }
        for tasks in taskArray {
            if tasks.priority == Priority.four.rawValue{
                sortedTask.append(tasks)
            }
        }
        for tasks in taskArray {
            if tasks.priority == Priority.three.rawValue{
                sortedTask.append(tasks)
            }
        }
        for tasks in taskArray {
            if tasks.priority == Priority.two.rawValue{
                sortedTask.append(tasks)
            }
        }
        for tasks in taskArray {
            if tasks.priority == Priority.one.rawValue{
                sortedTask.append(tasks)
            }
        }
        return sortedTask
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
        let userValidatedMarkCompleted = validateIntInput.markCompleteValidate()
        
        completedArray.append(taskArray[userValidatedMarkCompleted - 1])
        print("You have succesfully marked task: \(taskArray[userValidatedMarkCompleted - 1].task) as completed.")
        taskArray[userValidatedMarkCompleted - 1].completed = true
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
            
             let userValidatedMarkIncompleted = validateIntInput.markIncompleteValidate()
            
            print("You have succesfully marked task: \(completedArray[userValidatedMarkIncompleted - 1].task) as incomplete")
            taskArray[userValidatedMarkIncompleted - 1].completed = false
            completedArray.remove(at: userValidatedMarkIncompleted - 1)
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
        let taskDeleteValidate = validateIntInput.deleteTaskValidate()
        
        print("You have successfully removed \(taskArray[taskDeleteValidate - 1].task).")
        
        taskArray.remove(at: taskDeleteValidate - 1)
        
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
            exit(0)
        }
        
        
    }
    
    func editTask() {
        
        taskManager.seeListOfAllTasks()
        print("Which task would you like to edit?")
        
        while sortedTask.count > 0 {
            let userEditChoiceValidate = validateIntInput.chooseEditTask()
            
            if let dueDate3 = sortedTask[userEditChoiceValidate].completeByDate {
                
                print("""
                    
                    Ok! Here's the different aspects of the task: \(sortedTask[userEditChoiceValidate].task) you are able to edit:
                    
                    1) Task: \(sortedTask[userEditChoiceValidate].task)
                    2) Task Description: \(sortedTask[userEditChoiceValidate].description)
                    3) Task Complete Due Date: \(dateFormatter.string(from: dueDate3))
                    4) Task Priority: \(sortedTask[userEditChoiceValidate].priority)
                    
                    """)
                print("Which aspect of task: \(sortedTask[userEditChoiceValidate].task) would you like to alter? (1 - 4)")
                
                let editAspectValidate = validateIntInput.chooseEditAspect()
                
                switch editAspectValidate {
                    
                case 1:
                    print("You have chosen to change the task aspect of task: \(sortedTask[userEditChoiceValidate].task)")
                    print("Current task: \(sortedTask[userEditChoiceValidate].task)")
                    print("What are you changing the task to?")
                    var editTask = readLine()
                    while editTask == "" {
                        print("Please enter a valid task.")
                        editTask = readLine()
                    }
                    sortedTask[userEditChoiceValidate].task = editTask!
                    print("You have successfully changed the task to: \(editTask!))")
                    
                case 2:
                    print("You have chosen to change the description aspect of task: \(sortedTask[userEditChoiceValidate].task)")
                    print("Current description: \(sortedTask[userEditChoiceValidate].description)")
                    print("What are you changing the description to?")
                    var editDescription = readLine()
                    while editDescription == "" {
                        print("Please enter a valid description.")
                        editDescription = readLine()
                    }
                    sortedTask[userEditChoiceValidate].description = editDescription!
                    print("You have successfully changed the description of task: \(sortedTask[userEditChoiceValidate].task) to \(sortedTask[userEditChoiceValidate].description)")
                    
                case 3:
                    if let dueDate4 = sortedTask[userEditChoiceValidate].completeByDate {
                        print("You have chosen to change the completed date aspect of the task: \(sortedTask[userEditChoiceValidate].task)")
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
                                sortedTask[userEditChoiceValidate].completeByDate = dueDateValidOrNot
                                print("You have successfully chenged the date of task: \(sortedTask[userEditChoiceValidate].task) to \(dueDateValidOrNot)")
                                validDateObject = true
                            } else {
                                print("Please enter a valid date object.")
                                editDate = readLine()
                                validDateObject = false
                            }
                        }
                        
                    }
                case 4:
                    print("You have chosen to change the priority aspect of task: \(sortedTask[userEditChoiceValidate].task)")
                    print("Current priority: \(sortedTask[userEditChoiceValidate].priority)")
                    print("What are you changing the priority to?")
                    let editPriorityValidate = validateIntInput.editPriorityChoice()
                    sortedTask[userEditChoiceValidate].priority = editPriorityValidate
                    print("You have successfully changed the priority of task: \(sortedTask[userEditChoiceValidate].task) to \(sortedTask[userEditChoiceValidate].priority)")
                default:
                    break
                }
            } else {
                print("""
                    
                    Ok! Here's the different aspects of the task: \(sortedTask[userEditChoiceValidate].task) you are able to edit:
                    
                    1) Task: \(sortedTask[userEditChoiceValidate].task)
                    2) Task Description: \(sortedTask[userEditChoiceValidate].description)
                    3) Task Priority: \(sortedTask[userEditChoiceValidate].priority)
                    
                    """)
                print("Which aspect of task: \(sortedTask[userEditChoiceValidate].task) would you like to alter? (1 - 3)")
               let editAspectValidateIfNoDatePresent = validateIntInput.chooseEditAspectIfNoDateAvailable()
                
                switch editAspectValidateIfNoDatePresent {
                    case 1:
                    print("You have chosen to change the task aspect of task: \(sortedTask[userEditChoiceValidate].task)")
                    print("Current task: \(sortedTask[userEditChoiceValidate].task)")
                    print("What are you changing the task to?")
                    var editTask = readLine()
                    while editTask == "" {
                        print("Please enter a valid task.")
                        editTask = readLine()
                    }
                    sortedTask[userEditChoiceValidate].task = editTask!
                    print("You have successfully changed the task to: \(editTask!))")
                    
                case 2:
                    print("You have chosen to change the description aspect of task: \(sortedTask[userEditChoiceValidate].task)")
                    print("Current description: \(sortedTask[userEditChoiceValidate].description)")
                    print("What are you changing the description to?")
                    var editDescription = readLine()
                    while editDescription == "" {
                        print("Please enter a valid description.")
                        editDescription = readLine()
                    }
                    sortedTask[userEditChoiceValidate].description = editDescription!
                    print("You have successfully changed the description of task: \(sortedTask[userEditChoiceValidate].task) to \(sortedTask[userEditChoiceValidate].description)")
                case 3:
                    print("You have chosen to change the priority aspect of task: \(sortedTask[userEditChoiceValidate].task)")
                    print("Current priority: \(sortedTask[userEditChoiceValidate].priority)")
                    print("What are you changing the priority to?")
                    let editPriorityVslidate = validateIntInput.editPriorityChoice()
                    sortedTask[userEditChoiceValidate].priority = editPriorityVslidate
                    print("You have successfully changed the priority of task: \(sortedTask[userEditChoiceValidate].task) to \(sortedTask[userEditChoiceValidate].priority)")
                default:
                    break
                }
            }
            
        }
        
        if  sortedTask.count == 0 {
            print("there are no tasks to edit.")
        }
    }
    
}



