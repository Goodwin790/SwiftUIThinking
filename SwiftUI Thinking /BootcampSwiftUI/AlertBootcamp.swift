//
//  AlertBootcamp.swift
//  0AddingText
//
//  Created by Сергей Киров on 18.12.2022.
//

import SwiftUI

struct AlertBootcamp: View {
    @State private var showingAlert = false
    @State private var backgroundColor = Color.yellow
  //  @State private var alertTitle = ""
  //  @State private var alertMessage = ""
    @State private var alertType: MyAlerts?
    
    enum MyAlerts {
        case success
        case error
    }
    
    
    var body: some View {
        ZStack {
                    backgroundColor.ignoresSafeArea()
            
            VStack {
                Button("Click here") {
                    alertType = .error
//                    alertTitle = "Error upload video"
//                    alertMessage = "The video could not be uploaded"
                    showingAlert.toggle()
                }
                
                Button("Click here") {
                    alertType = .success
//                    alertTitle = "successfully uploaded video 😃"
//                    alertMessage = "your video is public! 🙌"
                    showingAlert.toggle()
                }
            }
            .alert(isPresented: $showingAlert) {
                       getAlert()
            }
        }
    }
    func getAlert() -> Alert {
        
        switch alertType {
        case .error:
            return Alert(title: Text( "There was an error"))
        case .success:
            return Alert(title: Text("Success"), message: nil, dismissButton: .default(Text("Ok"), action: {
                backgroundColor = .green
            }))
        default:
            return Alert(title: Text("Error"))
        }
        
//        Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .destructive(Text("ok")))
//                    Alert(title: Text("This is the title"),
//                          message: Text("Here we will describe the error"),
//                          primaryButton: .destructive(Text("delete"), action: {
//                        backgroundColor = .green
//                    }),
//                          secondaryButton: .cancel())
//                   // Alert(title: Text("There was an error"))
//
    }
}

struct AlertBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AlertBootcamp()
    }
}
