//
//  Binary.swift
//  Algorithms
//
//  Created by Christopher Heffernan on 3/2/25.
//
import SwiftUI
struct BinarySearchView: View{
    var body: some View{
        AlgorithmDescriptionView(
            title:"Binary Search",
            description: AlgorithmsDescription.binarySearch.rawValue, gradientColors: [Color.red, Color.yellow]
            
        )
    }
}


#Preview {
    BinarySearchView()
}

