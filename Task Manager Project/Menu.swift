//
//  menu.swift
//  Task Manager Project
//
//  Created by Carter West on 9/17/18.
//  Copyright © 2018 Carter West. All rights reserved.
//

import Foundation

var taskManager = TaskManager() //Initializing the taskManager class for functional use.


class Menu {
    func taskMenu() {
        //Print statement giving the user a table of their options and a visual index of numbers to pick from that corresponds to each option.
        print("""

-----------------------------------------------
|             Task Manager Menu:              |
|                                             |
|        1) Create New Task                   |
|        2) See List Of All Tasks             |
|        3) See List Of Completed Tasks       |
|        4) See List Of Uncompleted Tasks     |
|        5) Mark A Task As Complete           |
|        6) Mark A Task As Incomplete         |
|        7) Delete A Task                     |
|        8) Exit Task Manager                 |
|        9) Edit Task                         |
|       10) Create Login                      |
|       11) Change Login Info                 |
|                                             |
-----------------------------------------------

""")
    }
    
    //Function that returns an integer value that is supposed to correspond to the menu that the user sees on the screen.
    func getInput() -> Int {
        var userInput = Int(readLine()!)
        while userInput == nil || userInput! < 1 || userInput! > 11 { //Input validation that prohibits the input from being less than 1, which is the first option, greater than 11, which is the last option, and nil, which is anything other than an integer.
            print("Please provide a valid answer")
            userInput = Int(readLine()!)
        }
        if let input = userInput{ //Safely unwrapping the optional value of userInput so that there wont be any problem handling it in my handelInput function.
        return input
        }
        return 0 
    }
    
    //Function where our entire application will basically run off of. This repeat statement is where our userInput will be entered as a parameter, and will run 11 different cases according to which number is entered. Post use options is a function that will be used at the end of every case that will ask the user if they would like to do anything else. If they answer yes, the same menu will be presented and the useer will be propmted once again. If the user chooses no, then the application will end.
    func handleInput(_ userInput: Int) {
        switch userInput {
        case 1:
            print("You have chosen to add a task.")
            taskManager.createNewTask() //Calls the create new task function from the task file.
            sleep(2)
            taskManager.postUseOptions()
            
        case 2:
            print("You have chosen to see a list of all tasks, completed and uncompleted.")
            taskManager.seeListOfAllTasks() //Calls the see list of all tasks from the task file.
            sleep(2)
            taskManager.postUseOptions()
            
        case 3:
            print("You have chosen to see a list of all completed tasks.")
            taskManager.seeListOfCompletedTasks() //Calls the see list of completed tasks function from the task file.
            sleep(2)
            taskManager.postUseOptions()
            
        case 4:
            print("You have chosen to see a list of all uncompleted tasks.")
            taskManager.seeListOfUncompletedTasks() //Calls the see list of uncompleted tasks function from the task file.
            sleep(2)
            taskManager.postUseOptions()
            
        case 5:
            print("You have chosen to mark a task as complete.")
            taskManager.markTaskComplete() //Calls the mark task complete function from the task file.
            sleep(2)
            taskManager.postUseOptions()
            
        case 6:
            print("You have chosen to mark a task as incomplete.")
            taskManager.markTaskIncomplete() //Calls rhe mark task incomplete function from the task file.
            sleep(2)
            taskManager.postUseOptions()
            
        case 7:
            print("You have chosen to delete a task.")
            taskManager.deleteTask() //Calls the delete task function fromt the task file.
            sleep(2)
            taskManager.postUseOptions()
            
        case 8:
            print("Thanks for using the application")
            sleep(1)
            taskManager.quitTaskManager() //Calls the quit function from the task file.
            
        case 9:
            print("You have chosen to edit a task.")
            taskManager.editTask() //Calls the edit task function from the task file.
            sleep(2)
            taskManager.postUseOptions()
            
        case 10:
            print("You have chosen to create your login information.")
            login.setupUssrnameAndPassword() //Calls the setup login info function from the task file.
            sleep(2)
            taskManager.postUseOptions()
            
        case 11:
            print("You have chosen to change your login information")
            login.changeLogInInfo() //Calls the change login info function from the task file. 
            sleep(2)
            taskManager.postUseOptions()
            
        default:
            break
        }
    
    }
    
}
