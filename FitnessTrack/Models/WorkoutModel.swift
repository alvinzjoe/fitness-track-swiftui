//
//  WorkoutModel.swift
//  FitnessTrack
//
//  Created by Alvin Amri on 07/02/24.
//

import Foundation

struct WorkoutModel: Identifiable {
    var id: String = UUID().uuidString
    var date: Date
    var notes: String
    var exercises: [ExerciseModel]
}
