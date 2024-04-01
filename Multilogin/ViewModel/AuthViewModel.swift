//
//  AuthViewModel.swift
//  Multilogin
//
//  Created by Abdiel Mg on 01/04/24.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    private var auth = Auth.auth()
    var signedInCallback: ((Bool) -> Void)?
    
    func signInWithGoogle() {
        let googleAuthProvider = OAuthProvider(providerID: "google.com")
        googleAuthProvider.scopes = ["email"]
        
        auth.signIn(with: googleAuthProvider) { (result, error) in
            if let error = error {
                print("Error al iniciar sesión con Google: \(error.localizedDescription)")
                self.signedInCallback?(false)
                return
            }
            
            if let result = result {
                self.signInFirebase(with: result)
            }
        }
    }
    
    private func signInFirebase(with result: AuthDataResult) {
        guard let authentication = result.user.authentication else {
            print("No se pudo obtener la autenticación de Google")
            self.signedInCallback?(false)
            return
        }
        
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        
        auth.signIn(with: credential) { (authResult, error) in
            if let error = error {
                print("Error al iniciar sesión con Firebase usando Google: \(error.localizedDescription)")
                self.signedInCallback?(false)
                return
            }
            
            if let _ = authResult?.user {
                print("Inicio de sesión exitoso con Firebase usando Google")
                self.signedInCallback?(true)
            }
        }
    }
}


