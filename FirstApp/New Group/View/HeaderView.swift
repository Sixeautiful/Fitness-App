//
//  HeaderView.swift
//  FirstApp
//
//  Created by Kirill Willer on 15.09.22.
//

import SwiftUI

struct HeaderView: View {
    
    @Binding var selectedTab: Int
    let titleName: String
    
    var body: some View {
        VStack {
            Text(titleName)
                .font(.largeTitle)
            HStack {
                ForEach(0..<Exercise.exercises.count){ index in
                    let fill = index == selectedTab ? ".fill" : ""
                    Image(systemName: "\(index+1).circle\(fill)")
                        .onTapGesture {
                            selectedTab = index
                        }
                    
                    
                }
            }

        }
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView(selectedTab: .constant(0) , titleName: "Squat")
                .previewLayout(.sizeThatFits)
            HeaderView(selectedTab: .constant(1), titleName: "Step Up")
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .accessibilityLarge)
                .previewLayout(.sizeThatFits)
        }
    }
}
