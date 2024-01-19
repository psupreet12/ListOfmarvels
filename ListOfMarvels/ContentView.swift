//
//  ContentView.swift
//  ListOfMarvels
//
//  Created by Supreet on 12/01/24.
//

import SwiftUI
struct ContentView: View {
    
    var body: some View {
//        
       TabView{
        
            CharactersView()
                .tabItem{
                    Image(systemName: "person.3.fill")
                    Text("Characters")
                }
            
            Text("Comics")
                .tabItem{
                    Image(systemName: "books.vertical.fill")
                    Text("Comics")
                }
        }
        
        
    }
    

}

#Preview {
    ContentView()
}
