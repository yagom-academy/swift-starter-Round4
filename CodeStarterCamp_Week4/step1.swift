//
//  step1.swift
//  CodeStarterCamp_Week4
//
//  Created by 김경준 on 2022/11/11.
//

import Foundation

// MARK: STEP1 활동 만들기
class BodyCondition {
    var upperBodyStrength = 0 {
        didSet(oldValue) {
            print("상체근력이 \(self.upperBodyStrength - oldValue) 상승합니다.")
        }
    }
    
    var lowerBodyStrength = 0 {
        didSet(oldValue) {
            print("하체근력이 \(self.lowerBodyStrength - oldValue) 상승합니다.")
        }
    }
    
    var muscularEndurance = 0 {
        didSet(oldValue) {
            print("근지구력이 \(self.muscularEndurance - oldValue) 상승합니다.")
        }
    }
    
    var fatigue = 0 {
        didSet(oldValue) {
            if fatigue > 0, fatigue >= oldValue {
                print("피로도가 \(self.fatigue - oldValue) 상승합니다.")
            } else if fatigue >= 0, fatigue < oldValue {
                print("피로도가 \(oldValue - self.fatigue) 감소합니다.")
            } else {
                fatigue = 0
                print("컨디션 최상! 더 이상 피로도가 감소하지 않습니다.")
            }
        }
    }
    
    func checkCondition() {
        print("""
    현재의 컨디션은 다음과 같습니다.
    상체근력: \(self.upperBodyStrength)
    하체근력: \(self.lowerBodyStrength)
    근지구력: \(self.muscularEndurance)
    피로도: \(self.fatigue)
    --------------
    """)
    }
    
    func addRandomIntUpperStrength(from a: Int, to b: Int) {
        self.upperBodyStrength += Int.random(in: a...b)
    }
    
    func addRandomIntLowerStrength(from a: Int, to b: Int) {
        self.lowerBodyStrength += Int.random(in: a...b)
    }
    
    func addRandomIntMuscularEndurance(from a: Int, to b: Int) {
        self.muscularEndurance += Int.random(in: a...b)
    }
    
    func addRandomIntFatigue(from a: Int, to b: Int) {
        self.fatigue += Int.random(in: a...b)
    }
}

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let sitUp = Activity(name: "윗몸일으키키", action: { bodyCondition in
    print("<<\(sitUp.name)을(를) 시작합니다>>")
    bodyCondition.addRandomIntUpperStrength(from: 10, to: 20)
    bodyCondition.addRandomIntFatigue(from: 10, to: 20)
    print("--------------")
})

let squat = Activity(name: "스쿼트", action: { bodyCondition in
    print("<<\(squat.name)을(를) 시작합니다>>")
    bodyCondition.addRandomIntLowerStrength(from: 20, to: 30)
    bodyCondition.addRandomIntFatigue(from: 10, to: 20)
    print("--------------")
})

let running = Activity(name: "오래달리기", action: { bodyCondition in
    print("<<\(running.name)을(를) 시작합니다>>")
    bodyCondition.addRandomIntMuscularEndurance(from: 20, to: 30)
    bodyCondition.addRandomIntUpperStrength(from: 5, to: 10)
    bodyCondition.addRandomIntLowerStrength(from: 5, to: 10)
    bodyCondition.addRandomIntFatigue(from: 20, to: 30)
    print("--------------")
})

let dynamicBreak = Activity(name: "동적휴식", action: { bodyCondition in
    print("<<\(dynamicBreak.name)을(를) 시작합니다>>")
    bodyCondition.addRandomIntFatigue(from: -10, to: -5)
    print("--------------")
})

let climbing = Activity(name: "클라이밍", action: { bodyCondition in
    print("\(climbing.name)을(를) 시작합니다>>")
    bodyCondition.addRandomIntUpperStrength(from: 5, to: 10)
    bodyCondition.addRandomIntLowerStrength(from: 5, to: 10)
    bodyCondition.addRandomIntMuscularEndurance(from: 10, to: 20)
    bodyCondition.addRandomIntFatigue(from: 5, to: 10)
    print("--------------")
})
