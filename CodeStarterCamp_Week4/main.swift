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
    
    func sitUp() -> Exercise {
        print(Exercises.sitUp.name)
        self.uppperBodyStrength += Int.random(in: 10...20)
        self.fatigue += Int.random(in: 10...20)
        return Exercise(name: Exercises.sitUp.name, action: sitUp)
    }
    
    func moveSquat() -> Exercise {
        print(Exercises.squart.name)
        self.lowerBodyStrength += Int.random(in: 20...30)
        self.fatigue += Int.random(in: 10...20)
        return Exercise(name: Exercises.squart.name, action: moveSquat)
    }
    
    func runLong() -> Exercise {
        print(Exercises.runLong.name)
        self.muscularEndurance += Int.random(in: 20...30)
        self.uppperBodyStrength += Int.random(in: 5...10)
        self.lowerBodyStrength += Int.random(in: 5...10)
        self.fatigue += Int.random(in: 20...30)
        return Exercise(name: Exercises.runLong.name, action: runLong)
    }
    
    func moveActiveRest() -> Exercise {
        print(Exercises.activeRest.name)
        self.fatigue -= Int.random(in: 5...10)
        return Exercise(name: Exercises.activeRest.name, action: moveActiveRest)
    }
    
    func pushUp() -> Exercise {
        print(Exercises.pushUp.name)
        self.uppperBodyStrength += Int.random(in: 10...15)
        self.fatigue += Int.random(in: 5...10)
        return Exercise(name: Exercises.pushUp.name, action: pushUp)
    }
    
    func printBodyCondition() {
        print("--------------")
        print("현재의 컨디션은 다음과 같습니다.")
        print("\(InBody.uppperBodyStrength.name): \(self.uppperBodyStrength)")
        print("\(InBody.lowerBodyStrength.name): \(self.lowerBodyStrength)")
        print("\(InBody.muscularEndurance.name): \(self.muscularEndurance)")
        print("\(InBody.fatigue.name): \(self.fatigue)")
    }
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
    var action: () -> Self
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
    let exercises: [() -> Exercise]
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

var quokka = BodyCondition(uppperBodyStrength: 0, lowerBodyStrength: 0,
                           muscularEndurance: 0, fatigue: 0)
let sitUp = Exercise(name: Exercises.sitUp.name, action: quokka.sitUp)
let squart = Exercise(name: Exercises.squart.name, action: quokka.moveSquat)
let runLong = Exercise(name: Exercises.runLong.name, action: quokka.runLong)
let pushUp = Exercise(name: Exercises.pushUp.name, action: quokka.pushUp)
let activeRest = Exercise(name: Exercises.activeRest.name, action: quokka.moveActiveRest)

let upperBodyExercise = Routine(name: Routines.uppperBodyExercise.name,
                                exercises: [pushUp.action, sitUp.action,
                                            pushUp.action, sitUp.action,
                                            activeRest.action])
let lowerBodyStrength = Routine(name: Routines.lowerBodyExercise.name,
                                exercises: [squart.action, squart.action,
                                            activeRest.action, squart.action,
                                            squart.action, activeRest.action])
