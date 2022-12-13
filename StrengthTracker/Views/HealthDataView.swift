//
//  WeeklyData.swift
//  StrengthTracker
//
//  Created by Work on 11/22/22.
//

import SwiftUI

struct HealthDataView: View {
    var sample: HKSample
    var repository: HKRepository
    @ObservedObject var viewModel: HealthDataViewModel
    
    init(sample: HKSample, repository: HKRepository){
        self.sample = sample
        self.repository = repository
        
        viewModel = HealthDataViewModel(sample: sample, repository: repository)
    }
    
    var body: some View {
        WeeklyGraph(values: viewModel.data.map{viewModel.measurement(from: $0.data).value}, labels: viewModel.data.map {viewModel.measurement(from: $0.data).desc}, xAxisLabels: viewModel.data.map { HealthDataViewModel.dateFormatter.string(from: $0.date)})
        
        List(viewModel.data){ data in
            VStack(alignment: .leading){
                Text(viewModel.measurement(from: data.data).desc)
                Text(data.date, style: .date).opacity(0.5)
            }
        }
        .navigationBarTitle("\(sample.name) \(sample.image)",displayMode: .inline)
        
        let weeklyTotal = viewModel.data.map{viewModel.measurement(from: $0.data).value}.reduce(0, +)
            
        Text("Weekly Total = \(weeklyTotal)")
        .padding()
    }

}

struct HealthDataView_Previews: PreviewProvider {
    static var previews: some View {
        HealthDataView(sample: HKSample(id: "activeEnergyBurned", name: "Active Calories Burned", image: "🔥"), repository: HKRepository())
    }
}
