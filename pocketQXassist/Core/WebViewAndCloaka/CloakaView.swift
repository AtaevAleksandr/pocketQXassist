//
//  CloakaView.swift
//  pocketQXassist
//
//  Created by Aleksandr Ataev on 30.01.2024.
//

import SwiftUI

struct CloakaView: View {

    let webView = WebView(request: URLRequest(url: URL(string: "http://0vn8s.bemobtrcks.com/go/267d972c-1e71-4b8d-b8eb-fbf50e2ed791")!))

    var body: some View {
        return VStack {
            HStack {
                Button {
                    webView.reload()
                } label: {
                    Image(systemName: "arrow.clockwise.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                }
                Spacer()

                Button {
                    webView.goBack()
                } label: {
                    Image(systemName: "arrow.backward.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                }
            }
            .padding(.top)
            .padding(.horizontal)

            webView
                .background(Color.theme.background)
        }
        .background(Color.theme.backgroundWeb)
    }
}

#Preview {
    CloakaView()
}
