//
//  main.swift
//  Task Manager Project
//
//  Created by Carter West on 9/17/18.
//  Copyright © 2018 Carter West. All rights reserved.
//

import Foundation

//Cresting an instance of the login class in main.swift in order to be able to use in functions in the project.
let login = Login(username: "username", password: "password")

//Initializing the easterEgg class for functional use
var easterEggs = EasterEggs()

//Initilaizing the integer input validation  class of functions for functional use.
var validateIntInput = ValidateIntInput()

//Creating an empty array in order for the task array to be entered into in order of priority.
var sortedTask: [Task] = []

//Setting up date formatter so we can use in the add date function in the addGame function as well as the editTask function.
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "MM/dd/yyyy"

//Setting up empty arrays as type [Task] in order for tasks to be appended and removed to it, while keeping the parameters from the task class.
var completedArray: [Task] = []
var taskArray: [Task] = []

//Setting up a status for the repeat statement in main.swift to run off of. 
var runningTaskManager = true

//Calling logIn function from the login class for the user to input the username and password.
print("BTW I couldn't figure out persistence, so I made the login username and password a default value. Here it is: Username = username and Password = password.\n")
login.logIn()
sleep(1) //!!NOTE!!: All sleep statements in the entire application are in order to make the task manager run smoother for the user ,giving them time to read whats in the debugger area.

//Welcoming the user to the task manager
print("Welcome to your Task Manager.")

sleep(2)

//Initializing the printMenu function in main.swift and then calling it to make sure the user knows their options.
let printMenu = Menu()
printMenu.taskMenu()
sleep(1)

print("What would you like to do?")

//Repeat statement that keeps asking for user input unitl runningTaskManager equals false.
repeat {
    
    let userInput = Menu().getInput()
    
    Menu().handleInput(userInput)
    
} while runningTaskManager == true

//If statement that says that if any time the runningTaskManager varible equals false, the application will exit.
if runningTaskManager == false {
    print("Thanks for using the task manager")
    exit(0)
}
