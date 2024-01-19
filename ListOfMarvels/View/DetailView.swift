//
//  DetailView.swift
//  ListOfMarvels
//
//  Created by Supreet on 18/01/24.
//

import SwiftUI

struct DetailView: View {
     var val: String = String()
    var str: String = String()
    var body: some View {
        ImageView(url: str)
        Text(val)
        Spacer()
    }
}

#Preview {
    DetailView()
}
