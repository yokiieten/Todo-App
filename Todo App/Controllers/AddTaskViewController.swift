//
//  AddTaskViewController.swift
//  Todo App
//
//  Created by Yok on 23/9/2564 BE.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var completeSwitch: UISwitch!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    var state = 0
    
    var stateswitch = false
    
    var detail_Description = ""
    
    var id = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (state == 2) {
            completeSwitch.isHidden = false
            
            completeSwitch.setOn(stateswitch, animated: false)
            
            descriptionTextField.text = detail_Description
            
            titleLabel.text = "UPDATE TASK"
            okButton.setTitle("UPDATE", for: .normal)
     
            
            
        } else {
            completeSwitch.isHidden = true
            titleLabel.text = "ADD TASK"
            okButton.setTitle("OK", for: .normal)
        }

        // Do any additional setup after loading the view.
    }
    

    @IBAction func okPressed(_ sender: Any) {
        
        if (state == 1){
            
            if let description = descriptionTextField.text {
                if let   token = UserDefaults.standard.string(forKey: "token") {
                    Web_service.addTodoList(token: token, description: description) { msg in
                        print("res",msg)
                        self.navigationController?.popViewController(animated: true)
                        
                    }
                }
        }
        } else {
            
            if let   token = UserDefaults.standard.string(forKey: "token") {
                Web_service.updateTodoList(token: token, id: id, completed: completeSwitch.isOn) { msg in
                    print("res",msg)
                    let alert = UIAlertController(title: "UPDATE COMPLETE", message: nil , preferredStyle: .actionSheet)
                   
//                    self.present(alert, animated: true, completion: nil)
                    
                    self.navigationController?.popViewController(animated: true)
                    
                  
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
