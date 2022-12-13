//
//  HealthData.swift
//  StrengthTracker
//
//  Created by Work on 11/16/22.
//

import Foundation
import HealthKit

struct HealthData: Identifiable{
    var id = UUID()
    var data: HKQuantity?
    let date: Date
}
