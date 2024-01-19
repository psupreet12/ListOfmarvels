//
//  ListView.swift
//  ListOfMarvels
//
//  Created by Supreet on 14/01/24.
//

import SwiftUI

enum ComicType: String{
    case detail = "detail"
    case wiki = "wiki"
    case comiclink = "comiclink"
}
struct ListView: View {
    @StateObject var homeMode = HomeViewModel()

    var char: [Character] = []
    @Binding var isval: String
    func fetchData() -> [Character]{
        if isval.isEmpty {
            return homeMode.dataFetch
        }else{
            return homeMode.dataFetch.filter{$0.name.localizedCaseInsensitiveContains(isval)}

        }
    }
    var body: some View {
        VStack(spacing: 15){
            
            if homeMode.isLoading{
                ProgressView("Loading...")
                    .padding()
            }else{
                
               
                ForEach(fetchData()){ val in
                    
                    NavigationLink(destination: webView(url: (extractUrl(url: val.urls, type: .comiclink)!)),label: {
                        HStack{
                          
                            ImageView(url: val.thumbnail["path"]!)
                            VStack(alignment: .leading, spacing: 12){
                                Text(val.name)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                Text(val.description)
                                    .foregroundStyle(.brown)
                                    .lineLimit(4)
                                    .multilineTextAlignment(.leading)
                            }
                            Spacer(minLength: 0)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        
                    })
            
                }
               
            }

            
            
        }
        .padding()
        
        .task {
            if homeMode.dataFetch.isEmpty{
                homeMode.fetchDataFromModeilAPI()
            }
           
          }
        }

    func extractUrl(url: [[String: String]], type: ComicType) -> URL? {
        
        let urlDict = url.filter{$0["type"] == type.rawValue}
        if let urlDict = urlDict.first{
            if let url = URL(string: urlDict["url"]!){
                print("TYPE..\(type.rawValue)...url..\(url)")

                return url
            }
        }
       
        return nil
    }
  
}

#Preview {
    ListView(isval: .constant(""))
}
