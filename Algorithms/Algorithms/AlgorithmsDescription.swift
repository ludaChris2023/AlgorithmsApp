//
//  AlgorithmsDescription.swift
//  Algorithms
//
//  Created by Christopher Heffernan on 3/2/25.
//
import SwiftUI

class AnimationState: ObservableObject{
    @Published var whichAnimation: String? = nil
    @Published var isActive: Bool = false
}

struct AlgorithmDescriptionView: View {
    var title: String
    var description: String
    var animation: String
    var gradientColors: [Color]
    
    @EnvironmentObject var animationState: AnimationState
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .italic()
                .foregroundColor(.white)
                .padding(.top, 20)
            
            Spacer()
            ScrollViewReader{ proxy in
            ScrollView {
                Text(description)
                    .font(.body)
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white.opacity(0.85))
                    .cornerRadius(15)
                    .shadow(radius: 10)
                    .id("description")
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .onAppear{
                proxy.scrollTo("description", anchor: .top)
            }
            }
            
            CustomSpacer(height: 5)
            AnimationButton(title: "View Animation", animation: animation)
            CustomSpacer(height: 60)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .cornerRadius(20)
        .background(
            LinearGradient(gradient: Gradient(colors: gradientColors),
                           startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .navigationDestination(isPresented: $animationState.isActive) {
            switch animationState.whichAnimation {
            case "Quick":
                QuickSortAnimationView()
            default:
                BlankView()
            }
        }
    }
}


struct AnimationButton: View {
    var title: String
    var animation: String
    @EnvironmentObject var animationState: AnimationState

    var body: some View {
        Button(action: {
            animationState.whichAnimation = animation
            animationState.isActive = true
        }) {
            Text(title)
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(hue: 0.7, saturation: 0.9, brightness: 0.3)) // Dark purple
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3)
        }
    }
}


enum AlgorithmsDescription: String {
    case quickSort = """
        QuickSort is a divide-and-conquer algorithm. It works by selecting a pivot element from the array and partitioning the other elements into two sub-arrays, according to whether they are less than or greater than the pivot.
        
        The sub-arrays are then sorted recursively. This results in a time complexity of O(n log n) on average, although the worst-case is O(n²), typically when the pivot element is always the smallest or largest.
        
        QuickSort is an efficient algorithm for large datasets, but its performance heavily depends on the choice of the pivot.
        """
    
    case mergeSort = """
        MergeSort is a divide-and-conquer algorithm that splits the array into halves, recursively sorts each half, and then merges the sorted halves back together. The merging process ensures that the elements are sorted as the halves are recombined.
        
        The algorithm is stable, meaning that it preserves the order of equal elements. Its time complexity is O(n log n) in both the average and worst cases, making it more efficient than algorithms like QuickSort when it comes to large datasets or when worst-case performance is a concern.
        
        MergeSort is especially useful when working with large datasets that do not fit entirely into memory, as it can be implemented efficiently using external sorting techniques.
        """
    
    case dijkstra = """
        Dijkstra's Algorithm is a graph search algorithm that finds the shortest path between two nodes in a graph, such as from a starting node to a destination node.
        
        The algorithm works by iteratively selecting the node with the smallest known distance from the start node, updating the distances of its neighboring nodes, and repeating this process until the shortest path to the destination is found.
        
        The time complexity of Dijkstra's Algorithm is O(V^2) for a graph represented by an adjacency matrix, or O(E + V log V) when using a priority queue, where V is the number of vertices and E is the number of edges.
        
        Dijkstra's Algorithm is widely used in network routing, shortest path calculations in maps, and other applications requiring optimal pathfinding in weighted graphs.
        """
    
    case binarySearch = """
        Binary Search is an efficient algorithm for finding an item from a sorted list of items. It works by repeatedly dividing the search interval in half. 
        
        If the value of the search key is less than the item in the middle of the interval, the search continues on the lower half of the interval. Otherwise, the search continues on the upper half.
        
        The time complexity of Binary Search is O(log n), making it much faster than linear search algorithms, especially for large datasets.
        
        Binary Search can only be used on a sorted array or list.
        """
}


#Preview {
    NavigationStack {
        AlgorithmDescriptionView(
            title: "Quick Sort Algorithm",
            description: AlgorithmsDescription.quickSort.rawValue, animation: "Quick",
            gradientColors: [Color.blue, Color.purple]
        ).environmentObject(AnimationState())
    }
}

