//
//  gif2.swift
//  Anime
//
//  Created by Kinder on 23/12/2021.
//

//

import SwiftUI
import WebKit

struct GifImage2: UIViewRepresentable {
    private let name: String
    init(_ name: String) {
        self.name = name
    }
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let url = Bundle.main.url(forResource: name, withExtension: "gif")!
        let data = try! Data(contentsOf: url)
        
        webView.load(
            data,
            mimeType: "image/gif",
            characterEncodingName: "UTF-8",
            baseURL: url.deletingLastPathComponent()
        )
        return webView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.reload()
    }
}



struct gif2_Previews2: PreviewProvider {
    static var previews: some View {
        GifImage("ff")
      
    }
}
