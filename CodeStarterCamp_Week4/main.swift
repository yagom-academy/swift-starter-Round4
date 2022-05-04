//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscleEndurance: Int
    var tiredness = 0
    
    init() {
        upperBodyStrength = 30
        lowerBodyStrength = 30
        muscleEndurance = 10
    }
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscleEndurance: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscleEndurance = muscleEndurance
    }
    
    func informBodyCondition(){
        let informationOfBodyCondition = """
----------------------------------
현재의 컨디션은 다음과 같습니다.
상체근력 : \(upperBodyStrength)
하체근력 : \(lowerBodyStrength)
근지구력 : \(muscleEndurance)
피로도  : \(tiredness)
"""
        print(informationOfBodyCondition)
    }
}

struct Routine {
    let name: String
    var exercises = [Exercise]()
    
    init(name: String) {
        self.name = name
    }
    init(name: String, exercises: Exercise...) {
        self.name = name
        self.exercises = exercises
    }
    
    mutating func appendExercise(_ exercise: Exercise) {
        exercises.append(exercise)
    }
    
    mutating func insertExercise(_ exercise: Exercise, at point: Int) {
        if point < exercises.count {
            exercises.insert(exercise, at: point)
        }
    }
    
    mutating func removeExercise(at point: Int) {
        if point < exercises.count {
            exercises.remove(at: point)
        }
    }
    
    func startRoutine(based bodyCondition: BodyCondition) -> BodyCondition {
        var exerciserBodyCondition = bodyCondition
        print("----------------------------------")
        if exercises.isEmpty {
            print("Don't start \(name) Routine because \(name) Routine is empty")
            return exerciserBodyCondition
        } else {
            print("\(name) Routine Start")
        }
        print("----------------------------------")
        for exercise in exercises {
            print("\(exercise.name)")
            exerciserBodyCondition = exercise.action(exerciserBodyCondition)
        }
        exerciserBodyCondition.informBodyCondition()
        return exerciserBodyCondition
    }
}

struct Exercise {
    let name: String
    let action: (BodyCondition) -> BodyCondition
}

let pushUp = Exercise(name: "팔굽혀펴기") { (bodyCondition: BodyCondition) in
    var exerciserBodyCondition = bodyCondition
    exerciserBodyCondition.upperBodyStrength += Int.random(in: 5...15)
    exerciserBodyCondition.tiredness += Int.random(in: 5...10)
    return exerciserBodyCondition
}

let chinUp = Exercise(name: "턱걸이") { (bodyCondition: BodyCondition) in
    var exerciserBodyCondition = bodyCondition
    exerciserBodyCondition.upperBodyStrength += Int.random(in: 15...20)
    exerciserBodyCondition.tiredness += Int.random(in: 10...15)
    return exerciserBodyCondition
}

let dip = Exercise(name: "딥스") { (bodyCondition: BodyCondition) in
    var exerciserBodyCondition = bodyCondition
    exerciserBodyCondition.upperBodyStrength += Int.random(in: 8...14)
    exerciserBodyCondition.tiredness += Int.random(in: 5...10)
    return exerciserBodyCondition
}

let sitUp = Exercise(name: "윗몸일으키기") { (bodyCondition: BodyCondition) in
    var exerciserBodyCondition = bodyCondition
    exerciserBodyCondition.upperBodyStrength += Int.random(in: 10...20)
    exerciserBodyCondition.tiredness += Int.random(in: 10...20)
    return exerciserBodyCondition
}

let squatting = Exercise(name: "스쿼트") { (bodyCondition: BodyCondition) in
    var exerciserBodyCondition = bodyCondition
    exerciserBodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    exerciserBodyCondition.tiredness += Int.random(in: 10...20)
    return exerciserBodyCondition
}

let lunge = Exercise(name: "런지") { (bodyCondition: BodyCondition) in
    var exerciserBodyCondition = bodyCondition
    exerciserBodyCondition.lowerBodyStrength += Int.random(in: 15...20)
    exerciserBodyCondition.tiredness += Int.random(in: 7...10)
    return exerciserBodyCondition
}

let longRun = Exercise(name: "오래달리기") { (bodyCondition: BodyCondition) in
    var exerciserBodyCondition = bodyCondition
    exerciserBodyCondition.muscleEndurance += Int.random(in: 20...30)
    exerciserBodyCondition.upperBodyStrength += Int.random(in: 5...10)
    exerciserBodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    exerciserBodyCondition.tiredness += Int.random(in: 20...30)
    return exerciserBodyCondition
}

let activeRest = Exercise(name: "동적휴식") { (bodyCondition: BodyCondition) in
    var exerciserBodyCondition = bodyCondition
    exerciserBodyCondition.tiredness -= Int.random(in: 5...10)
    if exerciserBodyCondition.tiredness < 0 {
        exerciserBodyCondition.tiredness = 0
    }
    return exerciserBodyCondition
}

var myBodyCondition = BodyCondition()
let emptyRoutine = Routine(name: "Empty")
let upperBodyRoutine = Routine(name: "Upper Body", exercises: pushUp, dip, chinUp, activeRest, chinUp, dip, pushUp)
let lowerBodyRoutine = Routine(name: "Lower Body", exercises: squatting, squatting, squatting, activeRest, lunge, lunge, lunge)
let wholeBodyRoutine = Routine(name: "Whole Body", exercises: longRun, activeRest, pushUp, dip, chinUp, activeRest, squatting, lunge, activeRest, sitUp)

myBodyCondition = emptyRoutine.startRoutine(based: myBodyCondition)
myBodyCondition = upperBodyRoutine.startRoutine(based: myBodyCondition)
