//  main.swift
//  CodeStarterCamp_Week4
//  Created by quokka.
//  Copyright © yagom academy. All rights reserved.

import Foundation

class BodyCondition {
    var uppperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigue: Int
    
    init(uppperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigue: Int) {
        self.uppperBodyStrength = uppperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }

    func checkCurrentBodyCondition() {
        print("--------------")
        print("현재의 컨디션은 다음과 같습니다.")
        print("\(InBody.uppperBodyStrength.name): \(self.uppperBodyStrength)")
        print("\(InBody.lowerBodyStrength.name): \(self.lowerBodyStrength)")
        print("\(InBody.muscularEndurance.name): \(self.muscularEndurance)")
        print("\(InBody.fatigue.name): \(self.fatigue)")
    }
    deinit { print("BodyCondition Type Properties is being deinitializsed")}
}

enum InBody {
    case uppperBodyStrength
    case lowerBodyStrength
    case muscularEndurance
    case fatigue
    
    var name: String {
        switch self {
        case .uppperBodyStrength:
            return "상체근력"
        case .lowerBodyStrength:
            return "하체근력"
        case .muscularEndurance:
            return "근지구력"
        case .fatigue:
            return "피로도"
        }
    }
}

struct Exercise {
    let name: String
    let action: () -> Void
}

enum Exercises {
    case sitUp
    case squart
    case runLong
    case pushUp
    case activeRest
    
    var name: String {
        switch self {
        case .sitUp:
            return "윗몸일으키기"
        case .squart:
            return "스쿼트"
        case .runLong:
            return "오래달리기"
        case .pushUp:
            return "푸쉬업"
        case .activeRest:
            return "동적휴식"
        }
    }
}

struct Routine {
    let name: String
    let exercises: [Exercise]
}

enum Routines {
    case uppperBodyExercise
    case lowerBodyExercise
    case backExercise
    case chestExercise
    case shoulderExercise
    
    var name: String {
        switch self {
        case .uppperBodyExercise:
            return "상체운동"
        case .lowerBodyExercise:
            return "하체운동"
        case .backExercise:
            return "등운동"
        case .chestExercise:
            return "가슴운동"
        case .shoulderExercise:
            return "어깨운동"
        }
    }
}

let quokka = BodyCondition(uppperBodyStrength: 0, lowerBodyStrength: 0,
                           muscularEndurance: 0, fatigue: 0)
let sitUp = Exercise(name: Exercises.sitUp.name) {
    print("\(sitUp.name)")
    quokka.uppperBodyStrength += Int.random(in: 10...20)
    quokka.fatigue += Int.random(in: 10...20)
}
let squart = Exercise(name: Exercises.squart.name) {
    print("\(squart.name)")
    quokka.lowerBodyStrength += Int.random(in: 20...30)
    quokka.fatigue += Int.random(in: 10...20)
}
let runLong = Exercise(name: Exercises.runLong.name) {
    print("\(runLong.name)")
    quokka.muscularEndurance += Int.random(in: 20...30)
    quokka.uppperBodyStrength += Int.random(in: 5...10)
    quokka.lowerBodyStrength += Int.random(in: 5...10)
    quokka.fatigue += Int.random(in: 20...30)
}
let pushUp = Exercise(name: Exercises.pushUp.name) {
    print("\(pushUp.name)")
    quokka.fatigue -= Int.random(in: 5...10)
}
let activeRest = Exercise(name: Exercises.activeRest.name) {
    print("\(activeRest.name)")
    quokka.uppperBodyStrength += Int.random(in: 10...15)
    quokka.fatigue += Int.random(in: 5...10)
}

let upperBodyExercise = Routine(name: Routines.uppperBodyExercise.name,
                                exercises: [pushUp, sitUp,
                                            pushUp, sitUp,
                                            activeRest])
let lowerBodyStrength = Routine(name: Routines.lowerBodyExercise.name,
                                exercises: [squart, squart,
                                            activeRest, squart,
                                            squart, activeRest])
func workOut(_ routine: Routine, person: BodyCondition) {
    print("--------------")
    print("\(routine.name) 루틴을 시작합니다.")
    routine.exercises.forEach { $0.action() }
    person.checkCurrentBodyCondition()
}
workOut(upperBodyExercise, person: quokka)
