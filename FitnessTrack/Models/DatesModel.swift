//
//  DatesModel.swift
//  FitnessTrack
//
//  Created by Alvin Amri on 24/01/24.
//

import Foundation

struct Dates: Identifiable {
    var id: String = UUID().uuidString
    var date: Date = Date()
    var day: String = ""
    var isActive: Bool = false;
    var isDidWorkout: Bool = false
}
