//
//  main.swift
//  Task Manager Project
//
//  Created by Carter West on 9/17/18.
//  Copyright © 2018 Carter West. All rights reserved.
//

import Foundation

let dateFormatter = DateFormatter()

dateFormatter.dateFormat = "MM/dd/yyyy"

var completedArray: [Task] = []

var taskArray: [Task] = []

var runningTaskManager = true

print("Welcome to your Task Manager.")

let printMenu = Menu()

printMenu.taskMenu()

print("What would you like to do?")

repeat {
    
    let userInput = Menu().getInput()
    
    Menu().handleInput(userInput)
    
} while runningTaskManager == true

if runningTaskManager == false {
    print("Thanks for using the task manager")
    exit(0)
}
