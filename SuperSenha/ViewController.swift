//
//  ViewController.swift
//  SuperSenha
//
//  Created by Eduardo on 05/02/18.
//  Copyright © 2018 eduardo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var tfTotalPasswords: UITextField!
    @IBOutlet weak var tfNumberOfCharacters: UITextField!
    
    @IBOutlet weak var swLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swCapitalLetters: UISwitch!
    @IBOutlet weak var swSpecialCharacters: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordsViewController = segue.destination as! PasswordViewController
        
        if let numberOfPasswords = Int(tfTotalPasswords.text!){
            passwordsViewController.numbersOfPasswords = numberOfPasswords
        }
        
        if let numberOfCharacters = Int(tfNumberOfCharacters.text!){
            passwordsViewController.numbersOfCharaters = numberOfCharacters
        }
        
        passwordsViewController.useSpecialCharacters = swSpecialCharacters.isOn
        passwordsViewController.useCapitalLetters = swCapitalLetters.isOn
        passwordsViewController.useNumbers = swNumbers.isOn
        passwordsViewController.useLetters = swLetters.isOn
        view.endEditing(true)
    }


}

