//
//  WeeklyGraph.swift
//  StrengthTracker
//
//  Created by Work on 11/22/22.
//

import SwiftUI

struct WeeklyGraph: View {
    
    let values: [Int]
    let labels: [String]
    let xAxisLabels: [String]
    
    var body: some View {
        GeometryReader { geo in
            
            HStack(alignment: .bottom){
                ForEach(0..<values.count){ idx in
                    let max = values.max() ?? 0
                    
                    VStack{
                        Text(labels[idx])
                            .font(.caption)
                            .foregroundColor(.white)
                            .rotationEffect(.degrees(0))
                        
                        Rectangle()
                            .fill(.green)
                            .frame(width:15, height: CGFloat(values[idx]) / CGFloat(max) * geo.size.height * 0.6)
                        
                        Text(xAxisLabels[idx])
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.opacity(0.75))
            .cornerRadius(10)
            .padding(.bottom, 20)
            
        }
    }
}

struct WeeklyGraph_Previews: PreviewProvider {
    static var previews: some View {
        let values = [100, 300, 350, 200, 100, 50, 300, 150]
        let labels = ["100", "300", "350", "200","100", "50", "300", "150"]
        let xAxisValues = ["Nov 22", "Nov 23", "Nov 24", "Nov 25", "Nov 26", "Nov 27", "Nov 28", "Nov 29"]
        WeeklyGraph(values: values, labels: labels, xAxisLabels: xAxisValues)
    }
}
