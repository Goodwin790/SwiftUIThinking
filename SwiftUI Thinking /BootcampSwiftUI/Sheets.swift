//
//  Sheets.swift
//  0AddingText
//
//  Created by Сергей Киров on 17.12.2022.
//

import SwiftUI

struct Sheets: View {
    @State private var showingSheet = false
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            Button(action: {
                showingSheet.toggle()
            },
                   label: {
                Text("Button")
                    .foregroundColor(.green)
                    .font(.headline)
                    .padding(20)
                    .background(.white)
                    .cornerRadius(10)
            })
//            .fullScreenCover(isPresented: $showingSheet, content: { SecondScreen()})
            

            .sheet(isPresented: $showingSheet, content:
                    //Do not add conditional logic
                    {SecondScreen()})
        }
    }
}

struct SecondScreen: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.red
                .ignoresSafeArea()
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            },
                   label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
            })
        }
    }
}

struct Sheets_Previews: PreviewProvider {
    static var previews: some View {
      Sheets()
       // SecondScreen()
    }
}
