//
//  ImageView.swift
//  ListOfMarvels
//
//  Created by Supreet on 18/01/24.
//

import SwiftUI

struct ImageView: View {
    @StateObject var homeMode = HomeViewModel()
    var url: String = String()
    var body: some View {
        VStack{
            Image(uiImage: homeMode.img)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .cornerRadius(8)
        }
          .onAppear(){
            homeMode.dd(url: url)

          }
      
    }
}

#Preview {
    ImageView()
}
