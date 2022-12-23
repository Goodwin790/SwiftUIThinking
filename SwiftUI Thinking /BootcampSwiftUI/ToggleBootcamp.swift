//
//  ToggleBootcamp.swift
//  BootcampChapter2
//
//  Created by Сергей Киров on 19.12.2022.
//

import SwiftUI

struct ToggleBootcamp: View {
    @State private var isOn = false
    var body: some View {
        VStack {
            
            HStack{
                Text("Status:")
                Text(isOn ? "Online" : "Offline")
            }
            .font(.title)
            Toggle(isOn: $isOn) {
                Text("Label")
            }
            .tint(.red)
            Spacer()
        }
        .padding(.horizontal, 100)
    }
}

struct ToggleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ToggleBootcamp()
    }
}
