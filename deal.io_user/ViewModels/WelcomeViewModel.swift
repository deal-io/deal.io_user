//
//  WelcomeViewModel.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/28/23.
//

import Foundation
import SwiftUI

class WelcomeViewModel: ObservableObject {
    
    @Published var user: User
        
    init(user: User) {
        self.user = user
    }
    
    var emailBinding: Binding<String> {
        Binding<String>(
            get: { self.user.email },
            set: { self.user.email = $0 }
        )
    }
    
    func saveUser() {
        if validateEmail() {
            // Code to save the user data goes here
        } else {
            // Handle invalid email address
        }
    }
    
    func validateEmail() -> Bool {
        // Check if email is valid (ends with "@mines.edu")
        return self.user.email.hasSuffix("@mines.edu")
    }
}
