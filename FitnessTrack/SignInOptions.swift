//
//  SignInOptions.swift
//  FitnessTrack
//
//  Created by Alvin Amri on 12/01/24.
//

import SwiftUI

struct SignInOptions: View {
    var body: some View {
//        VStack(spacing:0) {
//                Image("banner")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                VStack {
//                    Text("VStack");
//                }
//                .frame(minWidth: 0, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                .background(.white)
//        }
//        .frame(maxHeight: .infinity, alignment: .top)
//        .padding(0)
//        .ignoresSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
        GeometryReader { metrics in
            ZStack() {
//                Image("banner")
//                    .resizable(resizingMode: .stretch)
//                    .aspectRatio(contentMode: .fill)
//                    .scaledToFill()
//                    .frame(width:.infinity, height: metrics.size.height*0.5, alignment: .center)
//                    .clipped()
                Color.clear
                .overlay(
                    Image("banner")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .scaledToFill()
                )
                .frame(width:.infinity, height: metrics.size.height*0.4, alignment: .center)
                .clipped()
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .overlay(
                VStack {
                    VStack {
                        Text("Welcome")
                            .font(.largeTitle)
                        Text("Continue with one of the following options")
                            .font(.subheadline)
                        
                        Spacer()
                        
                        VStack(spacing: 20) {
                            Button(action: {
                                print("sign up bin tapped")
                            }) {
                                Text("Google")
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .font(.system(size: 18))
                                    .padding()
                                    .foregroundColor(.primary)
                                    
                                    .overlay(
                                        Image(systemName: "heart.fill")
                                            .frame(width:60, height: 20)
                                            .foregroundColor(.primary)
                                        , alignment: .leading
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(Color.black, lineWidth: 1)
                                )
                            }
                            
                            
                            
                            Button(action: {
                                print("sign up bin tapped")
                            }) {
                                Text("Apple")
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                    .font(.system(size: 18))
                                    .foregroundColor(.primary)
                                    .padding()
                                    .overlay(
                                        Image(systemName: "gear")
                                            .frame(width: 60)
                                            .foregroundColor(.primary)
                                        , alignment: .leading
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(Color.black, lineWidth:1)
                                    )
                            }
                            
                            Button(action: {
                                
                            }) {
                                Text("Facebook")
                                    .padding()
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.primary)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                            .stroke(Color.black)
                                    )
                                    .overlay(
                                        Image(systemName: "ant")
                                            .frame(width: 60)
                                            .foregroundColor(.primary)
                                        , alignment: .leading
                                    )
                            }
                            
                            Button(action: {
                                
                            }) {
                                Text("Email")
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                    .padding()
                                    .foregroundColor(.primary)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(Color.black)
                                    )
                                    .overlay(
                                        Image(systemName: "folder")
                                            .frame(width: 60)
                                            .foregroundColor(.primary)
                                        , alignment: .leading
                                    )
                            }
                            Button(action: {
                                
                            }) {
                                Text("Skip for now")
                                    .font(.subheadline)
                                    .foregroundColor(.primary)
                            }
                        }
                        Spacer()
                        
                        Text("By continuing you automatically accept our Terms & Conditions, Privacy Policy and Cookies Policy")
                            .font(.caption)
                            .padding()
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .multilineTextAlignment(.center)
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                }
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 100, maxHeight: (metrics.size.height*0.8), alignment: .topLeading)
                    .background(.white)
                    .cornerRadius(25)
            ,
            alignment: .bottom)
            .padding(0)
            .ignoresSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    SignInOptions()
}
