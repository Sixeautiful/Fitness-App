//
//  History.swift
//  FirstApp
//
//  Created by Kirill Willer on 29.09.22.
//

import Foundation

struct ExerciseDay: Identifiable {
  let id = UUID()
  let date: Date
  var exercises: [String] = []
}

class HistoryStore: ObservableObject {
  @Published var exerciseDays: [ExerciseDay] = []

  init() {
    #if DEBUG
    createDevData()
    #endif
  }
    func addDoneEx(_ exerciseName: String ) {
        let today1 = Date()
       
        if today1.isSameDay(as: exerciseDays[0].date){ //cheak if day of adding exercise is Same
            exerciseDays[0].exercises.append(exerciseName)
            print("Add new exercise in day\(exerciseName)") // if same add exercise to the same day
        }
            else { //cheak if day of adding exercise is Same
            exerciseDays.insert(ExerciseDay(date: today1, exercises: [exerciseName]), at: 0)
        }

    }
}






