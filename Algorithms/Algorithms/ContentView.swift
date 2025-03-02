//
//  ContentView.swift
//  Algorithms
//
//  Created by Christopher Heffernan on 3/2/25.
//

import SwiftUI

// Navigation state to control which view is active and which algorithm is selected
class NavigationState: ObservableObject {
    @Published var isBlankViewActive: Bool = false
    @Published var selectedAlgorithm: String? = nil // Track selected algorithm
}

struct ContentView: View {
    @EnvironmentObject var navigationState: NavigationState // Access the shared navigation state
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Header(title: "Algorithm Learning")
                CustomSpacer(height: 65)
                
                // Each button now passes its title to the shared navigation state
                AlgorithmButton(title: "Quick Sort")
                CustomSpacer(height: 5)
                
                AlgorithmButton(title: "Merge Sort")
                CustomSpacer(height: 5)
                
                AlgorithmButton(title: "Binary Search")
                CustomSpacer(height: 5)
                
                AlgorithmButton(title: "Dijkstra's Algorithm")
                CustomSpacer(height: 25)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]),
                               startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            // Use the updated NavigationState for navigation to the selected algorithm view
            .navigationDestination(isPresented: $navigationState.isBlankViewActive) {
                switch navigationState.selectedAlgorithm {
                case "Quick Sort":
                    QuickSortView()
                case "Merge Sort":
                    MergeSortView()
                case "Binary Search":
                    BinarySearchView()
                case "Dijkstra's Algorithm":
                    DijkstraAlgorithmView()
                default:
                    BlankView() // Default to BlankView if no selection is made
                }
            }
        }
    }
}

struct AlgorithmButton: View {
    let title: String
    @EnvironmentObject var navigationState: NavigationState // Access navigation state

    var body: some View {
        Button(action: {
            navigationState.selectedAlgorithm = title // Set the selected algorithm
            navigationState.isBlankViewActive = true // Trigger navigation to the corresponding algorithm view
        }) {
            Text(title)
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(hue: 0.7, saturation: 0.9, brightness: 0.3)) // Dark purple
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3) // Adds depth
        }
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
}

struct Header: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.custom("Bradley Hand", size: 36))
            .foregroundColor(.white)
            .padding()
    }
}

struct CustomSpacer: View {
    let height: CGFloat
    
    var body: some View {
        Spacer().frame(height: height)
    }
}


// Blank view as a fallback for any unknown selection
struct BlankView: View {
    var body: some View {
        VStack {
            Text("This is a Blank View")
                .font(.title)
                .foregroundColor(.white)
            Spacer()
        }
        .background(Color.gray)
        .cornerRadius(10)
        .padding()
    }
}


// Preview


#Preview {
    ContentView().environmentObject(NavigationState()).environmentObject(AnimationState())
}
