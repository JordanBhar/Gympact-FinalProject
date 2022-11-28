//
//  Goals.swift
//  FinalProject
//
//  Created by Muaz on 2022-11-28.
//

import SwiftUI

struct Goals: View {
    var body: some View {
        VStack(spacing: 30){
            
            
            Text("Choose Goals")
                .fontWeight(.bold)
                .font(.largeTitle)
                .foregroundColor(Color.blue)
                .padding(.bottom, 10)
            
            
            
            
            
        }
        .padding(.horizontal,30)
        .padding(.vertical, 25)
    }
}

struct Goals_Previews: PreviewProvider {
    static var previews: some View {
        Goals()
    }
}
