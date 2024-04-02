//
//  CustomButton.swift
//  Multilogin
//
//  Created by Abdiel Mg on 02/04/24.
//

import SwiftUI

struct CustomButton: View {
    var body: some View {
        Button(action: {}) {
            HStack {
                Spacer()
                Text("Login")
                    .foregroundColor(.white)
                Spacer()
            }
        }
        .padding()
        .background(.black)
        .cornerRadius(12)
        .padding()
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton()
    }
}
