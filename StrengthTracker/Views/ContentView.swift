//
//  ContentView.swift
//  StrengthTracker
//
//  Created by Work on 11/9/22.
//

import SwiftUI
//import HealthKit
struct ContentView: View {
    var body: some View {
        
        NavigationView {
            VStack (alignment: .leading){
                Divider()
                NavigationLink(destination: WorkoutRecorder()){
                    Text("Workout Recorder")
                }
                Divider()
                NavigationLink(destination: WorkoutHistory()){
                    Text("Workout History")
                }
                Divider()
                NavigationLink(destination: HealthDataCollector()){
                    Text("Health Data")
                }
                Divider()
                NavigationLink(destination: Progress()){
                    Text("Progress")
                }
                Divider()
            }
            .offset(x:10, y:-150)
            .navigationTitle("Strength Tracker").font(.title3)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
