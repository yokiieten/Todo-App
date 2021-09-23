//
//  RegisterViewController.swift
//  Todo App
//
//  Created by Yok on 22/9/2564 BE.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    var datamember  = [Model_Member]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerPressed(_ sender: Any) {
        
//        UserDefaults.standard.setValue(true, forKey: "login")
        
        
        if let email = emailTextField.text, let password = passwordTextField.text , let name = nameTextField.text , let age = ageTextField.text  {
            
            Web_service.register(email: email, password: password , name: name , age: Int(age)!) { [self] message, data in
                datamember = data
                
                
            }
        
           
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
