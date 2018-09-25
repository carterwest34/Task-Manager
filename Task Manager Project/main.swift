//
//  main.swift
//  Task Manager Project
//
//  Created by Carter West on 9/17/18.
//  Copyright © 2018 Carter West. All rights reserved.
//

import Foundation

let login = Login(username: "username", password: "password")
var easterEggs = EasterEggs()
var validateIntInput = ValidateIntInput()
var sortedTask: [Task] = []
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "MM/dd/yyyy"
var completedArray: [Task] = []
var taskArray: [Task] = []
var runningTaskManager = true


login.logIn()
sleep(1)
print("Welcome to your Task Manager.")
sleep(1)
let printMenu = Menu()
printMenu.taskMenu()
sleep(1)
print("What would you like to do?")

repeat {
    
    let userInput = Menu().getInput()
    
    Menu().handleInput(userInput)
    
} while runningTaskManager == true

if runningTaskManager == false {
    print("Thanks for using the task manager")
    exit(0)
}
