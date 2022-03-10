//
//  Step1.swift
//  CodeStarterCamp_Week4
//
//  Created by 지상률 on 2022/03/07.
//

import Foundation

class BodyCondition {
    var upperBody: Int
    var lowerBody: Int
    var endurance: Int
    var fatigue: Int
    
    init() {
        self.upperBody = 0
        self.lowerBody = 0
        self.endurance = 0
        self.fatigue = 0
    }
    
    init(upperBody: Int, lowerBody: Int, endurance: Int, fatigue: Int) {
        self.upperBody = upperBody
        self.lowerBody = lowerBody
        self.endurance = endurance
        self.fatigue = fatigue
    }
}

var jeeeeSang = BodyCondition()

//운동 타입
struct Exercise {
    let name: String
    let action: () -> Void
}

let sitUp: Exercise = Exercise(name: "윗몸일으키기") {
    jeeeeSang.upperBody += Int.random(in: 10...20)
    jeeeeSang.fatigue += Int.random(in: 10...20)
}
let squat: Exercise = Exercise(name: "스쿼트") {
    jeeeeSang.lowerBody += Int.random(in: 20...30)
    jeeeeSang.fatigue += Int.random(in: 10...20)
}
let pushUp: Exercise = Exercise(name: "팔굽혀피기") {
    jeeeeSang.upperBody += Int.random(in: 10...20)
    jeeeeSang.fatigue += Int.random(in: 10...20)
}
let shuttleRun: Exercise = Exercise(name: "오래달리기") {
    jeeeeSang.endurance += Int.random(in: 20...30)
    jeeeeSang.upperBody += Int.random(in: 5...10)
    jeeeeSang.lowerBody += Int.random(in: 5...10)
    jeeeeSang.fatigue += Int.random(in: 20...30)
}
let deadLift: Exercise = Exercise(name: "데드리프트") {
    jeeeeSang.upperBody += Int.random(in: 5...10)
    jeeeeSang.fatigue += Int.random(in: 20...30)
}
let activeRest: Exercise = Exercise(name: "동적휴식") {
    jeeeeSang.fatigue -= Int.random(in: 5...10)
}


struct Routine {
    var name: String = "3분할 중 첫번째 Routine"
    var exercises: Array = [
        pushUp,
        sitUp,
        activeRest
    ]
    
    
    mutating func startRoutine() {
        print("--------------------")
        for exercise in exercises {
            print(exercise.name)
            exercise.action() //exercises안에 있는 클로져 실행
        }
        
        print("--------------------")
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(jeeeeSang.upperBody)")
        print("하체근력: \(jeeeeSang.lowerBody)")
        print("근지구력: \(jeeeeSang.endurance)")
        print("피로도: \(jeeeeSang.fatigue)")
    }
}
