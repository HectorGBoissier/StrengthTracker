//
//  StrainCalculator.swift
//  StrengthTracker
//
//  Created by Work on 11/29/22.
//

import SwiftUI

struct StrainCalculator: View {
    
    private var repository = HKRepository()
    
    var body: some View {

        VStack {
            Text("Strain").font(.title).padding()
            Text("Calculating strain based on available health data...").font(.subheadline)
        }
        
    }
}


struct StrainCalculator_Previews: PreviewProvider {
    static var previews: some View {
        StrainCalculator()
    }
}
