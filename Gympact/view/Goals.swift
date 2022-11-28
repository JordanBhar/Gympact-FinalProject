//
//  Goals.swift
//  FinalProject
//
//  Created by Muaz on 2022-11-28.
//

import SwiftUI

struct Goals: View {
    
    @State var weightLoss: Bool = true
    
    var body: some View {
        
        VStack(spacing: 30){
            
            
            Text("Choose Goals")
                .fontWeight(.bold)
                .font(.largeTitle)
                .foregroundColor(Color.blue)
                .padding(.bottom, 40)
            
            VStack {
                        Text("Weight Loss")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(Color.blue)
                    .padding(.bottom, 10)
                            .foregroundColor(weightLoss ? .blue : .gray)
                        Toggle("Weight", isOn: $weightLoss)
                            .labelsHidden()
            }.padding(.all, 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 2)
                            .foregroundColor(weightLoss ? .blue : .gray)
                    )
            
            VStack {
                        Text("Build Muscle")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(Color.blue)
                    .padding(.bottom, 10)
                            .foregroundColor(weightLoss ? .blue : .gray)
                        Toggle("Weight", isOn: $weightLoss)
                            .labelsHidden()
            }.padding(.all, 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 2)
                            .foregroundColor(weightLoss ? .blue : .gray)
                    )
            
        
            Button(action: {
                
                
              
            }){
                
                Text("NEXT")
                    .modifier(CustomTextM(fontName: "MavenPro-Bold", fontSize: 16, fontColor: Color.white))
                
                    .frame(maxWidth: .infinity)
                    .frame(height: 56, alignment: .leading)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.top, 50)
            }
            
            
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
