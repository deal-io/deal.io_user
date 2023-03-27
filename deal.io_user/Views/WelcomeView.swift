//
//  WelcomeView.swift
//  deal.io_user
//
//  Created by Tyler Keller on 2/28/23.
//

import SwiftUI

struct WelcomeView: View {
    @ObservedObject var welcomeVM: WelcomeViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Image("dealio_white_on_bg")
                .resizable()
                .frame(width: 500, height: 300)
            Text("*Please input your @mines.edu email below: ")
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
            EmailTextField(email: welcomeVM.emailBinding)
            // below code allows for change of view from WelcomeView
            // to FeedView after a valid email is passed in
            // the else block needs to be updated
            // can't pass in code without API calls because it would bloat
            // tf out of this file
            /*
            Button(action: {
                if welcomeVM.validateEmail() {
                    welcomeVM.saveUser()
                    UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: FeedView(feedVM: FeedViewModel(), dailyDeals: , upcomingDeals: <#T##[BasicDealViewModel]#>))
                } else {
                    welcomeVM.showError = true
                }
            }) {
                Text("Submit")
            }
            */
            Spacer()
            Spacer()
            Text("*Your email is only required to verify that you are a student.\n\nYou will not recieve any marketing or promotional materials at this email address.")
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(16)
                .font(.footnote)
        }.background(Deal_ioColor.background)
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
        /*
            .onChange(of: email) { value in
                isEmailValid = isValidEmail(email)
            }
         */
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        return email.hasSuffix("@mines.edu")
    }
}

