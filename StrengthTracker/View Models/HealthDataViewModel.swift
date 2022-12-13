//
//  HealthDataViewModel.swift
//  StrengthTracker
//
//  Created by Work on 11/22/22.
//

import UIKit
import HealthKit

final class HealthDataViewModel: ObservableObject{
        
        var sample: HKSample
        var repository: HKRepository
        
        @Published var data = [HealthData]()
        
        static let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM"
            return formatter
        }()
        
        init(sample: HKSample, repository: HKRepository){
            self.sample = sample
            self.repository = repository
            repository.requestHealthData(by: sample.id) {healthData in
                self.data = healthData
            }
        }
        
        let measurementFormatter = MeasurementFormatter()
        
        func measurement(from data: HKQuantity?) -> (value: Int, desc: String) {
            guard let data = data else { return (0, "")}
            
            measurementFormatter.unitStyle = .long
            
            if data.is(compatibleWith: .kilocalorie()){
                let value = data.doubleValue(for: .kilocalorie())
                return (Int(value), data.description)
            } else if data.is(compatibleWith: .minute()){
                let value = data.doubleValue(for: .minute())
                return (Int(value), data.description)
            }
            return (0, "")
        }
        
    }

