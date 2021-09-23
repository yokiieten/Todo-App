//
//  ViewController.swift
//  Todo App
//
//  Created by Yok on 22/9/2564 BE.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func registorPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "->register", sender: self)
    }
    
    
    @IBAction func loginPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "->login", sender: self)
    }
    

}

