//
//  ExcercisePage.swift
//  FitnessTrack
//
//  Created by Alvin Amri on 23/01/24.
//

import SwiftUI

struct ExcercisePage: View {
    @State var sets : [SetsModel] = [
        SetsModel(reps: "0", weight: "0"),
        SetsModel(reps: "0", weight: "0"),
        SetsModel(reps: "0", weight: "0")
    ]
    
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Image("dumbellPress")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: .infinity, height: 250)
                        .clipped()
                    
                    Text("Dumbell Press")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .textSelection(.enabled)
                    Text("Sets")
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .font(.title)
                    
                    VStack {
                        LazyVGrid(
                            columns: [
                                GridItem(.flexible()),
                                GridItem(.flexible()),
                                GridItem(.flexible()),
                            ],
                            content: {
                                Text("")
                                Text("Reps").font(.caption)
                                Text("Weight (Kg)").font(.caption)
                            }
                        ).padding()
                        List {
                            ForEach(sets) { set in
                                Text("test")
                            }
                        }
                        ForEach(sets.indices, id: \.self) { index in
                            LazyVGrid(
                                columns: [
                                    GridItem(.flexible()),
                                    GridItem(.flexible()),
                                    GridItem(.flexible()),
                                ],
                                content: {
                                    Circle()
                                        .stroke()
                                        .frame(width: 40, height: 40)
                                        .overlay {
                                            Text("\(index+1)")
                                        }
                                    
                                    TextField("Reps", text: $sets[index].reps)
                                        .frame(width: 50)
                                        .multilineTextAlignment(.center)
                                        .keyboardType(.numberPad)
                                    
                                    
                                    TextField("Weight", text: $sets[index].weight)
                                        .frame(width: 50)
                                        .multilineTextAlignment(.center)
                                        .keyboardType(.numberPad)
                                }
                            )
                            Spacer()
                                .padding(.bottom, 5)
                        }
                        VStack {
                            Circle()
                                .stroke()
                                .frame(width: 40, height: 40)
                                .overlay {
                                    Text("+")
                                }
                                .onTapGesture {
                                    sets.append(SetsModel(reps: "0", weight: "0"))
                                }
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment:.leading)
                        .padding(.leading, 32)
                    }
                    .padding()
                    .background(.gray400)
                    .cornerRadius(20)
                    
                    
                    
                }.padding()
            }
            //.padding(
        }
    }
}

#Preview {
    ExcercisePage()
}
