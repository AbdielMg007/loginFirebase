//
//  MultiloginApp.swift
//  Multilogin
//
//  Created by Abdiel Mg on 01/04/24.
//

import SwiftUI

@main
struct MultiloginApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @AppStorage("signIn") var isSignIn = false
    
    var body: some Scene {
        WindowGroup {
            if !isSignIn {
                LoginScreen()
            } else {
                Home()
            }
        }
    }
}

