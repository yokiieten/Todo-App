//
//  MainToDoListTableViewController.swift
//  Todo App
//
//  Created by Yok on 23/9/2564 BE.
//

import UIKit

class MainToDoListTableViewController: UITableViewController {
    
    var dataToDoList = ToDoList()
    
    var statepage = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MainToDoListTableViewCell", bundle: nil), forCellReuseIdentifier: "MainToDoListTableViewCell")
//        loadData()
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        switch segue.identifier {
        case "->addtask":
            
            if let data = segue.destination as? AddTaskViewController{
               
                    
                    data.state = statepage
                
            
                if let sender = sender as? DataToDoList {
                    data.stateswitch = sender.completed
                    data.detail_Description = sender.description
                    data.id = sender._id
                }
                
               
//                data.subfood_detail = sender as? Model_Restaurantsubfood
                
                
            }
        default:
            break
        }
    }
    
    
    func loadData(){
        
        if let   token = UserDefaults.standard.string(forKey: "token") {
            Web_service.showTodoList(token: token) { [self] msg, data in
                
                dataToDoList = data
                DispatchQueue.main.async {
                    
                    
                    self.tableView.reloadData()
                }
                
            }
        }
        
        
        
        
    }
    
    @IBAction func addTaskPressed(_ sender: Any) {
        statepage = 1
        self.performSegue(withIdentifier: "->addtask", sender: nil)
       
    }
    
    
    // MARK: - Table view data source
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 0
    //    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataToDoList.data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainToDoListTableViewCell" , for: indexPath) as! MainToDoListTableViewCell
        cell.descriptionLabel.text = dataToDoList.data[indexPath.row].description
        
        if (dataToDoList.data[indexPath.row].completed == true){
            cell.doUIImage.image = UIImage(named: "pencil")
        } else {
            cell.doUIImage.image = UIImage(named: "pencil.slash")
        }

        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  
        // create the alert
        let alert = UIAlertController(title: "Do you want to update ?", message: nil , preferredStyle: .actionSheet)
        
    
        
        
          // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { [self](alert) in
   
            
            statepage = 2
            performSegue(withIdentifier: "->addtask", sender:dataToDoList.data[indexPath.row])
    

            
        }))
        alert.addAction(UIAlertAction(title: "No", style: .destructive, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
        
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contextItem = UIContextualAction(style: .destructive, title: "Delete") { [self]  (contextualAction, view, boolValue) in
          
                if let   token = UserDefaults.standard.string(forKey: "token") {
                    
                    Web_service.deleteTodoList(token: token, id: dataToDoList.data[indexPath.row]._id) { msg in
                        print("res",msg)
                        
                        loadData()
                    }
                        
                    }
                
            
            }

        let swipeActions = UISwipeActionsConfiguration(actions: [contextItem])
       
        return swipeActions
    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
