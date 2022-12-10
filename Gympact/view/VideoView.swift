//
//  VideoView.swift
//  Gympact
//
//  Created by Jordan Bhar on 2022-12-09.
//

import SwiftUI
import WebKit

struct VideoView: View {
    
    let URL : String

    var body: some View {
        VStack{
            Video(videoURL: URL)
                .frame(width: 350, height: 200, alignment: .leading)
                .cornerRadius(15)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(.blue, lineWidth: 3)
        )
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(URL: "NA")
    }
}

struct Video : UIViewRepresentable{
    
    let videoURL : String
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let youtubeURL = URL(string: "\(videoURL)") else
        {return}
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
    
    func makeUIView(context: Context) -> some WKWebView {
        return WKWebView()
    }
}
