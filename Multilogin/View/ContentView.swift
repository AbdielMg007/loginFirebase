//
//  ContentView.swift
//  Multilogin
//
//  Created by Abdiel Mg on 01/04/24.

import SwiftUI
import Firebase

@main
struct Multilogin: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var authViewModel = AuthViewModel()
    @State private var isAuthenticated = false
    
    var body: some Scene {
        WindowGroup {
            ContentView(isAuthenticated: $isAuthenticated)
                .environmentObject(authViewModel)
                .onAppear {
                    checkUserAuthentication()
                }
        }
    }
    
    private func checkUserAuthentication() {
        $authViewModel.signedInCallback = { isSignedIn in
            isAuthenticated = isSignedIn
        }
    }
}

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @Binding var isAuthenticated: Bool
    
    var body: some View {
        if isAuthenticated {
            // Usuario autenticado, mostrar vista principal
            Text("¡Bienvenido!")
                .padding()
        } else {
            // Usuario no autenticado, mostrar vista de inicio de sesión
            LoginView()
        }
    }
}
