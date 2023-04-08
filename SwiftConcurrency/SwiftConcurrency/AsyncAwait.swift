//
//  AsyncAwait.swift
//  SwiftConcurrency
//
//  Created by Сергей Киров on 31.03.2023.
//

import SwiftUI

class asyncAwaitViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    func addTitle1() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.dataArray.append("Title 1: \(Thread.current)")
        }
    }
    
    func addTitle2() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            let title = "Title 2: \(Thread.current)"
            DispatchQueue.main.async {
                self.dataArray.append(title)
            }
        }
    }
    
    func addAuthor1() async {
        let author1 = "Author1: " //\(Thread.current)
        await MainActor.run( body: { self.dataArray.append(author1) })
        
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        let author2 = "Author2: " //\(Thread.current)
        await MainActor.run(body: {
            self.dataArray.append(author2)
            
            let author3 = "Author3: \(Thread.current)"
            self.dataArray.append(author3)
        })
        
        await addSomething()
    }
    
    func addSomething() async {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        let something1 = "something1: " //\(Thread.current)
        await MainActor.run(body: {
            self.dataArray.append(something1)
            
            let something2 = "something2: \(Thread.current)"
            self.dataArray.append(something2)
        })
    }
    
}

struct AsyncAwait: View {
    @StateObject private var viewModel = asyncAwaitViewModel()
    var body: some View {
        List {
            ForEach(viewModel.dataArray, id: \.self) { data in
                Text(data)
            }
        }
        .onAppear {
            Task {
               await viewModel.addAuthor1()
                
                let finalText = "Final text " //\(Thread.current)
                viewModel.dataArray.append(finalText)
            }
//            viewModel.addTitle1()
//            viewModel.addTitle2()
        }
    }
}

struct AsyncAwait_Previews: PreviewProvider {
    static var previews: some View {
        AsyncAwait()
    }
}
