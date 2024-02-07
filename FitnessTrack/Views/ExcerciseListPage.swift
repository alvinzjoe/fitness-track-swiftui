//
//  WorkoutPage.swift
//  FitnessTrack
//
//  Created by Alvin Amri on 23/01/24.
//

import SwiftUI

struct ExcerciseListPage: View {
    @ObservedObject var exerciseViewModel: ExerciseViewModel = ExerciseViewModel();
    @Environment(\.presentationMode) var presentationMode
    @Binding var filtered: [ExerciseModel]
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(exerciseViewModel.filteredExercises) { exercise in
                        HStack {
                            Image("\(exercise.imageURL)")
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .clipped()
                            Spacer()
                                .frame(width: 15)
                            VStack {
                                Text("\(exercise.headline)")
                                    .font(.title)
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("\(exercise.subheadline)")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .onTapGesture {
                            filtered.append(exercise)
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                } .searchable(text: $exerciseViewModel.searchText)   
            }
        }
        .background(Color.clear)
        .navigationTitle("Start workout")
        .onAppear {
            exerciseViewModel.generateData();
        }
    }
}

#Preview {
    ExcerciseListPage(filtered: .constant([ExerciseModel(imageURL: "", headline: "", subheadline: "")]))
}
