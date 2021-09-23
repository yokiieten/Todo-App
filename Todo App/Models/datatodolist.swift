//
//  datatodolist.swift
//  Todo App
//
//  Created by Yok on 23/9/2564 BE.
//

import Foundation

import Mapper



struct DataToDoList  :  Codable, Mappable  {
    var completed : Bool
    var _id : String
    var description : String
    var owner : String
    var createdAt : String
    var updatedAt : String
    var __v : Int
   
   
    init(map: Mapper) throws {
       
        completed = map.optionalFrom("completed") ?? false
        _id = map.optionalFrom("_id") ?? ""
        description = map.optionalFrom("description") ?? ""
        owner = map.optionalFrom("owner") ?? ""
        createdAt = map.optionalFrom("createdAt") ?? ""
        updatedAt = map.optionalFrom("updatedAt") ?? ""
        __v = map.optionalFrom("__v") ?? 0
        
    }
    
//        public init(){
//            member_email = ""
//            member_password = ""
//        }
}
