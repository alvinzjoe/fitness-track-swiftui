//
//  ExerciseModel.swift
//  FitnessTrack
//
//  Created by Alvin Amri on 24/01/24.
//

import Foundation

struct ExerciseModel: Identifiable {
    var id: String = UUID().uuidString
    var imageURL: String
    var headline: String
    var subheadline: String
    var sets: [SetsModel] = []
}
