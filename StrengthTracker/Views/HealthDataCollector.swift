//
//  HealthDataCollector.swift
//  StrengthTracker
//
//  Created by Work on 11/29/22.
//

import SwiftUI

struct HealthDataCollector: View {
    
    private var repository = HKRepository()
    
    var item: [GridItem]{
        Array(repeating: .init(.adaptive(minimum: 120)),count: 2)
    }
    
    var body: some View {
        
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                LazyVGrid(columns: item, spacing: 10){
                    ForEach(HKSample.allSamples()){ sample in
                        NavigationLink(destination: HealthDataView(sample: sample, repository: repository)){
                            VStack {
                                Text(sample.image)
                                    .frame(width:50, height:50)
                                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.green.opacity(0.7)))
                                Text(sample.name)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.green.opacity(0.2)))
                        }.buttonStyle(PlainButtonStyle())
                    }
                    .padding()
                    NavigationLink(destination: StrainCalculator()){
                        VStack {
                            Text("💪")
                                .frame(width:50, height:50)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color.blue.opacity(0.7)))
                            Text("Strain Calculator")
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue.opacity(0.2)))
                        .offset(x: 100)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .onAppear { repository.requestAuthorization { success in
                    print("Authorization Success?\(success)")
                }
            }
        }
        .navigationTitle("Health Data")
        .navigationBarTitleDisplayMode(.inline)
        }
}
    
    struct HealthDataCollector_Previews: PreviewProvider {
        static var previews: some View {
            HealthDataCollector()
        }
    }
}
