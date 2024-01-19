//
//  HomeViewModel.swift
//  ListOfMarvels
//
//  Created by Supreet on 12/01/24.
//

import Foundation
import CryptoKit
import UIKit
class HomeViewModel: ObservableObject{
    @Published var dataFetch: [Character] = []
    @Published var isLoading: Bool = true
    @Published var img: UIImage = UIImage()
    func fetchDataFromModeilAPI(){
        Task{
            
            let (data, load) = await APIData.getData()
            guard let data = data else {return}
            
            DispatchQueue.main.async{ [weak self] in
                self?.dataFetch = data
                self?.isLoading = load
            }
   
        }
    }
    
    func dd(url: String){
        Task{
            let (data) = await APIData().getURlImage(url: url + ".jpg")
            guard let datas = data else { return }
            DispatchQueue.main.async{
                if let img = UIImage(data: datas){
                    self.img = img
                }

            }
        }
     
    }
  

}
