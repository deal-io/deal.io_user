//
//  HelpButton.swift
//  deal.io_user
//
//  Created by Levi Ortega on 4/13/23.
//

import Foundation
import SwiftUI

struct HelpButton: View {
    @State private var showingPopup = false
    
    var body: some View {
        VStack {
                    Button(action: {
                        self.showingPopup = true
                    }) {
                        Image(systemName: "questionmark.circle").foregroundColor(.white).font(.system(size: 22)).padding(15)
                    }.padding(15)
                   
                    
                }
        .alert(isPresented: $showingPopup) {
            Alert(title: Text("Need help or want to submit feedback?"), message: Text("Email us at deal.io.help@gmail.com"), dismissButton: .default(Text("OK")))
            
            
        }
        
    }
}
