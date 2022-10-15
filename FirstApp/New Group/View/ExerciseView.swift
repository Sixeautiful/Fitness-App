//
//  ExerciseView.swift
//  FirstApp
//
//  Created by Kirill Willer on 14.09.22.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
    @Binding var selectedTab: Int
    @State private var rating: Int = 0
    @State private var showhistoryView = false
    @State private var showsuccessView = false
    
    let index: Int
    let interval: TimeInterval = 30
    var lastexercise: Bool {
        index + 1 == Exercise.exercises.count
    }
    

    var body: some View {
        
        GeometryReader { geometry in 
             VStack {
              
                 HeaderView(selectedTab: $selectedTab, titleName: Exercise.exercises[index].exerciseName)
                     .padding(.bottom)
                
                 if let url = Bundle.main.url(forResource: Exercise.exercises[index].videoName, withExtension: "mp4") {
                    VideoPlayer( player: AVPlayer(url: url))
                        .frame(height: geometry.size.height * 0.45)
                } else {
                    Text("Coudnt find \(Exercise.exercises[index].videoName).mp4")
                        .foregroundColor(.red)
                }
                 Text(Date().addingTimeInterval(interval), style: .timer)
                     .font(.system(size: 90))
                 HStack(spacing: 150) {
                     Button("Start") {
                         
                     }
                     Button("Done") {
                         if lastexercise {
                             showsuccessView.toggle()
                         }
                         else{
                             selectedTab += 1
                         }
                         
                     }
                     .sheet(isPresented: $showsuccessView) {
                         SuccessView(selectedTab: $selectedTab)
                     }
                     
                 }
                 .font(.title3)
             .padding()

           
                 RatingView(rating: $rating)
                 Spacer()
                 Button {
                     showhistoryView.toggle()
                 } label: {
                     Text(
                        NSLocalizedString("History button", comment: "View user's activity")
                     )
                 }
                 .padding(.bottom)
                 .sheet(isPresented: $showhistoryView) {
                     HistoryView(showhistoryView: $showhistoryView)
                 }

           
            }
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(selectedTab: .constant(1), index: 1)
            //.previewLayout(.sizeThatFits)
    }
}

