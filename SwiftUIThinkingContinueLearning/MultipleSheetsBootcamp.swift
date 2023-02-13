//
//  MultipleSheetsBootcamp.swift
//  SwiftUIThinkingContinueLearning
//
//  Created by Сергей Киров on 23.01.2023.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

// 1 - use a binding
//struct NextScreen: View {
//    @Binding var selectedModel: RandomModel
//
//    var body: some View {
//        Text(selectedModel.title)
//            .font(.largeTitle)
//    }
//}

// 2 - use multiple .sheet()

//    Button("Button 1") {
//     //   selectedModel = RandomModel(title: "One")
//        showSheet.toggle()
//    }
//    .sheet(isPresented: $showSheet) {
//        NextScreen(selectedModel: RandomModel(title: "One"))
//    }
//    Button("Button 2") {
//       // selectedModel = RandomModel(title: "Two")
//        showSheet2.toggle()
//
//    }
//    .sheet(isPresented: $showSheet2) {
//        NextScreen(selectedModel: RandomModel(title: "Two"))
//    }

// 3 - use $item

//    .sheet(item: $selectedModel) { model in
//        NextScreen(selectedModel: model)
//    }

struct MultipleSheetsBootcamp: View {
    @State private var selectedModel: RandomModel? = nil
    //    @State private var showSheet = false
    //    @State private var showSheet2 = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                ForEach(0..<50) { index in
                    Button("Button \(index)") {
                        selectedModel = RandomModel(title: "\(index)")
                        //                showSheet.toggle()
                    }
                }
            }
            .sheet(item: $selectedModel) { model in
                NextScreen(selectedModel: model)
            }
        }
    }
}

struct NextScreen: View {
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

struct MultipleSheetsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheetsBootcamp()
    }
}
