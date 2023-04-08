//
//  CheckedContinuation.swift
//  SwiftConcurrency
//
//  Created by Сергей Киров on 01.04.2023.
//

import SwiftUI

class CheckedContinuationViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    
}

struct CheckedContinuation: View {
    
    @StateObject private var viewModel = Chec
    
    var body: some View {
        ZStack {
            
        }
    }
}

struct CheckedContinuation_Previews: PreviewProvider {
    static var previews: some View {
        CheckedContinuation()
    }
}
