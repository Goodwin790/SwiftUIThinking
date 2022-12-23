//
//  OnSubmitBootcamp.swift
//  BootcampChapter2
//
//  Created by Сергей Киров on 23.12.2022.
//

import SwiftUI

struct OnSubmitBootcamp: View {
    @State private var text = ""
    
    var body: some View {
      TextField("Placeholder...", text: $text)
            .submitLabel(.route)
            .onSubmit {
                print("return tapped")
            }
    }
}

struct OnSubmitBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        OnSubmitBootcamp()
    }
}
