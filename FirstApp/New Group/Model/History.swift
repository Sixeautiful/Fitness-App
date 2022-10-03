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

struct HistoryStore {
  var exerciseDays: [ExerciseDay] = []

  init() {
    #if DEBUG
    createDevData()
    #endif
  }
}






