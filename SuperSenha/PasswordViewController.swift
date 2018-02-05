//
//  PasswordViewController.swift
//  SuperSenha
//
//  Created by Eduardo on 05/02/18.
//  Copyright © 2018 eduardo. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController {
    

    @IBOutlet weak var tvPwds: UITextView!
    
    
    var numbersOfCharaters: Int = 10
    var numbersOfPasswords: Int = 1
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacters: Bool!
    
    var passwordGenerator: PassowordGenerator!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Total de senha: \(numbersOfPasswords)"
        
        passwordGenerator = PassowordGenerator(numbersOfCharaters: numbersOfCharaters, numbersOfPasswords: numbersOfPasswords, useLetters: useLetters, useNumbers: useNumbers, useCapitalLetters: useCapitalLetters, useSpecialCharacters: useSpecialCharacters)
        
        generatorPasswords()
    }
    
    func generatorPasswords() {
        
        tvPwds.text = ""
        tvPwds.scrollRangeToVisible(NSRange(location: 0, length: 0))
        
        let passwords = passwordGenerator.generate(total: numbersOfPasswords)
        
        for pwd in passwords {
            tvPwds.text.append("\(pwd) \n\n")
        }
        
    }

    @IBAction func generate(_ sender: UIButton) {
        generatorPasswords()
    }
    
}
