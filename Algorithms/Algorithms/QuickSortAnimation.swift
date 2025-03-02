import SwiftUI

struct QuickSortAnimationView: View {
    @State private var numbers: [Int] = [10, 3, 7, 8, 2, 5, 1, 9, 6, 4]
    @State private var currentNumbers: [Int] = [] // Initially empty array
    @State private var isSorting = false

    
    var body: some View {
        VStack {
            Text("QuickSort Animation")
                .font(.largeTitle)
                .bold()
                .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(currentNumbers, id: \.self) { num in
                        Text("\(num)")
                            .frame(width: 40, height: 40)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .font(.title2)
                    }
                }
            }
            .padding()
            
            Button(action: {
                if !isSorting {
                    isSorting = true
                    currentNumbers = numbers
                    currentNumbers = quickSort(currentNumbers)
                    
                }
            }) {
                Text("Start Sorting")
                    .padding()
                    .background(isSorting ? Color.gray : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            .disabled(isSorting)
        }
        .onAppear {
            currentNumbers = numbers // Ensure the numbers are set on first appearance
        }
    }
}
    
func quickSort(_ array: [Int], printState: (([Int]) -> Void)? = { state in print(state) }) -> [Int] {
    
    printState?(array)
    guard array.count > 1 else { return array }
    
    let pivot = array[array.count / 2] // Choose the middle element as pivot
    let less = array.filter { $0 < pivot }   // Elements smaller than pivot
    let equal = array.filter { $0 == pivot } // Elements equal to pivot
    let greater = array.filter { $0 > pivot } // Elements greater than pivot
    
    return quickSort(less, printState: printState) + equal + quickSort(greater, printState: printState) // Recursively sort and combine}
    
}

#Preview {
    QuickSortAnimationView()
}
