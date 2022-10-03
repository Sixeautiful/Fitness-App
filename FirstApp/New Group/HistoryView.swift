//
//  HistoryView.swift
//  FirstApp
//
//  Created by Kirill Willer on 22.09.22.
//

import SwiftUI

struct HistoryView: View {
    
    let history = HistoryStore()
    
//    //let today = Date()
//    let yesterday = Date().addingTimeInterval(-86400)
//    
//    let exercises1 = ["Squat", "Step Up", "Burpee", "Sun Salute"] //exersises at first day
//    let exercises2 = ["Squat", "Step Up", "Burpee"] // exersise at second day
//    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button {
                
            } label: {
                Image(systemName: "xmark.circle")
            }
            .font(.title)
            .padding()

            VStack {
                Text("History")
                    .font(.title)
                    .padding()
            

                Form {
                        ForEach(history.exerciseDays) { day in
                          Section(
                            header:
                              Text(day.date.formatted(.dateTime.day().month()))
                              .font(.headline)) {
                            ForEach(day.exercises, id: \.self) { exercise in
                              Text(exercise)
                            }
                          }
                        }
                }
//                Form {
//                  Section(
//                    header:
//                        Text(today.formatted(.dateTime.day().month()))
//                      .font(.headline)) {
//                    // Section content
//                          ForEach( exercises1, id: \.self){ exersixe in
//                              Text(exersixe)
//                          }
//                  }
//
//                  Section(
//                    header:
//                        Text(yesterday.formatted(.dateTime.day().month()))
//                   // Text(yesterday.formatted(as: "MMM d") )
//                      .font(.headline)) {
//                    // Section content
//                          ForEach( exercises2, id: \.self){ exersixe in
//                              Text(exersixe)
//                          }
//                  }
//                } //Form
            }
        } //Vstack

        
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}

