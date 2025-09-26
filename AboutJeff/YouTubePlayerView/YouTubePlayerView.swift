import SwiftUI
import WebKit

struct YouTubePlayerView: UIViewRepresentable {
    let embedURL: URL

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        let web = WKWebView(frame: .zero, configuration: config)
        web.isOpaque = false
        web.backgroundColor = .clear
        web.scrollView.isScrollEnabled = false
        return web
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if uiView.url == embedURL { return }
        let html = """
        <html><head><meta name='viewport' content='initial-scale=1'/>
        <style>html,body{margin:0;background:transparent;}
        iframe{position:absolute;top:0;left:0;width:100%;height:100%;border:0;border-radius:18px;}
        </style></head>
        <body>
        <iframe src='\(embedURL.absoluteString)' allow='accelerometer;autoplay;clipboard-write;encrypted-media;gyroscope;picture-in-picture;fullscreen' allowfullscreen>
        </iframe>
        </body></html>
        """
        uiView.loadHTMLString(html, baseURL: nil)
    }
}
