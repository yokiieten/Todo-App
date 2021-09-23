//
//  LoginViewController.swift
//  Todo App
//
//  Created by Yok on 22/9/2564 BE.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    var datamember  = Model_Member()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginPressed(_ sender: Any) {
  
        
//        textField.clearsOnBeginEditing = false
        
        if let email = emailTextField.text, let password = passwordTextField.text   {
            
            Web_service.login(email: email, password: password ) { [self] message, data in
                
                if message == "ok" {
//                    datamember = data
//                    print("email :",datamember.member_email)
                       UserDefaults.standard.setValue(data, forKey: "token")
//                           UserDefaults.standard.setValue(true, forKey: "login")
                    self.performSegue(withIdentifier: "->todolist", sender: self)
                    
                } else {
                    // create the alert
                           let alert = UIAlertController(title: message, message: "กรุณาล็อคอินใหม่", preferredStyle: UIAlertController.Style.alert)

                           // add an action (button)
                           alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                           // show the alert
                           self.present(alert, animated: true, completion: nil)
                       }
                    
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
