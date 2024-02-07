//
//  SetsModel.swift
//  FitnessTrack
//
//  Created by Alvin Amri on 07/02/24.
//

import Foundation

struct SetsModel: Identifiable {
    var id: String = UUID().uuidString
    var reps: String
    var weight: String
}
