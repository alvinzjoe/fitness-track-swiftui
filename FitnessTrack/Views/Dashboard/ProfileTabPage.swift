//
//  ProfileTabPage.swift
//  FitnessTrack
//
//  Created by Alvin Amri on 23/01/24.
//

import SwiftUI

struct ProfileTabView: View {
    var body: some View {
        NavigationView(content: {
            VStack {
                Form {
                    Section() {
                        List {
                            NavigationLink {
                                
                            } label: {
                                HStack {
                                    Circle()
                                        .stroke(.gray, lineWidth: 1)
                                        .frame(width: 50)
                                        .foregroundStyle(.white)
                                        .overlay {
                                            Image(systemName: "person")
                                        }
                                    VStack {
                                        Text("Alvin Amri")
                                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                        Text("alvin.amri@42interactive.com")
                                            .font(.subheadline)
                                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                    }
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                }
                            }
                        }
                    }
                    Section() {
                        List {
                            NavigationLink {
                                
                            } label: {
                                Text("Profile Details")
                            }
                            NavigationLink {
                                
                            } label: {
                                Text("Change Move Goal")
                            }
                            NavigationLink {
                                
                            } label: {
                                Text("Units of Measure")
                            }
                        }
                    }
                    Section() {
                        List {
                            NavigationLink {
                                
                            } label: {
                                Text("Fitness Tracker Privacy")
                            }

                        }
                    }
                }
                
                
            }
            VStack {
                Circle()
                    .stroke(.gray, lineWidth: 2)
                    .frame(width: 100)
                    .foregroundStyle(.white)
                    .overlay {
                        Image(systemName: "person")
                    }
                Text("Profile")
            }
            .frame(maxHeight: .infinity, alignment: .topLeading)
            .navigationTitle("My profile")
        })
    }
}

#Preview {
    ProfileTabView()
}
