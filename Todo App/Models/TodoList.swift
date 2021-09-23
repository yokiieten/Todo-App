//
//  TodoList.swift
//  Todo App
//
//  Created by Yok on 23/9/2564 BE.
//

import Foundation
import Mapper


struct ToDoList  :  Codable, Mappable  {
    var count : Int
    var data :[DataToDoList]
   
   
    init(map: Mapper) throws {
       
        count = map.optionalFrom("count") ?? 0
        data = map.optionalFrom("data") ?? []
        
        
    }
    
        public init(){
            count = 0
            data = []
        }
}
