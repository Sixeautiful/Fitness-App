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
    
    @State private var TimerDone = false
    @State private var ShowTimer = false
   
    @EnvironmentObject var history: HistoryStore
    
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
                 
                 
                 HStack(spacing: 150) {
                     Button("Start") {
                         ShowTimer.toggle()
                     }
                     Button("Done") {
                         TimerDone = false
                         ShowTimer.toggle()
                         history.addDoneEx(Exercise.exercises[index].exerciseName)
                         if lastexercise {
                             showsuccessView.toggle()
                         }
                         else{
                             selectedTab += 1
                         }
                         
                     }
                     .disabled(!TimerDone)
                     .sheet(isPresented: $showsuccessView) {
                         SuccessView(selectedTab: $selectedTab)
                     }
                     
                     
                 }
                 .font(.title3)
                 .padding()
                 
                 if ShowTimer {
                 TimerView(timerDome: $TimerDone)
                 }
                 Spacer()

           
                 RatingView(rating: $rating)
                     .padding()
                
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
        ExerciseView(selectedTab: .constant(3), index: 3)
            //.previewLayout(.sizeThatFits)
    }
}

