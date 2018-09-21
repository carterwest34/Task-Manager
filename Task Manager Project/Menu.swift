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
|                                             |
-----------------------------------------------

""")
    }
    
    func getInput() -> Int {
        var userInput = Int(readLine()!)
        while userInput == nil || userInput! < 1 || userInput! > 9 {
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
            taskManager.postUseOptions()
        case 2:
            print("You have chosen to see a list of all tasks, completed and uncompleted.")
            taskManager.seeListOfAllTasks()
            taskManager.postUseOptions()
        case 3:
            print("You have chosen to see a list of all completed tasks.")
            taskManager.seeListOfCompletedTasks()
            taskManager.postUseOptions()
        case 4:
            print("You have chosen to see a list of all uncompleted tasks.")
            taskManager.seeListOfUncompletedTasks()
            taskManager.postUseOptions()
        case 5:
            print("You have chosen to mark a task as complete.")
            taskManager.markTaskComplete()
            taskManager.postUseOptions()
            
        case 6:
            print("You have chosen to mark a task as incomplete.")
            taskManager.markTaskIncomplete()
            taskManager.postUseOptions()
            
        case 7:
            print("You have chosen to delete a task.")
            taskManager.deleteTask()
            taskManager.postUseOptions()
            
        case 8:
            print("Thanks for using the application")
            taskManager.quitTaskManager()
        case 9:
            print("You have chosen to edit a task.")
            taskManager.editTask()
            taskManager.postUseOptions()
        default:
            break
        }
    
    }
    
}
