//
//  LoginView.swift
//  Multilogin
//
//  Created by Abdiel Mg on 01/04/24.
//

import SwiftUI
import Firebase


struct LoginView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            Button(action: {
                viewModel.signInWithGoogle()
            }) {
                Text("Iniciar sesión con Google")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
