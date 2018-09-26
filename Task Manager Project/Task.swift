//
//  task.swift
//  Task Manager Project
//
//  Created by Carter West on 9/17/18.
//  Copyright © 2018 Carter West. All rights reserved.
//

import Foundation

class TaskManager { //Setting up class in which all our main functions will be created in order to be called in Menu.swift.
    
    func createNewTask() { //This function will allow the user to append tasks to their task array.
        
        //Here, i prompt the user for the name of the task, and put validation as a while statement to make sure the input isnt an empty string.
        
        print("What task would you like to add?")
        var userCreateNewTask = readLine()!
        while userCreateNewTask == "" {
            print("Please enter a task.")
            userCreateNewTask = readLine()!
        }
        
        //This is where i call the easteregg function from the EasterEgg class. I pass in the userCreateNewTask answer as the parameter for userInput to be used in the function. Depending on what the user types in, a certain easter egg image will appear.
        easterEggs.taskInputEasterEgg(userInput: userCreateNewTask)
        
        
        //I prompt the user to add a description to the task, and, again, use input validation to make sure that what the user enters isn't an empty string.
        
        print("What would be the description of this task?")
        var userAddDescription = readLine()!
        while userAddDescription == "" {
            print("Please enter a description.")
            userAddDescription = readLine()!
        }
        
        
       //I ask the user what priority rating theyd like to give the task theyre creating, then call from the validateIntInput class to make sure that the input they select isnt equal to nil, less than 1, or greater than 10.
        
        print("On a scale of 1 - 10, what level of priority is this task?")
        let handlePrioInput = validateIntInput.addPrioChoiceValidate()
        
        
        
        //I ask the user if theyd like to add a due date to the task. If they say yes, theyre asked to add a date object, if not, the task is done being added and the user will be notified that the task has been successfully added.
        print("Would you like to add a date to this task to be completed by? (Y/N)")
        var userAddDate = readLine()?.uppercased()
        while userAddDate != "Y" && userAddDate != "N" { //I add a simple validation that keeps the answer the user gives from not being Y for yes or N for no
            print("Please enter a valid answer.")
            userAddDate = readLine()?.uppercased()
        }
        if userAddDate == "Y" {
            //User is asked to give a date, along with some basic validation to make sure they entered something.
            print("Please add a complete due date (MM/dd/yyyy)")
            var userDueDateAddition = readLine()
            while userDueDateAddition == "" {
                print("Please enter a valid date.")
                userDueDateAddition = readLine()
            }
            
            
            var validDateObject = false //I made a variable to represent the status of the user input's date identity, whether its of a certain format or not.
            
            while validDateObject == false { //While statement that contains the second layer of validation before its added to the taskArray.
                if dateFormatter.date(from: userDueDateAddition!) != nil { //If the date format of the date addition is not equal to nil, then the date is added
                    let newTask = Task(task: userCreateNewTask, description: userAddDescription, completed: false, completeByDate: dateFormatter.date(from: userDueDateAddition!), priority: handlePrioInput) //Make sure the string input of date is converted to an actual date object before storing it in this task.
                    taskArray.append(newTask)
                    validDateObject = true //Breaks the loop by setting the valid date object variable equal to true.
                } else { //else, the user is prompted to enter a valid date of the correct format (MM,dd,yyyy)
                    print("Please enter a valid date object. (MM,dd,yyyy)")
                    userDueDateAddition = readLine()
                    validDateObject = false //Keeps the loop intact
                }
            }
            
            if let dueDate = userDueDateAddition { //Safely unwraps the date so that its presentable to the user.
                print("You have successfully added the task: \(userCreateNewTask) to your task manager! It is due to be completed by \(String(describing: dueDate))")
            }
            
        } else { //If the user didn't want to create a due date...
            
            //Do everything the same except theres no completeByDate, so set it equal to nil when creating an instance of it.
            let newTask2 = Task(task: userCreateNewTask, description: userAddDescription, completed: false, completeByDate: nil, priority: handlePrioInput)
            
            taskArray.append(newTask2)
            
            print("You have successfully added the task: \(userCreateNewTask) to your task manager!")
        }
        
    }
    
