//
//  LoginVC.swift
//  GroupChat
//
//  Created by Biswajit Banik on 11/19/17.
//  Copyright © 2017 Biswajit Banik. All rights reserved.
//

import UIKit


class LoginVC: UIViewController {

    @IBOutlet weak var passwordBtnWasPress: insertTextField!
    @IBOutlet weak var emailTextfield: insertTextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextfield.delegate  = self
        passwordBtnWasPress.delegate = self

    }

    @IBAction func signBtnWasPress(_ sender: Any) {
        
        if emailTextfield.text != nil && passwordBtnWasPress.text != nil {
          
            DataService.instance.loginUser(withEmail: emailTextfield.text!, andPassword: passwordBtnWasPress.text!, loginComplete: { (success, loginErrro) in
                
                if success {
                     self.dismiss(animated: true, completion: nil)
                    
                }else
                {
                    print(String(describing: loginErrro?.localizedDescription))

                }
                
                DataService.instance.registerUser(withEmail: self.emailTextfield.text!, andPassword: self.passwordBtnWasPress.text!, userCreationComplete: { (success, regError) in
                    
                    
                    if success {
                        DataService.instance.loginUser(withEmail: self.emailTextfield.text!, andPassword: self.passwordBtnWasPress.text!, loginComplete: { (success, nil) in
                            self.dismiss(animated: true, completion: nil)

                            print("Sucessful Register")
                            
                        })
                    }else
                    {
                        print(String(describing: regError?.localizedDescription))
                        
                    }
                })
                
            })
            
        }
    
    
    }
    
    @IBAction func closeBtnWasPress(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
}

extension LoginVC : UITextFieldDelegate {
    
    
    
}
