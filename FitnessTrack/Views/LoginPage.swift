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
    
    var body: some View {
        
        NavigationStack {
            VStack(content: {
                VStack {
                    VStack {
                        FloatingTextField(fieldValue: $email, fieldLabel: "Email")
                        
                        FloatingTextField(fieldValue: $password, fieldLabel: "Password", isSecurityField: true)
                        
                        HStack {
                            Button("Forgot Password") {
                                
                            }
                            .font(.subheadline)
                            .frame(alignment: .leading)
                            .padding(.top, 10)
                            .foregroundStyle(.primary)
                            Spacer()
                        }
                    }
                    .frame( alignment: .topLeading)
                }
                .frame(maxHeight: .infinity, alignment: .topLeading)
                
                NavigationLink(destination: EmptyView()) {
                    Text("Sign in")
                        .font(.headline)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .frame(maxWidth: .infinity)
                        .cornerRadius(20)
                    
                }.buttonStyle(BorderedProminentButtonStyle())
                
                Text("Don't have an account? \(Text("Sign up!").bold())")
                    .padding(.top, 20)
                
            }).padding()
                .navigationTitle("Sign in")
        }
    }
}

#Preview {
    LoginPage()
}
