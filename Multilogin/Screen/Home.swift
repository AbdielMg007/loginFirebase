//
//  Home.swift
//  Multilogin
//
//  Created by Abdiel Mg on 02/04/24.
//

import SwiftUI
import FirebaseAuth

struct Home: View {
    var body: some View {
        VStack {
            Text("Iniciaste Sesión")
                .padding()
            
            Button(action: {
                do {
                    try Auth.auth().signOut()
                } catch {
                    print("Error al cerrar sesión: \(error.localizedDescription)")
                }
            }) {
                Text("Cerrar Sesión")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
            
            Spacer()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
