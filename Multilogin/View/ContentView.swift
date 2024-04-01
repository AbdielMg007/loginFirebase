//
//  ContentView.swift
//  Multilogin
//
//  Created by Abdiel Mg on 01/04/24.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ContentView: View {
    var body: some View {
        VStack {
            if let user = Auth.auth().currentUser {
                Text("Hola, \(user.displayName ?? "Usuario")")
                Button("Cerrar sesión") {
                    do {
                        try Auth.auth().signOut()
                    } catch {
                        print("Error al cerrar sesión: \(error.localizedDescription)")
                    }
                }
            } else {
                Button(action: signInWithGoogle) {
                    Text("Iniciar sesión con Google")
                }
            }
        }
    }
    
    func signInWithGoogle() {
        let config = GIDConfiguration(clientID: FirebaseApp.app()?.options.clientID ?? "")
        GIDSignIn.sharedInstance.signIn(with: config, presenting: UIApplication.shared.windows.first?.rootViewController) { user, error in
            if let error = error {
                print("Error al iniciar sesión con Google: \(error.localizedDescription)")
                return
            }
            
            guard let authentication = user?.authentication,
                  let idToken = authentication.idToken,
                  let accessToken = authentication.accessToken else {
                print("Error al obtener los tokens de autenticación de Google")
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
            
            Auth.auth().signIn(with: credential) { result, error in
                if let error = error {
                    print("Error al iniciar sesión con Firebase: \(error.localizedDescription)")
                    return
                }
                
                if let result = result {
                    print("Inicio de sesión exitoso: \(result.user.uid)")
                }
            }
        }
    }
}

@main
struct MultiloginApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
