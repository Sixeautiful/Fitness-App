//
//  Exercise.swift
//  FirstApp
//
//  Created by Kirill Willer on 25.09.22.
//

import Foundation

struct Exercise{
    let exerciseName: String
    let videoName: String
    
    enum ExerciseEnum: String {
        case squat = "Squat"
        case stepUp = "StepUp"
        case burpee = "Burpee"
        case sunSalute = "Sun Salute"
    }
    
    
}

extension Exercise {
    static let exercises = [
        Exercise(exerciseName: ExerciseEnum.squat.rawValue, videoName: "squat"),
        Exercise(exerciseName: ExerciseEnum.stepUp.rawValue, videoName: "stepUp"),
        Exercise(exerciseName: ExerciseEnum.burpee.rawValue, videoName: "burpee"),
        Exercise(exerciseName: ExerciseEnum.sunSalute.rawValue, videoName: "sun-salute")
        
    ]
}
