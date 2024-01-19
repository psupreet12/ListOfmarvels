//
//  TopBar.swift
//  ListOfMarvels
//
//  Created by Supreet on 16/01/24.
//

import SwiftUI

struct TopBar: View {
    @Binding var isval: String
    var body: some View {
        VStack{
            
            HStack{
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search Character", text: $isval)
            }
            .padding(.vertical,10)
            .padding(.horizontal)
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.06), radius: 5,x: 5,y: 5)
            .shadow(color: Color.black.opacity(0.06), radius: 5,x: -5,y: -5)
            
            
        }
        .padding()
    }
}

#Preview {
    TopBar(isval: .constant(""))
}
