//
//  WorkoutPage.swift
//  FitnessTrack
//
//  Created by Alvin Amri on 23/01/24.
//

import SwiftUI

struct WorkoutPage: View {
    @ObservedObject var exerciseViewModel: ExerciseViewModel = ExerciseViewModel();
    @State var showingAlert: Bool = false
    
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
                            showingAlert = true
                        }
                        .alert("\(exercise.headline)", isPresented: $showingAlert) {
                            Button("OK", role: .cancel) { }
                        }
                    }
                } .searchable(text: $exerciseViewModel.searchText)
                
            }
            
            
        }
        .navigationTitle("Start workout")
        .onAppear {
            exerciseViewModel.generateData();
        }
    }
}

#Preview {
    WorkoutPage()
}
