//
//  EscapingBoorcamp.swift
//  SwiftUIThinkingContinueLearning
//
//  Created by Сергей Киров on 08.02.2023.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    
    @Published var text = "Hello"
    
    func getData() {
        downloadData5 { [weak self] returnedResult in
            self?.text = returnedResult.data
        }
    }
    
    func downloadData() -> String {
        return "New data"
    }
    
    func downloadData2(completionHandler: (_ data: String) -> Void){
        completionHandler("New data!")
    }
    
    func downloadData3(completionHandler: @escaping (_ data: String) -> ()){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completionHandler("New data!")
        }
    }
    
    func downloadData4(completionHandler: @escaping (Downloadresult) -> ()){
        let result = Downloadresult(data: "New data")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completionHandler(result)
        }
    }
    
    func downloadData5(completionHandler: @escaping DownloadCompletion){
        let result = Downloadresult(data: "New data")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completionHandler(result)
        }
    }
    
}

struct Downloadresult {
    let data: String
}

typealias DownloadCompletion = (Downloadresult) -> ()

struct EscapingBoorcamp: View {
    
    @StateObject var vm = EscapingViewModel()
    
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

struct EscapingBoorcamp_Previews: PreviewProvider {
    static var previews: some View {
        EscapingBoorcamp()
    }
}
