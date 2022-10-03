//
//  SuccessView.swift
//  FirstApp
//
//  Created by Kirill Willer on 25.09.22.
//

import SwiftUI

struct SuccessView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Button {
                
            } label: {
               Text("Contunie")
            }
            //.padding()
            
            VStack{
                Image(systemName: "hand.raised.fill")
                    .resizable()
                    .frame(width: 75, height: 75)
                    .foregroundColor(Color.purple)
                Text("High Five!")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("Good job compliting four exersices\n Remember tomorow's another days\n So eat well and get some rest")
                    .foregroundColor(.gray)
                    
            } //Vstack
            .padding()
          
          

        } //Zstack
   
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
