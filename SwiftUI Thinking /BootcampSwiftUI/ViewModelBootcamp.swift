//
//  ViewModelBootcamp.swift
//  BootcampChapter2
//
//  Created by Сергей Киров on 21.12.2022.
//

import SwiftUI

struct FruitModel: Identifiable {
    let id = UUID().uuidString
    let name: String
    let count: Int
}

class FruitViewModel: ObservableObject {
  @Published  var fruits: [FruitModel] = []
    @Published var isLoading = false
    
    func getFruits() {
        let fruit1 = FruitModel(name: "Apple", count: 4)
        let fruit2 = FruitModel(name: "Orange", count: 44)
        let fruit3 = FruitModel(name: "Banana", count: 56)
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [self] in
            fruits.append(fruit1)
            fruits.append(fruit2)
            fruits.append(fruit3)
      isLoading = false
        }
    }
    
    func delete(offset: IndexSet) {
        fruits.remove(atOffsets: offset)
    }
    
    init() {
        getFruits()
    }
}

struct ViewModelBootcamp: View {
  
        @StateObject var fruitViewModel = FruitViewModel()
    var body: some View {
        NavigationView {
            List {
                if fruitViewModel.isLoading {
                    ProgressView()
                } else {
                    ForEach(fruitViewModel.fruits) { fruit in
                        HStack {
                            Text("\(fruit.count)")
                                .foregroundColor(.red)
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                        }
                    }
                    
                    
                    .onDelete(perform: fruitViewModel.delete)
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Fruit list")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink {
                        RandomScreen(fruitViewModel: fruitViewModel)
                    } label: {
                        Image(systemName: "arrow.right")
                            .font(.title)
                    }
                }
            }
        }
    }
}

struct RandomScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var fruitViewModel: FruitViewModel
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            VStack {
                ForEach(fruitViewModel.fruits){
                    Text($0.name)
                }
            }
        }
    }
}

struct ViewModelBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModelBootcamp()
    }
}
