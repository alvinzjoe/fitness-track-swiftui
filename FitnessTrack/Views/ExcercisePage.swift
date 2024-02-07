//
//  ExcercisePage.swift
//  FitnessTrack
//
//  Created by Alvin Amri on 23/01/24.
//

import SwiftUI

struct ExcercisePage: View {
    @State private var showAlert = false
    
    @Binding var exercise: ExerciseModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Image("dumbellPress")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 250)
                        .clipped()
                    
                    Text("\(exercise.headline)")
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
                        ForEach(exercise.sets.indices, id: \.self) { index in
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
                                    
                                    TextField("0", text: $exercise.sets[index].reps)
                                        .frame(width: 50)
                                        .multilineTextAlignment(.center)
                                        .keyboardType(.numberPad)
                                    
                                    
                                    TextField("0", text: $exercise.sets[index].weight)
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
                                    exercise.sets.append(SetsModel(reps: "", weight: ""))
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
        .onAppear {
            if exercise.sets.count <= 0 {
                exercise.sets = [
                    SetsModel(reps: "", weight: ""),
                    SetsModel(reps: "", weight: ""),
                    SetsModel(reps: "", weight: "")
                ]
            }
            
        }
    }
}

#Preview {
    ExcercisePage(exercise: .constant(ExerciseModel(id: "", imageURL: "dumbellPress", headline: "Dumbell press", subheadline: "Chest")))
}
