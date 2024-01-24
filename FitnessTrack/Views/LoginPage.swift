//
//  LoginPage.swift
//  FitnessTrack
//
//  Created by Alvin Amri on 12/01/24.
//

import SwiftUI

struct LoginPage: View {
    @State var email : String = "";
    @State var password : String = "";
    @State var teks : String = "default";
    var body: some View {
        VStack(content: {
            VStack {
                Image(systemName: "envelope")
                Text("Sign in")
                    .frame(maxWidth: .infinity,  alignment: .topLeading)
                
                VStack {
                    TextField("Email", text: $email)
                    SecureField("Password", text: $password)
                    Text("\(teks)")
                }
                .frame( alignment: .topLeading)
            }
            .frame(maxHeight: .infinity, alignment: .topLeading)
            
            Button(action: {
                
            }) {
                Text("Continue")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .padding()
                    .foregroundColor(.primary)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.gray400)
                    )
            }
        }).padding()
    }
}

#Preview {
    LoginPage()
}
