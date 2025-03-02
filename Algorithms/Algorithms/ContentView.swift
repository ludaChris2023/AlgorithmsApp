//
//  ContentView.swift
//  Algorithms
//
//  Created by Christopher Heffernan on 3/2/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            AlgorithmButton(title: "Quick Sort")
            AlgorithmButton(title: "Merge Sort")
            AlgorithmButton(title: "Binary Search")
            AlgorithmButton(title: "Dijkstra's Algorithm")
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]),
                           startPoint: .topLeading, endPoint: .bottomTrailing)
        )
    }
}

struct AlgorithmButton: View {
    let title: String
    
    var body: some View {
        VStack {
            Button(action: {
                // Action to navigate or process the algorithm
            }) {
                Text(title)
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            Spacer().frame(height: 5) // Spacer added here, no need to repeat it for each button
        }
    }
}

#Preview {
    ContentView()
}
