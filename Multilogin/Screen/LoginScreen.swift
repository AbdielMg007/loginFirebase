//
//  LoginScreen.swift
//  Multilogin
//
//  Created by Abdiel Mg on 02/04/24.
//

import SwiftUI
import FirebaseAuth
import GoogleSignIn
import Firebase

struct LoginScreen: View {
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            VStack {
                LoginHeader()
                    .padding(.bottom)
                
                CustomTextfield(text: $username)
                
                CustomTextfield(text: $username)
                
                HStack {
                    Spacer()
                    Button(action: {}) {
                        Text("Forgot Password?")
                    }
                }
                .padding(.trailing, 24)
                
                CustomButton()
                
                
                Text("or")
                    .padding()
                
                GoogleSiginBtn {
                    // TODO: - Call the sign method here
                    guard let clientID = FirebaseApp.app()?.options.clientID else { return }

                    // Create Google Sign In configuration object.
                    let config = GIDConfiguration(clientID: clientID)
                    GIDSignIn.sharedInstance.configuration = config

                    // Start the sign in flow!
                    GIDSignIn.sharedInstance.signIn(withPresenting: getRootViewController()) { [] result, error in
                      if let error = error {
                        // ...
                          return
                      }

                      guard let user = result?.user,
                        let idToken = user.idToken?.tokenString
                      else {
                        return
                      }

                      let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                                     accessToken: user.accessToken.tokenString)

                        Auth.auth().signIn(with: credential){result, error in
                            
                            guard error == nil else{
                                return
                            }
                            
                            print("sign in")
                    }
                    }
                } // GoogleSiginBtn
            } // VStack
            .padding(.top, 52)
            Spacer()
        }
    }
}


struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
