//
//  ConfirmationDialogs.swift
//  BootcampChapter2
//
//  Created by Сергей Киров on 19.12.2022.
//

import SwiftUI

struct ConfirmationDialogs: View {
    @State private var showActionSheet = false
    @State private var backgroundColor = Color.blue
    @State private var actionSheetOption: ActionSheetOptions = .isOtherPost
    
    enum ActionSheetOptions {
        case isMyPost, isOtherPost
    }
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 30, height: 30)
                Text("@userName")
                    .background(backgroundColor)
                Spacer()
                Button {
                    actionSheetOption = .isOtherPost
                    showActionSheet.toggle()
                } label: {
                    Image(systemName: "ellipsis")
                }
                .accentColor(.primary)
            }
            .padding(.horizontal)
            
            Rectangle()
                .aspectRatio(1.0, contentMode: .fit)
        }
        .confirmationDialog("This is the title", isPresented: $showActionSheet) {
            Button("Red", role: .destructive) {
                backgroundColor = .red
            }
            Button("Green") {
                backgroundColor = .green
            }
            Button("Purple", role: .cancel) {
                backgroundColor = .purple
            }
        }
    }
}

struct ConfirmationDialogs_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationDialogs()
    }
}
