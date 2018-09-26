//
//  Login.swift
//  Task Manager Project
//
//  Created by Carter West on 9/19/18.
//  Copyright © 2018 Carter West. All rights reserved.
//

import Foundation

class Login { //This class is used to store the methods of logging in, creating login info, and changing login info.
    var username: String
    var password: String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    func setupUssrnameAndPassword() { //This method of the Login class is used to setup the login username and password, but since theres no persistence to the program, this function is kind of useless lol.
        
        print("What would you like your username to be?")
        var usernameInput = readLine()
        while usernameInput == "" {
            print("Please enter a valid input.")
            usernameInput = readLine()
        }
        username = usernameInput!
        print("You have successfully made your username: \(username)")
        
        print("What would you like your password to be?")
        var passwordInput = readLine()
        while passwordInput == "" {
            print("Please enter a valid input")
            passwordInput = readLine()
        }
        password = passwordInput!
        print("You have successfully made your password: \(password)")
        
    }
    
    func logIn() {
        print("Login")
        print("Username:")
        var usernameLogin = readLine()
        while usernameLogin == "" {
            print("Invalid answer.")
            usernameLogin = readLine()
        }
        print("Password:")
        var passwordLogin = readLine()
        while passwordLogin == "" {
            print("Invalid answer.")
            passwordLogin = readLine()
        }
        while usernameLogin == "" || passwordLogin == "" || usernameLogin != username || passwordLogin != password {
            print("Invalid username or password.")
            print("Username:")
            usernameLogin = readLine()
            print("Password:")
            passwordLogin = readLine()
        }
        print("You have successfully logged in.")
        sleep(2)
    }
    
    func changeLogInInfo() {
        print("What would you like to change your username to?")
        var usernameInput = readLine()
        while usernameInput == "" {
            print("Please enter a valid input.")
            usernameInput = readLine()
        }
        username = usernameInput!
        
        print("You have successfully changed your username to \(username)") 
        
        print("What would you like to change your password to?")
        var passwordInput = readLine()
        while passwordInput == "" {
            print("Please enter a valid input")
            passwordInput = readLine()
        }
        password = passwordInput!
        print("You have successfully changed your password to \(password)")
    }
    
}
