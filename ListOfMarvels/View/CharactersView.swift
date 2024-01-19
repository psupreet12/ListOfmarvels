//
//  CharactersView.swift
//  ListOfMarvels
//
//  Created by Supreet on 12/01/24.
//

import SwiftUI

struct CharactersView: View {
    
    @StateObject var homeMode = HomeViewModel()
    @State var val: String = ""
    @State private var isval: String = ""

    var body: some View {

        NavigationView{
            
            ZStack{
            
                    ScrollView {
                        
                        TopBar(isval: $isval)
                        ListView(isval: $isval)
          
                    }
            }
        
            .navigationTitle("Marvel")
        }.environmentObject(homeMode)
    }
}

#Preview {
    ContentView()
}
