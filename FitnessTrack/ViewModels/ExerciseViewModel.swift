//
//  ExerciseViewModel.swift
//  FitnessTrack
//
//  Created by Alvin Amri on 24/01/24.
//

import Foundation

class ExerciseViewModel: ObservableObject {
    @Published var exercises: [ExerciseModel] = []
    @Published var searchText: String = ""
    
    func generateData() {
        exercises = []
        exercises.append(ExerciseModel(imageURL: "dumbellPress", headline: "Benchpress", subheadline: "Chest"))
        exercises.append(ExerciseModel(imageURL: "dumbellPress", headline: "Chest press", subheadline: "Chest"))
        exercises.append(ExerciseModel(imageURL: "dumbellPress", headline: "Dumbell curl", subheadline: "Biceps"))
    }
    var filteredExercises: [ExerciseModel] {
        guard !searchText.isEmpty else { return exercises }
        return exercises.filter { exercise in
            exercise.headline.lowercased().contains(searchText.lowercased()) || exercise.subheadline.lowercased().contains(searchText.lowercased())
        }
    }
}
