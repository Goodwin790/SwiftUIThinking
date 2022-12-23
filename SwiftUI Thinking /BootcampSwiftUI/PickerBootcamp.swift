//
//  PickerBootcamp.swift
//  BootcampChapter2
//
//  Created by Сергей Киров on 19.12.2022.
//

import SwiftUI
import UIKit

struct PickerBootcamp: View {
    
    @State private var selection = "Most recent"
    let filterOptions = ["Most recent", "Most popular", "Most liked"]
    
        init() {
            UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.red
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.white
            ]
            UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
        }
    
    var body: some View {
        
        Picker(selection: $selection, label: Text("Picker")) {
            ForEach(filterOptions.indices) { index in
                Text(filterOptions[index])
                    .tag(filterOptions[index])
            }
        }
        .pickerStyle(.segmented)
       // .background(.red)
        
//        Picker(selection: $selection) {
//            ForEach(filterOptions, id: \.self) {option in
//                HStack {
//                    Text(option)
//                    Image(systemName: "heart.fill")
//                }
//            }
//        } label: {
//            HStack {
//                Text("Picker")
//                Text(selection)
//                    .font(.headline)
//                    .padding()
//                    .padding(.horizontal)
//                    .background(.blue)
//                    .cornerRadius(10)
//                    .shadow(color: .blue, radius: 10, x: 0, y: 10)
//            }
//
//        }

        
//        VStack {
//            HStack{
//                Text("Age")
//                Text(selection)
//            }
//            Picker(selection: $selection) {
//                ForEach(18..<100) { age in
//                    Text("\(age)")
//                        .font(.headline)
//                        .foregroundColor(.red)
//                }
//            } label: {
//                Text("Picker")
//            }
//        .pickerStyle(.wheel)
//       // .background(Color.gray.opacity(0.3))
//        }
    }
}

struct PickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PickerBootcamp()
    }
}
