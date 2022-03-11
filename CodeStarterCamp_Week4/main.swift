//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let randomNum: (Int, Int) -> Int
randomNum = { (from: Int, to: Int) -> Int in
    return Int.random(in: from...to)
}

class Bodycondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigue: Int
    
    init(upperBodyStrength: Int = 0, lowerBodyStrength: Int = 0, muscular: Int = 0, fatigue: Int = 0) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscular
        self.fatigue = fatigue
    }
    
    func printCurrentCondition() {
        print("--------------")
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(self.upperBodyStrength)")
        print("하체근력: \(self.lowerBodyStrength)")
        print("근지구력: \(self.muscularEndurance)")
        print("피로도: \(self.fatigue)")
    }
}

struct Exercise {
    let name: String
    let action: () -> Void
}

let myBody = Bodycondition(upperBodyStrength: 50, lowerBodyStrength: 50, muscular: 50, fatigue: 50)

let sitUps: Exercise = Exercise(name: "sitUps", action: {
    myBody.upperBodyStrength += randomNum(10, 20)
    myBody.fatigue += randomNum(10, 20)
})

let squat: Exercise = Exercise(name: "squat", action: {
    myBody.lowerBodyStrength += randomNum(20, 30)
    myBody.fatigue += randomNum(10, 20)
})

let crossCountry: Exercise = Exercise(name: "crossCountry", action: {
    myBody.muscularEndurance += randomNum(20, 30)
    myBody.upperBodyStrength += randomNum(5, 10)
    myBody.lowerBodyStrength += randomNum(5, 10)
    myBody.fatigue += randomNum(20, 30)
})

let rest: Exercise = Exercise(name: "rest", action: {
    myBody.fatigue -= randomNum(5, 10)
})

struct Routine {
    private let routineName: String
    private let exercises: Array<Exercise>
    
    init (routineName: String, exercises: Array<Exercise>) {
        self.routineName = routineName
        self.exercises = exercises
    }
    
    func startRoutine() {
        print("--------------")
        print("\(routineName)을 시작합니다.")
        for element in exercises {
            print(element.name)
            element.action()
        }
    }
}

let hellRoutine = Routine(routineName: "missKim's Hell Routine", exercises: [sitUps, sitUps, rest, squat, squat, rest, crossCountry, crossCountry])

hellRoutine.startRoutine()
myBody.printCurrentCondition()
