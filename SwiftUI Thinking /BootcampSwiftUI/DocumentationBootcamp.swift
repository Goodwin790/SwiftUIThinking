//
//  DocumentationBootcamp.swift
//  BootcampChapter2
//
//  Created by Сергей Киров on 21.12.2022.
//

import SwiftUI

struct DocumentationBootcamp: View {
    //MARK: PROPERTIES
    @State private var data = [ "Apples", "Oranges", "Bananas"]
    @State private var showAlert = false
    
    //MARK: BODY
    
    //   Goodwin - Working copy - things to do
    /*
     
     1) fix title
     2)Fix alert
     
     */
    var body: some View {
        NavigationView { // START: NAVIGATIONVIEW
            ZStack {
                //background
                Color.red.ignoresSafeArea()
                //foreground
                foregroundLayer
                .navigationTitle("Documentation")
                .toolbar(content: {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button ("Alert") {
                            showAlert.toggle()
                        }
                    }
                })
                .alert(isPresented: $showAlert) {
                    getAlert(text: "This is the alert")
            }
            }
            
        } // END: NAVIGATIONVIEW
    }
    
    ///This is a foreground layer that holds a scrollView
    private var foregroundLayer: some View {
        ScrollView { //START: SCROLLV
            Text("Hello")
            ForEach(data, id: \.self) {
                Text($0)
                    .font(.headline)
            }
        } //END: SCROLLV
    }
    
    //MARK: FUNCTIONS
    
    /// gets an alert with specified title
    ///
    ///This functioncreate and returnsan alert immediately. The alert will have a title based on the text parameter but it will not have a message.
    ///```
    ///getAlert(text: "hi") -> Alert(title: Text("hi"))
    ///```
    ///
    /// - Warning: There is mo additional message in this Alert.
    /// - Parameter text: this is the title of the alert
    /// - Returns: Returns an alert with a title
    func getAlert(text: String) -> Alert {
      return  Alert(title: Text(text))
    }
}

//MARK: PREVIEW
struct DocumentationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DocumentationBootcamp()
    }
}
