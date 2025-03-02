//
//  MergeSort.swift
//  Algorithms
//
//  Created by Christopher Heffernan on 3/2/25.
//
import SwiftUI
struct MergeSortView: View {
    var body: some View {
        AlgorithmDescriptionView(
            title: "Merge Sort Algorithm",
            description: AlgorithmsDescription.mergeSort.rawValue,
            gradientColors: [Color.orange, Color.purple] // Unique gradient for Merge Sort
        )
    }
}

#Preview {
    NavigationStack{
        MergeSortView().environmentObject(AnimationState())
    }
}
