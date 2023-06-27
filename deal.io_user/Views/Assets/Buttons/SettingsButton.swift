//
//  SettingsButton.swift
//  deal.io_user
//
//  Created by Tyler Keller on 6/26/23.
//

import SwiftUI

struct SettingsButton: View {
    @ObservedObject var userManager = UserManager.shared
    @ObservedObject var viewModel = UserViewModel()
    
    @State private var isShowingSettings = false

    var body: some View {
        VStack {
            Button(action: {
                isShowingSettings = true
            }) {
                Image(systemName: "gearshape.fill")
                    .foregroundColor(Deal_ioColor.symbol(for: userManager.colorScheme))
                    .font(.system(size: 22))
                    .padding(25)
            }
            .sheet(isPresented: $isShowingSettings) {
                SettingsView(isShowing: $isShowingSettings)
            }
        }
    }
}

struct SettingsView: View {
    @ObservedObject var userManager = UserManager.shared
    @ObservedObject var viewModel = UserViewModel()
    
    @Binding var isShowing: Bool
    @State private var versionNumber = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "N/A"
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("ACCOUNT")) {
                    HStack {
                        Image(systemName: "envelope")
                        Text("Email")
                        Spacer()
                        Text(userManager.currentUser?.email ?? "N/A")
                    }
                }
                
                Section(header: Text("APP")) {
                    HStack {
                        Image(systemName: "circle.lefthalf.fill")
                        Text("Color Scheme")
                        Spacer()
                        Picker("", selection: $userManager.colorScheme) {
                            Text("Dark").tag(0)
                            Text("Light").tag(1)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                Section(header: Text("ABOUT")) {
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "questionmark.circle")
                            Text("Feedback Form")
                        }
                    }
                    
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "doc.plaintext")
                            Text("Terms of Use")
                        }
                    }
                    
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "lock.shield")
                            Text("Privacy Policy")
                        }
                    }
                    
                    HStack {
                        Image(systemName: "d.circle.fill")
                        Text("deal.io for iOS")
                        Spacer()
                        Text(versionNumber)
                    }
                }
            }
            .navigationBarTitle("Settings")
            .navigationBarItems(trailing: Button("Done") {
                isShowing = false
            })
        }
    }
}
