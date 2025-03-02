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
            description: """
            Dijkstra's Algorithm is a graph search algorithm that finds the shortest path between two nodes in a graph, such as from a starting node to a destination node.
            
            The algorithm works by iteratively selecting the node with the smallest known distance from the start node, updating the distances of its neighboring nodes, and repeating this process until the shortest path to the destination is found.
            
            The time complexity of Dijkstra's Algorithm is O(V^2) for a graph represented by an adjacency matrix, or O(E + V log V) when using a priority queue, where V is the number of vertices and E is the number of edges.
            
            Dijkstra's Algorithm is widely used in network routing, shortest path calculations in maps, and other applications requiring optimal pathfinding in weighted graphs.
            """,
            gradientColors: [Color.green, Color.blue] // Unique gradient for Dijkstra's algorithm
        )
    }
}

#Preview {
    DijkstraAlgorithmView()
}
