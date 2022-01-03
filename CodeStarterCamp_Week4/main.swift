//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BodyCondition {
    
    var upperBodyStrength = 0
    var lowerBodyStrength = 0
    var muscularEndurance = 0
    var fatigue = 0
        
    func printBodyCondition() {
        print("--------------")
        print("현재의 컨디션은 다음과 같습니다 ")
        print("상체근력 : \(upperBodyStrength)")
        print("하체근력: \(lowerBodyStrength)")
        print("근지구력: \(muscularEndurance)")
        print("피로도: \(fatigue)")
    }
}

var person = BodyCondition()

struct Exercise {
    let name: String
    let action: () -> Void
}

let situp = Exercise(name: "윗몸일으키기", action: {
    let randomForupperBodyStrength = Int.random(in: 10..<20)
    person.upperBodyStrength += randomForupperBodyStrength
    person.fatigue += randomForupperBodyStrength
    
})

let squat = Exercise(name: "스쿼트 " , action:  {
    let randomForlowerBodyStrength = Int.random(in: 20..<30)
    let randomForfatigue = Int.random(in: 10..<20)
    person.lowerBodyStrength += randomForlowerBodyStrength
    person.fatigue += randomForfatigue
})

let running = Exercise(name: "오래달리기", action: {
    let randomFormuscularEndurance  = Int.random(in: 20..<30)
    let randomForStrength = Int.random(in: 5..<10)
    let randomForFatigue = Int.random(in: 20..<30)
    person.muscularEndurance += randomFormuscularEndurance
    person.lowerBodyStrength += randomForStrength
    person.upperBodyStrength += randomForStrength
    person.fatigue += randomForFatigue
})

let activeRest = Exercise(name: "동정 휴식", action: {
    let randomForFatigue = Int.random(in: 5..<10)
    person.fatigue += randomForFatigue
})

class Routine {
    let name: String
    let exersise: [Exercise]
    
    init(name: String, exersise: [Exercise]) {
        self.name = name
        self.exersise = exersise
    }
    
    func myRoutine() {
        print("--------------")
        print("\(self.name)을 시작합니다")
        for count in 0..<exersise.count {
            exersise[count].action()
            print("\(exersise[count].name)")
        }
    }
}

let hellRoutine = Routine(name: "hellRoutine", exersise: [situp, situp, activeRest, squat, squat , activeRest,
                                                         running, running])
hellRoutine.myRoutine()
person.printBodyCondition()
