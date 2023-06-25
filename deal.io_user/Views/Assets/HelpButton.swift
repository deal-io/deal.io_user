//
//  HelpButton.swift
//  deal.io_user
//
//  Created by Levi Ortega on 4/13/23.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // This function intentionally left blank.
    }
}

struct HelpButton: View {
    @ObservedObject var userManager = UserManager.shared
    @State private var showingFeedbackForm = false
    
    var body: some View {
        VStack {
            Button(action: {
                self.showingFeedbackForm = true
            }) {
                Image(systemName: "questionmark.circle")
                    .foregroundColor(Deal_ioColor.symbol(for: userManager.colorScheme))
                    .font(.system(size: 22))
                    .padding(15)
            }.padding(15)
        }
        .sheet(isPresented: $showingFeedbackForm) {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        self.showingFeedbackForm = false
                    }) {
                        Circle()
                            .fill(Deal_ioColor.onBackground(for: userManager.colorScheme))
                            .frame(width: 30, height: 30)
                            .overlay(
                                Image(systemName: "xmark")
                                    .font(.system(size: 15, weight: .bold, design: .rounded)) // This should be less than the frame of the circle
                                    .foregroundColor(Deal_ioColor.text(for: userManager.colorScheme))
                            )
                    }
                    .padding(.top, 10)
                    .padding(.trailing, 10)
                }
                Spacer()
                WebView(url: URL(string: "https://forms.gle/gwmEXtZbodYMkAzS9")!)
            }
        }
    }
}
