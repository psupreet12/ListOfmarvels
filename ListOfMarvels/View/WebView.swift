//
//  WebView.swift
//  ListOfMarvels
//
//  Created by Supreet on 19/01/24.
//

import SwiftUI
import WebKit

struct webView: UIViewRepresentable{
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView()
        print("URL..",url)
        view.load(URLRequest(url: url))
        
        return view
        
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
    
                    let request = URLRequest(url: url)
                    uiView.load(request)
               
    }
    
}
