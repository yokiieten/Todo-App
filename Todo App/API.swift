//

//

import Foundation
import Alamofire
struct Url_service {
    static func get_url() -> String {
        
        return "https://api-nodejs-todolist.herokuapp.com"
    }
}
struct Web_service {
   
    
    static func register(email : String ,password : String , name : String , age : Int ,  completion: @escaping (_ message: String,_ data: [Model_Member] ) -> ()) {
        var data_member = [Model_Member]()
        AF.request(Url_service.get_url() + "/user/register", method: .post, parameters: ["email":email , "password" : password, "name" : name , "age" : age ],encoding: JSONEncoding.default ).responseJSON { (respon) in
            switch respon.result {
            case.success(let value):
                
                if let data = value as? NSDictionary {
                    
                        if let data_2 = data["user"] as? Array<AnyObject> {
                            data_member = Model_Member.from(data_2 as NSArray)!
                            completion("ok", data_member)
                        }
                    
                }
            case .failure(let error):
                completion(error.localizedDescription, data_member)
                print(error.localizedDescription)
            }
        }
    }
    
    
    static func login(email : String ,password : String  ,  completion: @escaping (_ message: String,_ data: String ) -> ()) {
//        var data_member = Model_Member()
        AF.request(Url_service.get_url() + "/user/login", method: .post, parameters: ["email":email , "password" : password ],encoding: JSONEncoding.default ).responseJSON { (respon) in
            switch respon.result {
            case.success(let value):
                
                if let data = value as? NSDictionary {
                    
                    if let data_2 = data["token"] as? String {
                        print(data_2)
                        completion("ok", data_2)

                    }
                    
                    if let data_user = data["user"] as? NSDictionary {
//                        data_member.member_email = data_user["email"] as! String
//                        data_member.member_password = "data_user[] as! String"
//                        completion("ok", data_member)

                        
                    }
                    

                    
                } else {
                    print(value)
                    completion(value as! String, "fail")
                }
            case .failure(let error):
                completion(error.localizedDescription, "fail")
                print(error.localizedDescription)
            }
        }
    }

    
    static func showTodoList(token : String , completion: @escaping (_ message: String,_ data: ToDoList ) -> ()) {
        var data_list = ToDoList()
        AF.request(Url_service.get_url() + "/task", method: .get, encoding: JSONEncoding.default, headers: ["Authorization" : token ] ).responseJSON { (respon) in
            switch respon.result {
            case.success(let value):
                
                if let data = value as? NSDictionary {
                    
                    
                        if let dataCount = data["count"] as? Int {
                            
                            data_list.count = dataCount
//                            completion("ok", data_list)
                            
                            if let dataList = data["data"] as? Array<AnyObject> {
                                data_list.data = DataToDoList.from(dataList as NSArray)!
                                completion("ok", data_list)
                            }
                           
                        }
                    
                }
            case .failure(let error):
                completion(error.localizedDescription, data_list)
                print(error.localizedDescription)
            }
        }
    }
    
    
    static func addTodoList(  token : String ,description : String , completion: @escaping (_ message: String ) -> ()) {
       
        AF.request(Url_service.get_url() + "/task", method: .post, parameters: ["description":description  ] ,  encoding: JSONEncoding.default, headers: ["Authorization" : token ] ).responseJSON { (respon) in
            switch respon.result {
            case.success(let value):
                
                if let data = value as? NSDictionary {
                    
                    
                        if let dataSucces = data["success"] as? Bool {
                            if dataSucces == true {
                                completion("ok")
                            } else {
                                completion("false")
                            }
                            
                           
                        }
                    
                }
            case .failure(let error):
                completion(error.localizedDescription)
                print(error.localizedDescription)
            }
        }
    }
    
    static func deleteTodoList(  token : String ,id : String , completion: @escaping (_ message: String ) -> ()) {
      
        AF.request(Url_service.get_url() + "/task/\(id)", method: .delete ,  encoding: JSONEncoding.default, headers: ["Authorization" : token ] ).responseJSON { (respon) in
            switch respon.result {
            case.success(let value):
                
                if let data = value as? NSDictionary {
                    
                    
                        if let dataSucces = data["success"] as? Bool {
                            if dataSucces == true {
                                completion("ok")
                            } else {
                                completion("false")
                            }
                            
                           
                        }
                    
                }
            case .failure(let error):
                completion(error.localizedDescription)
                print(error.localizedDescription)
            }
        }
    }
    
    static func updateTodoList(  token : String ,id : String , completed : Bool ,  completion: @escaping (_ message: String ) -> ()) {
      
        AF.request(Url_service.get_url() + "/task/\(id)", method: .put ,  parameters: ["completed":completed  ], encoding: JSONEncoding.default , headers: ["Authorization" : token ] ).responseJSON { (respon) in
            switch respon.result {
            case.success(let value):
                
                if let data = value as? NSDictionary {
                    
                    
                        if let dataSucces = data["success"] as? Bool {
                            if dataSucces == true {
                                completion("ok")
                            } else {
                                completion("false")
                            }
                            
                           
                        }
                    
                }
            case .failure(let error):
                completion(error.localizedDescription)
                print(error.localizedDescription)
            }
        }
    }
    
    
}


