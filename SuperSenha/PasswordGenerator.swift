//
//  PasswordGenerator.swift
//  SuperSenha
//
//  Created by Eduardo on 05/02/18.
//  Copyright © 2018 eduardo. All rights reserved.
//

import Foundation

class PassowordGenerator {
    
    var numbersOfCharaters: Int
    var numbersOfPasswords: Int
    var useLetters: Bool
    var useNumbers: Bool
    var useCapitalLetters: Bool
    var useSpecialCharacters: Bool
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvwxz"
    private let specialCharacters = "`˜@#$%ˆ&*()_-+=<,>.?/:;'{[}]|\\}"
    private let numbers = "123456789"
    
    init(numbersOfCharaters: Int, numbersOfPasswords: Int, useLetters: Bool, useNumbers: Bool, useCapitalLetters: Bool, useSpecialCharacters: Bool) {
        
        var numchars = min(numbersOfCharaters, 16)
        numchars = max(numchars, 1)
        
        self.numbersOfCharaters = numchars
        self.numbersOfPasswords = numbersOfPasswords
        self.useLetters = useLetters
        self.useNumbers = useNumbers
        self.useCapitalLetters = useCapitalLetters
        self.useSpecialCharacters = useSpecialCharacters
    }
    
    func generate (total: Int) -> [String] {
        passwords.removeAll()
        var universe: String = ""
        
        if useLetters {
            universe += letters
        }
        
        if useNumbers {
            universe += numbers
        }
        
        if useSpecialCharacters {
            universe += specialCharacters
        }
        
        if useCapitalLetters {
            universe += letters.uppercased()
        }
        
        let universeArray = Array(universe)
        while passwords.count < total {
            var password = ""
            for _ in 1...numbersOfCharaters {
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
            passwords.append(password)
        }
        
        return passwords
    }
}
