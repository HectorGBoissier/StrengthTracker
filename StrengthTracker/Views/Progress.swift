//
//  Progress.swift
//  StrengthTracker
//
//  Created by Work on 11/16/22.
//

import SwiftUI

struct Progress: View {
    var body: some View {
        VStack {
            Text("Progress").font(.title).padding()
            Text("Evaluating performance based on current strength cycle...").font(.subheadline)
        }

    }
}

struct Progress_Previews: PreviewProvider {
    static var previews: some View {
        Progress()
    }
}
