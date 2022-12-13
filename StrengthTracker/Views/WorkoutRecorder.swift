//
//  WorkoutRecorder.swift
//  StrengthTracker
//
//  Created by Work on 11/9/22.
//

import SwiftUI

struct WorkoutRecorder: View {
    var body: some View {     
        VStack {
            Text("Workout Recorder").font(.title).padding()
            Text("Add Workout Session").font(.subheadline)
        }
    }

}

struct WorkoutRecorder_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutRecorder()
    }
}
