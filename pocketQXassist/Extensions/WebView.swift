//
//  WebView.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 30.01.2024.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {

    let request: URLRequest
    var webView = WKWebView()

    init(request: URLRequest) {

        let configuration = WKWebViewConfiguration()
        let script = "var script = document.createElement('meta'); script.name = 'viewport'; script.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no'; document.head.appendChild(script);"
        let userScript = WKUserScript(source: script, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        configuration.userContentController.addUserScript(userScript)
        let customBackColor = Color.theme.backgroundWeb
        let uiColor = UIColor(customBackColor)

        self.webView = WKWebView(frame: .zero, configuration: configuration)
        self.webView.isOpaque = false
        self.webView.backgroundColor = uiColor
        self.webView.scrollView.backgroundColor = uiColor
        self.request = request
    }

    func makeUIView(context: Context) -> WKWebView {
        self.webView.navigationDelegate = context.coordinator
        return self.webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func goBack() {
        webView.goBack()
    }

    func reload() {
        webView.reload()
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView

        init(parent: WebView) {
            self.parent = parent
        }
    }
}
