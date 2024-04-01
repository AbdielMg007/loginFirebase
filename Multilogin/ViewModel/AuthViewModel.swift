//
//  AuthViewModel.swift
//  Multilogin
//
//  Created by Abdiel Mg on 01/04/24.
//

import Foundation
import Firebase
import GoogleSignIn


class AuthViewModel: NSObject, ObservableObject, GIDSignInDelegate {
    @Published var user: User?

    override init() {
        super.init()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
    }

    func signInWithGoogle() {
        GIDSignIn.sharedInstance().presentingViewController = UIApplication.shared.windows.first?.rootViewController
        GIDSignIn.sharedInstance().signIn()
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            self.user = nil
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("Google sign in error: \(error.localizedDescription)")
            return
        }

        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)

        Auth.auth().signIn(with: credential) { (result, error) in
            if let error = error {
                print("Firebase sign in error: \(error.localizedDescription)")
                return
            }

            if let result = result {
                self.user = User(uid: result.user.uid, displayName: result.user.displayName, email: result.user.email, photoURL: result.user.photoURL)
            }
        }
    }
}
