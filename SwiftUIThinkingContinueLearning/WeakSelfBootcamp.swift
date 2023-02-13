//
//  WeakSelfBootcamp.swift
//  SwiftUIThinkingContinueLearning
//
//  Created by Сергей Киров on 07.02.2023.
//

import SwiftUI

struct WeakSelfBootcamp: View {
    @AppStorage("count") var count: Int?
    
    init() {
        count = 0
    }
    
    var body: some View {
        NavigationView {
            NavigationLink("Navigate", destination: weakSelfSecondScreen())
                .navigationTitle("Screen 1")
        }
        .overlay(Text("\(count ?? 0)")
        .font(.largeTitle)
        .padding()
        .background(Color.green.cornerRadius(10))
                 , alignment: .topTrailing
                 )
    }
}

struct weakSelfSecondScreen: View {
    @StateObject var vm = WeakSecondScreenViewModel()
    
    var body: some View {
        VStack {
            Text("Second view")
                .font(.largeTitle)
            .foregroundColor(.red)
            
            if let data = vm.data {
                Text(data)
            }
        }
    }
}

class WeakSecondScreenViewModel: ObservableObject {
    @Published var data: String? = nil
    
    init() {
        print("Initialize now")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount + 1, forKey: "count")
        getData()
    }
    
    deinit {
        print("Deinit now")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount - 1, forKey: "count")
    }
    
    func getData() {

        DispatchQueue.main.asyncAfter(deadline: .now() + 500) { [weak self] in
            self?.data = "New data"

        }
    }
}

struct WeakSelfBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        WeakSelfBootcamp()
    }
}