    func seeListOfAllTasks() { //This function is used to see the list of all tasks in the array.
        let orderTaskArray = orderTasks()
        
        if orderTaskArray.count == 0 {
            print("There are no available tasks, complete or incomplete.")
        }
        print("Here's a list of all tasks:")
        
        //This for loop is how the list will be presented, by going through each element and printing out a counter) and then each of the tasks properties
        var counter12 = 0
        for _ in orderTaskArray { //If the element the for loop went through contains a due date...
            if let dueDate4 = orderTaskArray[counter12].completeByDate {
                print("\(counter12 + 1)) Task: \(orderTaskArray[counter12].task) - Description: \(orderTaskArray[counter12].description) - Priority Level - \(orderTaskArray[counter12].priority) - Designated Complete Date: \(dateFormatter.string(from: dueDate4))")
                counter12 += 1 //Add 1 to the counter to indicate the element has been completely listed and is ready to move to the next one.
                } else { //If it doesnt contain a due date...
                print("\(counter12 + 1)) Task: \(orderTaskArray[counter12].task) - Description: \(orderTaskArray[counter12].description) - Priority Level - \(orderTaskArray[counter12].priority)")
                counter12 += 1
            }
        }
        
        
    } //Setting up an enumeration for our priority system to run off of.
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
    
