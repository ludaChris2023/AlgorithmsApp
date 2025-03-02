//
//  QuickSort.swift
//  Algorithms
//
//  Created by Christopher Heffernan on 3/2/25.
//
import SwiftUI

struct QuickSortView: View {
    var body: some View {
        AlgorithmDescriptionView(
            title: "Quick Sort Algorithm",
            description: AlgorithmsDescription.quickSort.rawValue, animation: "Quick",
            gradientColors: [Color.purple, Color.blue ] // Unique gradient for Quick Sort
        )
    }
}

#Preview {
    NavigationStack{
        QuickSortView().environmentObject(AnimationState())
    }
}
