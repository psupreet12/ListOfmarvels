//
//  HomeViewDataAPI.swift
//  ListOfMarvels
//
//  Created by Supreet on 18/01/24.
//

import Foundation
import CryptoKit
import UIKit
enum NetworkError: Error {
    case badURL
}
class APIData{
    
    
     class func getData() async -> (val: [Character]?, val2: Bool){

        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(data: "\(ts)\(Credentials.privateKey)\(Credentials.publicKey)")
        let url = "https://gateway.marvel.com:443/v1/public/characters?ts=\(ts)&apikey=\(Credentials.publicKey)&hash=\(hash)"

        
        do{
            let (data, _) = try await URLSession.shared.data(from: URL(string: url)!)
            guard let jsonDecode = try? JSONDecoder().decode(APIResult.self, from: data) else {return (val: nil, val2: true)}
            
                let dataFetch = jsonDecode.data.results
                let isLoading = false
               print("data..",dataFetch)
            return (val: dataFetch, val2: isLoading)
            
        }catch {
            let isLoading = true
            return (val: nil, val2: isLoading)
        }
       
    }
    
//    func getURlImage(url: String, completion: @escaping (UIImage) -> Void) {
//        
//        let url = url
//        let task = URLSession.shared.dataTask(with: URL(string: url)!){ (data, response, error) in
//            
//            guard let data = data, let img = UIImage(data: data) else { return }
//            completion(img)
//            
//        }
//        task.resume()
//    }
    
    func getURlImage(url: String) async -> Data? {
        
        let url = url
       
        
        do{
            let (data, _) = try await URLSession.shared.data(from: URL(string: url)!)
            return data
        }catch {
            //
        }
       return nil
    }
    
    private class func MD5(data: String) -> String{
        
        let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())
        return hash.map{
             String(format: "%02hhx", $0)
        }
        .joined()
    }
}

