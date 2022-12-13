//
//  HealthKitSample.swift
//  StrengthTracker
//
//  Created by Work on 11/16/22.
//

import Foundation

struct HKSample: Identifiable{
    var id: String
    var name: String
    var image: String
    
    static func allSamples() -> [HKSample]{
        return [
            HKSample(id: "activeEnergyBurned", name: "Active Calories Burned", image: "🔥"), //These correspond to the IDs of the HK Quantity Samples
            HKSample(id: "appleExerciseTime", name: "Exercise Time", image: "🏋️")

        ]
    }
}
