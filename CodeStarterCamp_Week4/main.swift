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
    
    init(upperBS: Int = 0, lowerBS: Int = 0, muscular: Int = 0, fatigue: Int = 0) {
        self.upperBodyStrength = upperBS
        self.lowerBodyStrength = lowerBS
        self.muscularEndurance = muscular
        self.fatigue = fatigue
    }
    
    func checkCurrentCondition() {
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

var myBody = Bodycondition(upperBS: 50, lowerBS: 50, muscular: 50, fatigue: 0)

let 윗몸일으키기: Exercise = Exercise(name: "윗몸일으키기", action: {
    myBody.upperBodyStrength += randomNum(10,20)
    myBody.fatigue += randomNum(10,20)
})

let 스쿼트: Exercise = Exercise(name: "스쿼트", action: {
    myBody.lowerBodyStrength += randomNum(20,30)
    myBody.fatigue += randomNum(10,20)
})

let 오래달리기: Exercise = Exercise(name: "오래달리기", action: {
    myBody.muscularEndurance += randomNum(20,30)
    myBody.upperBodyStrength += randomNum(5,10)
    myBody.lowerBodyStrength += randomNum(5,10)
    myBody.fatigue += randomNum(20,30)
})

let 동적휴식: Exercise = Exercise(name: "동적휴식", action: {
    myBody.fatigue -= randomNum(5,10)
})

struct Routine {
    let routineName: String
    let exercises: Array<Exercise>
    
    func routineStart() {
        print("--------------")
        print("\(routineName)을 시작합니다.")
        for element in exercises {
            print(element.name)
            element.action()
        }
    }
}

var hellRoutine = Routine(routineName: "missKim's Hell Routine", exercises: [윗몸일으키기, 윗몸일으키기, 동적휴식, 스쿼트, 스쿼트, 동적휴식, 오래달리기, 오래달리기])
