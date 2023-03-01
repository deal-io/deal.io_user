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
            Text("Please input your @mines.edu email below: ")
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
            EmailTextField(email: welcomeVM.emailBinding)
            Button("Enter") {
                welcomeVM.saveUser()
            }
            Spacer()
            Text("Your email is only required to verify that you are a student.\n\nYou will not recieve any marketing or promotional materials at this email address.")
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .padding(16)
                .font(.caption)
            Spacer()
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
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(email: "")
        let welcomeVM = WelcomeViewModel(user: user)
        return WelcomeView(welcomeVM: welcomeVM)
    }
}
