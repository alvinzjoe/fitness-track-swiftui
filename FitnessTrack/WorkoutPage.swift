//
//  WorkoutPage.swift
//  FitnessTrack
//
//  Created by Alvin Amri on 23/01/24.
//

import SwiftUI

struct ExerciseModel: Identifiable {
    var id: String = UUID().uuidString
    var imageURL: String
    var headline: String
    var subheadline: String
}

class ExerciseViewModel: ObservableObject {
    @Published var exercises: [ExerciseModel] = []
    @Published var searchText: String = ""
    
    func generateData() {
        exercises.append(ExerciseModel(imageURL: "dumbellPress", headline: "Benchpress", subheadline: "z"))
        exercises.append(ExerciseModel(imageURL: "dumbellPress", headline: "Chest press", subheadline: "c"))
        exercises.append(ExerciseModel(imageURL: "dumbellPress", headline: "Benchpress", subheadline: "a"))
    }
    var filteredExercises: [ExerciseModel] {
        guard !searchText.isEmpty else { return exercises }
        return exercises.filter { exercise in
            exercise.headline.lowercased().contains(searchText.lowercased()) || exercise.subheadline.lowercased().contains(searchText.lowercased())
        }
    }
}

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
            
            .navigationTitle("Start workout")
        }
        .onAppear {
            exerciseViewModel.generateData();
        }
    }
}

#Preview {
    WorkoutPage()
}
