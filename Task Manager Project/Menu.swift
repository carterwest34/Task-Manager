//
//  menu.swift
//  Task Manager Project
//
//  Created by Carter West on 9/17/18.
//  Copyright © 2018 Carter West. All rights reserved.
//

import Foundation

var taskManager = TaskManager()


class Menu {
    func taskMenu() {
        
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
    
    func getInput() -> Int {
        var userInput = Int(readLine()!)
        while userInput == nil || userInput! < 1 || userInput! > 11 {
            print("Please provide a valid answer")
            userInput = Int(readLine()!)
        }
        if let input = userInput{
        return input
        }
        return 0 
    }
    
    
    func handleInput(_ userInput: Int) {
        switch userInput {
        case 1:
            print("You have chosen to add a task.")
            taskManager.createNewTask()
            sleep(2)
            taskManager.postUseOptions()
            
        case 2:
            print("You have chosen to see a list of all tasks, completed and uncompleted.")
            taskManager.seeListOfAllTasks()
            sleep(2)
            taskManager.postUseOptions()
            
        case 3:
            print("You have chosen to see a list of all completed tasks.")
            taskManager.seeListOfCompletedTasks()
            sleep(2)
            taskManager.postUseOptions()
            
        case 4:
            print("You have chosen to see a list of all uncompleted tasks.")
            taskManager.seeListOfUncompletedTasks()
            sleep(2)
            taskManager.postUseOptions()
            
        case 5:
            print("You have chosen to mark a task as complete.")
            taskManager.markTaskComplete()
            sleep(2)
            taskManager.postUseOptions()
            
        case 6:
            print("You have chosen to mark a task as incomplete.")
            taskManager.markTaskIncomplete()
            sleep(2)
            taskManager.postUseOptions()
            
        case 7:
            print("You have chosen to delete a task.")
            taskManager.deleteTask()
            sleep(2)
            taskManager.postUseOptions()
            
        case 8:
            print("Thanks for using the application")
            sleep(1)
            taskManager.quitTaskManager()
            
        case 9:
            print("You have chosen to edit a task.")
            taskManager.editTask()
            sleep(2)
            taskManager.postUseOptions()
            
        case 10:
            print("You have chosen to create your login information.")
            login.setupUssrnameAndPassword()
            sleep(2)
            taskManager.postUseOptions()
            
        case 11:
            print("You have chosen to change your login information")
            login.changeLogInInfo()
            sleep(2)
            taskManager.postUseOptions()
            
        default:
            break
        }
    
    }
    
}
