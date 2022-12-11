//
//  Calendar.swift
//  Gympact
//
//  Created by Nichoalas Cammisuli on 2022-11-28.
//

import SwiftUI

struct Calendar: View {
    @State private var date = Date()
    
    
    var body: some View {
        DatePicker(
                "Start Date",
                selection: $date,
                displayedComponents: [.date]
                
            )
        .datePickerStyle(.graphical)
        
        
        Spacer()
    }
}

struct Calendar_Previews: PreviewProvider {
    static var previews: some View {
        Calendar()
    }
}
