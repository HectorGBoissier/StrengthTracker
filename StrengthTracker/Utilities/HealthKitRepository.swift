//
//  HealthKitRepository.swift
//  StrengthTracker
//
//  Created by Work on 11/22/22.
//

import Foundation
import HealthKit

final class HKRepository{
    var healthStore: HKHealthStore? //Central repository for all user's heath data. Entry Point to the HealthKit API.
    
    let allTypes = Set([
        HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
        HKObjectType.quantityType(forIdentifier: .appleExerciseTime)!
    ])
    
    var query: HKStatisticsCollectionQuery?

    init() {
        healthStore = HKHealthStore()
    }
    
    //Request Authorization to Read Health Data
    func requestAuthorization(completion: @escaping (Bool) -> Void){
        guard let store = healthStore else{
            return
        }
        if !HKHealthStore.isHealthDataAvailable() {
            fatalError("Health data is not available!")
        }
        print("Requesting HealthKit authorization...")
        store.requestAuthorization(toShare: [], read: allTypes) { success, error in
            if let error = error {
                print("requestAuthorization error:", error.localizedDescription)
            }
            
            if success {
                print("HealthKit authorization request was successful!")
            } else {
                print("HealthKit authorization was not successful.")
            }
            completion(success)
        }
    }
    
    //Requested the HealthData by supplying the sample category. Returns array of HealthData
    func requestHealthData(by category: String, completion: @escaping([HealthData]) -> Void){
        guard let store = healthStore, let type = HKObjectType.quantityType(forIdentifier: typeByCategory(category: category)) else{
            return
        }
        let startDate = Calendar.current.date(byAdding: .day, value:-7, to: Date()) ?? Date() //if it is null start date is today
        let endDate = Date()
        let anchorDate = createAnchorDate() //Verify that this works as intended - anchor day Monday
        let dailyComponent = DateComponents(day: 1)
        
        var healthDataStats = [HealthData]()
        
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictStartDate)
        
        query = HKStatisticsCollectionQuery(quantityType: type,
                                            quantitySamplePredicate: predicate,
                                            options: .cumulativeSum,
                                            anchorDate: anchorDate,
                                            intervalComponents: dailyComponent)
        
        query?.initialResultsHandler = {query, statistics, error in
            statistics?.enumerateStatistics(from: startDate, to: endDate, with: { stats, _ in
                let data = HealthData(data: stats.sumQuantity(), date: stats.startDate)
                healthDataStats.append(data)
            })
            completion(healthDataStats)
        }
        
        guard let query = query else {
            return
        }
        
        store.execute(query)
    }
    
    /// Return an anchor date for a statistics collection query.
    func createAnchorDate() -> Date {
        // Set the arbitrary anchor date to Monday at 3:00 a.m.
        let calendar: Calendar = .current
        var anchorComponents = calendar.dateComponents([.day, .month, .year, .weekday], from: Date())
        let offset = (7 + (anchorComponents.weekday ?? 0) - 2) % 7
        
        anchorComponents.day! -= offset
        anchorComponents.hour = 3
        
        let anchorDate = calendar.date(from: anchorComponents)!
        
        return anchorDate
    }
    
    private func typeByCategory(category: String) -> HKQuantityTypeIdentifier{
        switch category{
        case "activeEnergyBurned":
            return .activeEnergyBurned
        case "appleExerciseTime":
            return .appleExerciseTime
        default:
            return .appleExerciseTime
        }
    }
    
}
