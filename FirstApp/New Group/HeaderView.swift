//
//  HeaderView.swift
//  FirstApp
//
//  Created by Kirill Willer on 15.09.22.
//

import SwiftUI

struct HeaderView: View {
    let titleName: String
    var body: some View {
        VStack {
            Text(titleName)
                .font(.largeTitle)
            HStack {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
                Image(systemName: "4.circle")
            }
        }
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView(titleName: "Squat")
                .previewLayout(.sizeThatFits)
            HeaderView(titleName: "Squat")
                .previewLayout(.sizeThatFits)
        }
    }
}
