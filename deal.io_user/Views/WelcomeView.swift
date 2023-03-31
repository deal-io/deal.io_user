//
//  WelcomeView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/28/23.
//

import SwiftUI

struct WelcomeView: View {
    @ObservedObject var viewModel: UserViewModel
    @State private var email = ""
    @State private var showInvalidAlert = false
    var onLogin: () -> Void // new closure parameter
    
    var body: some View {
        VStack {
            Spacer()
            Image("dealio_white_on_bg")
                .resizable()
                .frame(width: 350, height: 150)
            Spacer()
            Spacer()
            Text("*Please input your @mines.edu email below: ")
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
            EmailTextField(email: $email)
            Spacer()
            Spacer()
            Button(action: {
                if isValidEmail(email: email) {
                    print("WV: isValid: true")
                    UserManager.shared.login(email: email)
                    showInvalidAlert = false
                    onLogin()
                } else {
                    print("WV: isValid: false")
                    showInvalidAlert = true
                }
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                        .frame(width: 160, height: 80)
                    Text("Submit")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            Text("*Your email is only required to verify that you are a student.\n\nYou will not recieve any marketing or promotional materials at this email address.")
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(16)
                .font(.footnote)
        }
        .background(Deal_ioColor.background)
        .alert(isPresented: $showInvalidAlert) {
            Alert(title: Text("Invalid Login"), message: Text("Please enter an @mines.edu email"), dismissButton: .default(Text("OK")))
        }
    }
}

struct EmailTextField: View {
    @Binding var email: String
    
    var body: some View {
        TextField("Email", text: $email)
            .textContentType(.emailAddress)
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .multilineTextAlignment(.center)
            .background()
            .padding(12)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .shadow(color: Deal_ioColor.darkShadow, radius: 1, x: 2, y: 2)
            .shadow(color: Deal_ioColor.lightShadow, radius: 1, x: -2, y: -2)
    }
}

func isValidEmail(email: String) -> Bool {
    return email.hasSuffix("@mines.edu")
}


