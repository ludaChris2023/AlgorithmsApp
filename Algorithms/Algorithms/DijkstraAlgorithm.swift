//
//  DijkstraAlgorithm.swift
//  Algorithms
//
//  Created by Christopher Heffernan on 3/2/25.
//

import SwiftUI

struct DijkstraAlgorithmView: View {
    var body: some View {
        AlgorithmDescriptionView(
            title: "Dijkstra's Algorithm",
            description: AlgorithmsDescription.dijkstra.rawValue, animation: "dijkstra",
            gradientColors: [Color.green, Color.blue] // Unique gradient for Dijkstra's algorithm
        )
    }
}

#Preview {
    NavigationStack{
        DijkstraAlgorithmView().environmentObject(AnimationState())
    }
}