    //This function goes in order from most priority to least and appends each task from the taskArray to a new array called sortedArray in that order.
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
        return sortedTask //Returns the completely sorted out array of tasks by priority.
    }
    
    
    
    func seeListOfCompletedTasks() { //This function is similar to the see list of all tasks function, only this one checks if the complete status on each task is complete or not. If so, it prints, if not, it doesn't.
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
    
    func seeListOfUncompletedTasks() { //This function is almost identical to the see list of comnpleted tasks function, only it checks if the tasks completed status is equal to false, like it is by default.
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
    
    func markTaskComplete() { //This function is used to change the complete status of a task to complete.
        
    
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
        
        if taskNumber3 > 0 {
        print("Which task would you like to mark as complete?")
        let userValidatedMarkCompleted = validateIntInput.markCompleteValidate() //Call int validation for this specific funtion, making sure the input isnt nil or out of range.
        
        completedArray.append(taskArray[userValidatedMarkCompleted - 1]) //Appends the users choice to an array of only completed tasks.
        print("You have succesfully marked task: \(taskArray[userValidatedMarkCompleted - 1].task) as completed.")
        taskArray[userValidatedMarkCompleted - 1].completed = true //Actually changes the status of the completed variable for that specific task.
        }
    }
    
    func markTaskIncomplete() { //This is similar to mark task complete function, only in order to show the list of available tasks to mark incomplete, instead of listing tasks from the taskArray, which has every task in it, we have to list from the completedArray, which only has the completed tasks inside it.
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
            completedArray.remove(at: userValidatedMarkIncompleted - 1) //Removes user choice from the completed array so it will no longer be shown.
        } else {
            print("There are no possible tasks to mark incomplete.")
        }
        
    }
    
    func deleteTask() { //This function is used to delete tasks from the taskArray.
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
        let taskDeleteValidate = validateIntInput.deleteTaskValidate() //Calling int input validation once again to ensure the input isnt nil and is in range.
        
        print("You have successfully removed \(taskArray[taskDeleteValidate - 1].task).") //MAke sure to add the - 1 when referring to the index of an array since it starts at 0, but we had the user start at 1, because that makes more sense from a user's standpoint.
        
        taskArray.remove(at: taskDeleteValidate - 1)
        
    }
    
    func quitTaskManager() { //Simple function that exits the application.
        exit(0)
    }
    
    func postUseOptions() { //This function is used when a function has been completed, to make sure if the user would like to complete another function. If not, the application ends. But if they do, they are taken back to the menu options and asked to pick an option, just like they were at the start.
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
    
    func editTask() { //This function is used in order to edit a certain property of a certain task that the user chooses.
        
        taskManager.seeListOfAllTasks() //Calls function from the same class to show list of avaliable tasks to edit.
        print("Which task would you like to edit?")
        
        if sortedTask.count > 0 { //If there are no elements in the array, then we obviously cant change anything.
            
            let userEditChoiceValidate = validateIntInput.chooseEditTask() //Calls int validation and returns the user's task edit choice.
            
            if let dueDate3 = sortedTask[userEditChoiceValidate - 1].completeByDate { //Once again, if the task has a due date.....
                
                print("""
                    
                    Ok! Here's the different aspects of the task: \(sortedTask[userEditChoiceValidate - 1].task) you are able to edit:
                    
                    1) Task: \(sortedTask[userEditChoiceValidate - 1].task)
                    2) Task Description: \(sortedTask[userEditChoiceValidate - 1].description)
                    3) Task Complete Due Date: \(dateFormatter.string(from: dueDate3))
                    4) Task Priority: \(sortedTask[userEditChoiceValidate - 1].priority)
                    
                    """)
                print("Which aspect of task: \(sortedTask[userEditChoiceValidate - 1].task) would you like to alter? (1 - 4)")
                
                let editAspectValidate = validateIntInput.chooseEditAspect() //Calls validation and returns the value of which specific aspect of the task theyd like to change. This is different for if the task has a due date or not because theres a whole otherindex to follow if there is a due date present, hence the rather big if let statement surrounding most of the function.
                
                switch editAspectValidate { //Switch statement that gives us all the different cases of which value the user picked, and the functionality of each case under it.
                    
                case 1:
                    //This code is very similar to when we initially added the task, just switching around some print statements and changing the values of the already existing ones.
                    print("You have chosen to change the task aspect of task: \(sortedTask[userEditChoiceValidate - 1].task)")
                    print("Current task: \(sortedTask[userEditChoiceValidate - 1].task)")
                    print("What are you changing the task to?")
                    var editTask = readLine()
                    while editTask == "" {
                        print("Please enter a valid task.")
                        editTask = readLine()
                    }
                    sortedTask[userEditChoiceValidate - 1].task = editTask!
                    print("You have successfully changed the task to: \(editTask!)")
                    
                case 2:
                    print("You have chosen to change the description aspect of task: \(sortedTask[userEditChoiceValidate - 1].task)")
                    print("Current description: \(sortedTask[userEditChoiceValidate - 1].description)")
                    print("What are you changing the description to?")
                    var editDescription = readLine()
                    while editDescription == "" {
                        print("Please enter a valid description.")
                        editDescription = readLine()
                    }
                    sortedTask[userEditChoiceValidate - 1].description = editDescription!
                    print("You have successfully changed the description of task: \(sortedTask[userEditChoiceValidate - 1].task) to \(sortedTask[userEditChoiceValidate - 1].description)")
                    
                case 3:
                    if let dueDate4 = sortedTask[userEditChoiceValidate - 1].completeByDate {
                        print("You have chosen to change the completed date aspect of the task: \(sortedTask[userEditChoiceValidate - 1].task)")
                        print("Current date to be completed: \(dateFormatter.string(from: dueDate4))") //Make sure to convert back to string before interpolating to make sure the user sees a coherent date object that's relatively readable.
                        print("What are you changing the date to? (MM/dd/yyyy)")
                        var editDate = readLine()
                        while editDate == "" {
                            print("Please enter a valid date.")
                            editDate = readLine()
                        }
                        
                        var validDateObject = false
                        
                        while validDateObject == false {
                            if let dueDateValidOrNot = dateFormatter.date(from: editDate!) {
                                sortedTask[userEditChoiceValidate - 1].completeByDate = dueDateValidOrNot
                                print("You have successfully chenged the date of task: \(sortedTask[userEditChoiceValidate - 1].task) to \(dueDateValidOrNot)")
                                validDateObject = true
                            } else {
                                print("Please enter a valid date object.")
                                editDate = readLine()
                                validDateObject = false
                            }
                        }
                        
                    }
                case 4:
                    print("You have chosen to change the priority aspect of task: \(sortedTask[userEditChoiceValidate - 1].task)")
                    print("Current priority: \(sortedTask[userEditChoiceValidate - 1].priority)")
                    print("What are you changing the priority to?")
                    let editPriorityValidate = validateIntInput.editPriorityChoice()
                    sortedTask[userEditChoiceValidate - 1].priority = editPriorityValidate
                    print("You have successfully changed the priority of task: \(sortedTask[userEditChoiceValidate - 1].task) to \(sortedTask[userEditChoiceValidate - 1].priority)")
                default:
                    break
                }
            } else { //If the user's task edit choice doesn't have a due date....
                
                //All of the following code encapsuled in this else statement is the same as in the if statement above, only this time, theres no dates taken into account. Only the task name, the description, and the priority rating. In this case, all we alter is the index for which the switch statement to pick from since we have one less, we go from 4 to 3.
                print("""
                    
                    Ok! Here's the different aspects of the task: \(sortedTask[userEditChoiceValidate - 1].task) you are able to edit:
                    
                    1) Task: \(sortedTask[userEditChoiceValidate - 1].task)
                    2) Task Description: \(sortedTask[userEditChoiceValidate - 1].description)
                    3) Task Priority: \(sortedTask[userEditChoiceValidate - 1].priority)
                    
                    """)
                print("Which aspect of task: \(sortedTask[userEditChoiceValidate - 1].task) would you like to alter? (1 - 3)")
               let editAspectValidateIfNoDatePresent = validateIntInput.chooseEditAspectIfNoDateAvailable()
                
                switch editAspectValidateIfNoDatePresent {
                    case 1:
                    print("You have chosen to change the task aspect of task: \(sortedTask[userEditChoiceValidate - 1].task)")
                    print("Current task: \(sortedTask[userEditChoiceValidate - 1].task)")
                    print("What are you changing the task to?")
                    var editTask = readLine()
                    while editTask == "" {
                        print("Please enter a valid task.")
                        editTask = readLine()
                    }
                    sortedTask[userEditChoiceValidate - 1].task = editTask!
                    print("You have successfully changed the task to: \(editTask!))")
                    
                case 2:
                    print("You have chosen to change the description aspect of task: \(sortedTask[userEditChoiceValidate - 1].task)")
                    print("Current description: \(sortedTask[userEditChoiceValidate - 1].description)")
                    print("What are you changing the description to?")
                    var editDescription = readLine()
                    while editDescription == "" {
                        print("Please enter a valid description.")
                        editDescription = readLine()
                    }
                    sortedTask[userEditChoiceValidate - 1].description = editDescription!
                    print("You have successfully changed the description of task: \(sortedTask[userEditChoiceValidate - 1].task) to \(sortedTask[userEditChoiceValidate - 1].description)")
                case 3:
                    print("You have chosen to change the priority aspect of task: \(sortedTask[userEditChoiceValidate - 1].task)")
                    print("Current priority: \(sortedTask[userEditChoiceValidate - 1].priority)")
                    print("What are you changing the priority to?")
                    let editPriorityVslidate = validateIntInput.editPriorityChoice()
                    sortedTask[userEditChoiceValidate - 1].priority = editPriorityVslidate
                    print("You have successfully changed the priority of task: \(sortedTask[userEditChoiceValidate - 1].task) to \(sortedTask[userEditChoiceValidate - 1].priority)")
                default:
                    break
                }
            }
            
        }
        
        if  sortedTask.count == 0 { //If theres no elements in the task array, notify the user of such case. 
            print("there are no tasks to edit.")
        }
    }
    
}



