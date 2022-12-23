//
//  EnvironmentObjectBootcamp.swift
//  BootcampChapter2
//
//  Created by Сергей Киров on 21.12.2022.
//

import SwiftUI

class EnvironmentViewModel: ObservableObject {
    
    @Published var data: [String] = []
    
    init() {
        getData()
    }
    
    func getData() {
        self.data.append("Iphone")
        self.data.append("Imac")
        self.data.append("Ipod")
        self.data.append(contentsOf: ["Apple tv", "Ipad"])
    }
}

struct EnvironmentObjectBootcamp: View {
    @StateObject var viewModel = EnvironmentViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.data, id: \.self) { data in
                    NavigationLink {
                        DetailView(selectedItem: data)
                    } label: {
                        Text(data)
                    }

                }
            }
            .navigationTitle("IOS devices")
        }
       .environmentObject(viewModel)
    }
}

struct FinalView: View {
    @EnvironmentObject var viewModel: EnvironmentViewModel
    
    var body: some View {
        ZStack {
            // background
            LinearGradient(colors: [.blue, .black, .red
                                    ],startPoint: .leading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            // foreground
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.data, id: \.self) { item in
                        Text(item)
                    }
                }
                .foregroundColor(.white)
                .font(.largeTitle)
            }
        }
    }
}

struct DetailView: View {
    let selectedItem: String
    
    var body: some View {
        ZStack {
            //bckground
            Color.orange.ignoresSafeArea()
            
            //foreground
            NavigationLink {
                FinalView()
            } label: {
                Text(selectedItem)
                    .font(.headline)
                    .foregroundColor(.orange)
                    .padding()
                    .padding(.horizontal)
                    .background(.white)
                    .cornerRadius(30)
            }

            
        }
    }
}

struct EnvironmentObjectBootcamp_Previews: PreviewProvider {
    static var previews: some View {
      EnvironmentObjectBootcamp()
      //  DetailView(selectedItem: "Iphone")
    }
}
