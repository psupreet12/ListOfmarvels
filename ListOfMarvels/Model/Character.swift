//
//  Character.swift
//  ListOfMarvels
//
//  Created by Supreet on 14/01/24.
//

import Foundation

struct APIResult: Codable{
    var data: APICharacters
}

struct APICharacters: Codable{
    var count : Int
    var results: [Character]
}
struct Character: Codable, Identifiable{
    var id: Int
    var name: String
    var description: String
    var thumbnail: [String: String]
    var urls: [[String: String]]
}

//struct urlModels: Codable{
//    
//    var val: [String: String]
//}
