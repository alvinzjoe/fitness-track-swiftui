//
//  WorkoutPage.swift
//  FitnessTrack
//
//  Created by Alvin Amri on 06/02/24.
//

import SwiftUI

struct WorkoutPage: View {
    
    @Binding var workout: WorkoutModel
    
    //@State var workout: WorkoutModel = WorkoutModel(date: Date(), notes: "", exercises: [])
    
    var body: some View {
        VStack {
            List {
                ForEach(Array(workout.exercises.enumerated()), id: \.offset) { index, exercise in
                    NavigationLink(destination: ExcercisePage(exercise: self.$workout.exercises[index])) {
                        Text(exercise.headline)
                    }
                    
                }
            }
            Spacer()
            
            NavigationLink(destination: ExcerciseListPage(filtered: $workout.exercises)) {
                Text("Select exercise")
                    .font(.headline)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .frame(maxWidth: .infinity)
                    .cornerRadius(20)
                
            }.buttonStyle(BorderedProminentButtonStyle())
                .padding()
        }
        .navigationTitle("Workout")
    }
}

#Preview {
    NavigationStack {
        WorkoutPage(workout: .constant(WorkoutModel(date: Date(), notes: "", exercises: [])))
    }
}
