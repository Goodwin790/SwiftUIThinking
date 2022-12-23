//
//  ListBootcamp.swift
//  0AddingText
//
//  Created by Сергей Киров on 18.12.2022.
//

import SwiftUI

struct ListBootcamp: View {
    @State private var fruits = ["apple", "orange", "banana", "peach"]
    
    @State private var veggies = ["tomato", "potato", "carrot", "pumpkin"]
    
    var body: some View {
        NavigationView {
           List {
                Section {
                ForEach(fruits, id: \.self) { fruit in
                    Text(fruit.capitalized)
                        .font(.callout)
                        .foregroundColor(.white)
                        .padding(.vertical)
                    
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                        .background(.pink)
                    }
                .onDelete(perform: delete)
                .onMove(perform:  move)
                .listRowBackground(Color.blue)
                } header: {
                    HStack {
                        Text("Fruits")
                        Image(systemName: "flame.fill")
                    }
                    .font(.headline)
                    .foregroundColor(.orange)
                }
               
               
               Section("Veggies") {
               ForEach(veggies, id: \.self) { veggies in
                   Text(veggies.capitalized)
                   }
               }
            }
           .accentColor(.purple)
          // .listStyle(InsetListStyle())
            .navigationTitle("Grocery list")
            .navigationBarItems(leading: EditButton(), trailing: addButton)
        }
        .accentColor(.red)
    }

    var addButton: some View {
                   Button("Add", action: add)
                    }
                    
    func delete(offset: IndexSet) {
        fruits.remove(atOffsets: offset)
    }
    
    func move(indices: IndexSet, newOffset: Int) {
        fruits.move(fromOffsets: indices, toOffset: newOffset)
    }
    func add() {
        fruits.append("Coconut")
    }
}

struct ListBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ListBootcamp()
    }
}
