//
//  WelcomeView.swift
//  FirstApp
//
//  Created by Kirill Willer on 14.09.22.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var selectedTab: Int
    @State private var showHistoryView = false
    var body: some View {
        ZStack {
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        Text(NSLocalizedString("Get Fit", comment: "be stronger"))
                            .font(.largeTitle)
                        Text(
                            NSLocalizedString("with high intensity interval training", comment: "description what is app about")
                        )
                            .font(.headline)
                    } // vstack 1.0
                } // Hstack
                Button {
                    selectedTab = 0
                } label: {
                    Label(NSLocalizedString("Get Started", comment: "Start"), systemImage: "arrow.right.circle")

                }
                .font(.title2)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 2))

            }// Vstack 0.0
            VStack {
                
                HeaderView(selectedTab: $selectedTab, titleName:
                            NSLocalizedString(
                    "Welcome", comment: "greeting")
                )
                Spacer()
                Button(action: { showHistoryView.toggle() })
                {
                    Text(NSLocalizedString(
                        "History", comment: "view of user activity"))
                }
                .padding(.bottom)
                .sheet(isPresented: $showHistoryView) {
                    HistoryView(showhistoryView: $showHistoryView)
                }

            } // Vstack 0.1
            
        } // Vstack
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(selectedTab: .constant(9))
    }
}
