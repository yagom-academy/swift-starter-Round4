//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

class BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscleEndurance: Int
    var fatigue: Int

    init(upperBodyStrength: Int = 0, lowerBodyStrength: Int = 0, muscleEndurance: Int = 0, fatigue: Int = 0) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscleEndurance = muscleEndurance
        self.fatigue = fatigue
    }
    
    func nowCondition(myRoutine: Routine) {
        myRoutine.tellMyExerciseRoutine()
        print("""
            -----------------------
            현재의 컨디션은 다음과 같습니다.
            상체근력: \(self.upperBodyStrength)
            하체근력: \(self.lowerBodyStrength)
            근지구력: \(self.muscleEndurance)
            피로도: \(self.fatigue)
            """)
    }
}

struct Exercise {
    let name: String
    var action: () -> Void
}

class Routine {
    let name: String
    var exercise = [Exercise]()
    
    init(name: String, exercise: [Exercise]) {
        self.name = name
        self.exercise = exercise
    }
    
    func tellMyExerciseRoutine() {
        self.doExercise()
        print("""
            -----------------------
            \(self.name)을 시작합니다.
            """)
        for exerciseName in exercise {
           let extractExerciseName = exerciseName.name.map { String($0) }
           let exerciseName = extractExerciseName.joined(separator: "")
           print("\(exerciseName)")
        }
    }
    
    func doExercise() {
        for didExercise in exercise {
            let exercised = didExercise.action
            exercised()
            
        }
    }
}

let bodyCondition: BodyCondition = BodyCondition()

let sitUp: Exercise = Exercise(name: "윗몸일으키기", action: {
    bodyCondition.upperBodyStrength += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)
})

let squatt: Exercise = Exercise(name: "스쿼트", action: {
    bodyCondition.lowerBodyStrength += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)
})

let longDistanceRunning: Exercise = Exercise(name: "오래달리기", action: {
    bodyCondition.muscleEndurance += Int.random(in: 20...30)
    bodyCondition.upperBodyStrength += Int.random(in: 5...10)
    bodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    bodyCondition.fatigue += Int.random(in: 20...30)
})

let activeRest: Exercise = Exercise(name: "동적휴식", action: {
    bodyCondition.fatigue -= Int.random(in: 5...10)
})


let hellRoutine: Routine = Routine(name: "Hell-Routine", exercise: [sitUp, sitUp, squatt, squatt, activeRest, longDistanceRunning, longDistanceRunning])

bodyCondition.nowCondition(myRoutine: hellRoutine)
