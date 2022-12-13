//
//  Workout History.swift
//  StrengthTracker
//
//  Created by Work on 11/16/22.
//

import SwiftUI

struct WorkoutHistory: View {
    var body: some View {
        VStack {
            Text("Workout History").font(.title).padding()
            Text("Calendar view of workouts recorded").font(.subheadline)
        }
    }
}

struct WorkoutHistory_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutHistory()
    }
}
