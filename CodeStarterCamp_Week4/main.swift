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
