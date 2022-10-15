//
//  HistoryView.swift
//  FirstApp
//
//  Created by Kirill Willer on 22.09.22.
//

import SwiftUI

struct HistoryView: View {
    @Binding var showhistoryView: Bool
    
    let history = HistoryStore()
      
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button {
                showhistoryView.toggle()
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
                
            }
        } //Vstack

        
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(showhistoryView: .constant(true))
    }
}

