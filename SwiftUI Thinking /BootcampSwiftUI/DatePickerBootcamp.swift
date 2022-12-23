//
//  DatePickerBootcamp.swift
//  BootcampChapter2
//
//  Created by Сергей Киров on 19.12.2022.
//

import SwiftUI

struct DatePickerBootcamp: View {
    @State private var selectedDate = Date()
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 2018)) ?? Date()
    
    let endingDate = Date()
    var  dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        VStack {
            Text("Select date is: ")
            Text(dateFormatter.string(from: selectedDate))
                .font(.title)
            //  DatePicker("Select a date", selection: $selectedDate)
      //        DatePicker("Select a date",
      //                   selection: $selectedDate,
      //                   displayedComponents: [.date])
              DatePicker("Select a date", selection: $selectedDate, in: startingDate...endingDate, displayedComponents: [.date])
                  .accentColor(.red)
                  .datePickerStyle(.compact)
        }
    }
}

struct DatePickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerBootcamp()
    }
}
