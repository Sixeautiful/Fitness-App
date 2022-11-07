//
//  SuccessView.swift
//  FirstApp
//
//  Created by Kirill Willer on 25.09.22.
//

import SwiftUI

struct SuccessView: View {
    @Binding var selectedTab: Int
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            VStack{
                Image(systemName: "hand.raised.fill")
                    //.resizedToFill(width: 75, height: 75) dont work like in solution
                    .resizable()
                    .frame(width: 75, height: 75)
                    .foregroundColor(Color.purple)
                
                Text("High Five!")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding()
                
                Text("""
                        Good job completing all four exercises!
                        Remember tomorrow's another day.
                        So eat well and get some rest.
                        """)
                .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    
            } //Vstack
            
            VStack {
                Spacer()
                HStack{
                Button("Contunie"){
                    presentationMode.wrappedValue.dismiss()
                }
                .padding()
                    Button("Welcome page"){
                        presentationMode.wrappedValue.dismiss()
                        selectedTab = 9
                    }
                    .padding()
            }
            }
          
          

        } //Zstack
   
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView(selectedTab: .constant(3))
            .environmentObject(HistoryStore())
    }
}
