//
//  exercise.swift
//  CodeStarterCamp_Week4
//
//  Created by 박세웅 on 2022/01/06.
//

import Foundation



struct Exercise {
    let name: String
    let action: () -> Void
    
    enum ExerciseLevel {
        static let highIntensity = 20 ... 30
        static let mediumIntensity = 10 ... 20
        static let lowIntensity = 5 ... 10
    }
}

let situp = Exercise(name: "윗몸일으키기", action: {
    myBodyCondition.upperMuscles += Int.random(in: Exercise.ExerciseLevel.highIntensity)
    myBodyCondition.fatigue += Int.random(in: Exercise.ExerciseLevel.mediumIntensity)
    
})
let squat = Exercise(name: "스쿼트", action: {
    myBodyCondition.lowerMuscles += Int.random(in: Exercise.ExerciseLevel.highIntensity)
    myBodyCondition.fatigue += Int.random(in: Exercise.ExerciseLevel.mediumIntensity)
})
let running = Exercise(name: "오래달리기", action: {
    myBodyCondition.endurance += Int.random(in: Exercise.ExerciseLevel.highIntensity)
    myBodyCondition.upperMuscles += Int.random(in: Exercise.ExerciseLevel.lowIntensity)
    myBodyCondition.lowerMuscles += Int.random(in: Exercise.ExerciseLevel.lowIntensity)
    myBodyCondition.fatigue += Int.random(in: Exercise.ExerciseLevel.highIntensity)
})
let pilates = Exercise(name: "필라테스", action: {
    myBodyCondition.endurance += Int.random(in: Exercise.ExerciseLevel.mediumIntensity)
    myBodyCondition.fatigue += Int.random(in: Exercise.ExerciseLevel.lowIntensity)
})
let rest = Exercise(name: "동적휴식", action: {
    myBodyCondition.fatigue -= Int.random(in: Exercise.ExerciseLevel.lowIntensity)
})
