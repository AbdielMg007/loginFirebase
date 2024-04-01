//
//  MultiloginApp.swift
//  Multilogin
//
//  Created by Abdiel Mg on 01/04/24.
//

import SwiftUI

@main
struct MultiloginApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
        }
    }
}


