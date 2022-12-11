//
//  SettingsView.swift
//  Gympact
//
//  Created by Nichoalas Cammisuli on 2022-12-10.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SettingsView: View {
    
    @State private var selection: Int? = nil
    @State var email: String = ""
    
    
    var body: some View {
       
        NavigationLink(destination: Information(), tag: 1, selection: self.$selection){}
        NavigationLink(destination: ContentView(), tag: 2, selection: self.$selection){}
        
        VStack(spacing: 30) {
            
            Text("Settings")
                .fontWeight(.bold)
                .font(.largeTitle)
                .foregroundColor(Color.blue)
                .padding(.bottom, 10)
                .padding(.top, 50)
            
            Text("Signed in as: ")
                .fontWeight(.bold)
                .font(.largeTitle)
                .padding(.bottom, 10)
                .padding(.top, 50)
            
            Text("\(email)")
                .fontWeight(.bold)
                .font(.title2)
                .padding(.bottom, 10)
                .padding(.top, 50)
            
            Spacer()
            
            Button(action: {
                self.selection = 1
            }){
                Text("Update Information")
                    .modifier(CustomTextM(fontName: "MavenPro-Bold", fontSize: 25, fontColor: Color.white))
                
                    .frame(maxWidth: .infinity)
                    .frame(height: 56, alignment: .leading)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            Button(action: {
                self.selection = 2
            }){
                Text("Sign Out")
                    .modifier(CustomTextM(fontName: "MavenPro-Bold", fontSize: 25, fontColor: Color.white))
                
                    .frame(maxWidth: .infinity)
                    .frame(height: 56, alignment: .leading)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            Spacer()
        }.onAppear(){
            let user = Auth.auth().currentUser
                       if let user = user {
                           self.email = user.email ?? "User"
                       }
        }
        .padding(.horizontal,30)
        .padding(.vertical, 25)
        
        
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
