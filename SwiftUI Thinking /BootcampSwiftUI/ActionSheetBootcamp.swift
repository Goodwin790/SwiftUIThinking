//
//  ActionSheetBootcamp.swift
//  0AddingText
//
//  Created by Сергей Киров on 19.12.2022.
//

import SwiftUI

struct ActionSheetBootcamp: View {
    @State private var showActionSheet = false
    @State private var backgroundColor = Color.blue
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 30, height: 30)
                Text("UserName")
                Spacer()
                Button(action: { showActionSheet.toggle() }) {
                    Image(systemName: "ellipsis")
                }
                .accentColor(.primary)
            }
            Rectangle()
            aspectRatio(1, contentMode: .fit)
        }
        .confirmationDialog("Select color", isPresented: $showActionSheet, titleVisibility: .visible) {
            Button("red") {
                backgroundColor = .red
            }
        }
//    .actionSheet(isPresented: $showActionSheet) {
//        getActionSheet()
//    }
}

//func getActionSheet() -> ActionSheet {
//   // ActionSheet(title: Text("This is the title"))
//
//    let button1: ActionSheet.Button = .default(Text("Default"))
//    let button2: ActionSheet.Button = .destructive(Text("destructive"))
//    let button3: ActionSheet.Button = .cancel()
//
//   return ActionSheet(
//        title: Text("This is the title"),
//        message: Text("This is a message"),
//        buttons: [button1, button2, button3])
//    }
}
    
struct ActionSheetBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetBootcamp()
    }
}
