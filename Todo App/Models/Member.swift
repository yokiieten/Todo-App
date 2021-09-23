//
//  Member.swift
//  Todo App
//
//  Created by Yok on 22/9/2564 BE.
//

import Foundation

import Mapper


struct Model_Member  :  Codable, Mappable  {
    var member_email : String
    var member_password : String
   
   
    init(map: Mapper) throws {
       
        member_email = map.optionalFrom("member_email") ?? ""
        member_password = map.optionalFrom("member_password") ?? ""
        
        
    }
    
        public init(){
            member_email = ""
            member_password = ""
        }
}
