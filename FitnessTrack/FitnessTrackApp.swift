//
//  FitnessTrackApp.swift
//  FitnessTrack
//
//  Created by Alvin Amri on 12/01/24.
//

import SwiftUI

@main
struct FitnessTrackApp: App {
    var body: some Scene {
        WindowGroup {
            DashboardPage()
                .environment(\.colorScheme, .light) // Disable dark mode
        }
    }
}
