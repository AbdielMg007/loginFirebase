//
//  LoginHeader.swift
//  Multilogin
//
//  Created by Abdiel Mg on 02/04/24.
//

import SwiftUI

struct LoginHeader: View {
    var body: some View {
        VStack {
            Text("Hello")
                .font(.largeTitle)
                .fontWeight(.medium)
                .padding()
            
            Text("Loggin with google")
                .multilineTextAlignment(.center)
        }
    }
}

struct LoginHeader_Previews: PreviewProvider {
    static var previews: some View {
        LoginHeader()
    }
}
