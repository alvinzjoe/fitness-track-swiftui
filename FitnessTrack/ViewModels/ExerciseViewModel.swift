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
