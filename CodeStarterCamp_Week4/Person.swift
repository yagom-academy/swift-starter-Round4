//
//  Person.swift
//  CodeStarterCamp_Week4
//
//  Created by Hyungmin Lee on 2023/03/14.
//

import Foundation

struct Person {
    var name: String
    var bodyCondition: BodyCondition
    
    init(name: String, _ bodyCondition: BodyCondition) {
        self.name = name
        self.bodyCondition = bodyCondition
    }
}

class BodyCondition {
    var upperBodyStrength: Int {
        didSet (oldValue) {
            print("상체근력이 \(upperBodyStrength - oldValue) 상승합니다.")
        }
    }
    var lowerBodyStrength: Int {
        didSet (oldValue) {
            print("하체근력이 \(lowerBodyStrength - oldValue) 상승합니다.")
        }
    }
    var muscleEndurance: Int {
        didSet (oldValue) {
            print("근지구력 \(muscleEndurance - oldValue) 상승합니다.")
        }
    }
    var fatigue: Int {
        didSet (oldValue) {
            fatigue > oldValue ?
            print("피로도가 \(fatigue - oldValue) 상승합니다.") : print("피로도가 \(oldValue - fatigue) 하락합니다.")
        }
    }
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscleEndurance: Int, fatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscleEndurance = muscleEndurance
        self.fatigue = fatigue
    }
    
    func checkCondition() {
        print("""
              현재의 컨디션은 다음과 같습니다.
              상체근력: \(self.upperBodyStrength)
              하체근력: \(self.lowerBodyStrength)
              근지구력: \(self.muscleEndurance)
              피로도: \(self.fatigue)
              ---------------
              """)
    }
    
    func isOverFatigue() -> Bool {
        fatigue >= 100 ? true : false
    }
}
