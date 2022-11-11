//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int {
        
        didSet(oldValue) {
            print("상체근력이 \(upperBodyStrength - oldValue) 상승합니다.")
        }
    }
    var lowerBodyStrength: Int {
        
        didSet(oldValue) {
            print("하체근력이 \(lowerBodyStrength - oldValue) 상승합니다.")
        }
    }
    var muscularEndurance: Int {
        
        didSet(oldValue) {
            print("근지구력이 \(muscularEndurance - oldValue) 상승합니다.")
        }
    }
    var fatigueDegree: Int {
        
        didSet(oldValue) {
            if fatigueDegree > oldValue {
                print("피로도가 \(fatigueDegree - oldValue) 상승합니다.")
            } else {
                print("피로도가 \(oldValue - fatigueDegree) 하락합니다.")
            }
        }
    }
    var coreStrength: Int {
        
        didSet(oldValue) {
            print("코어힘이 \(coreStrength - oldValue) 상승합니다.")
        }
    }
    var bodyWeight: Int = 100 {
        
        willSet(afterDiet) {
            print("\(bodyWeight)kg 에서 \(afterDiet-bodyWeight)kg 감량했습니다.")
        }
    }
    init(
        upperBodyStrength: Int,
        lowerBodyStrength: Int,
        muscularEndurance : Int,
        fatigueDegree: Int,
        coreStrength: Int
    ) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigueDegree = fatigueDegree
        self.coreStrength = coreStrength
    }
    func checkBodyCondition() {
        print("--------------")
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(upperBodyStrength)")
        print("하체근력: \(lowerBodyStrength)")
        print("근지구력: \(muscularEndurance)")
        print("피로도: \(fatigueDegree)")
        print("코어힘: \(coreStrength)")
        print("--------------")
        print("최종 몸무게는 \(bodyWeight)kg 입니다.")
    }
}

struct Activity {
    let name : String
    let action: (BodyCondition) -> Void
}

let situp: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
    print("<<\(situp.name)을(를) 시작합니다>>")
    bodyCondition.upperBodyStrength += Int.random(in: 10...20)
    bodyCondition.fatigueDegree += Int.random(in: 10...20)
})
let squirt: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    print("<<\(squirt.name)을(를) 시작합니다>>")
    bodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    bodyCondition.fatigueDegree += Int.random(in: 10...20)
    bodyCondition.bodyWeight -= Int.random(in: 1...10)
})
let longDistanceRunning: Activity = Activity(name: "오래달리기", action: { bodyCondition in
    print("<<\(longDistanceRunning.name)을(를) 시작합니다>>")
    bodyCondition.muscularEndurance += Int.random(in: 20...30)
    bodyCondition.upperBodyStrength += Int.random(in: 5...10)
    bodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    bodyCondition.fatigueDegree += Int.random(in: 20...30)
})
let dynamicRest: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    print("<<\(dynamicRest.name)을(를) 시작합니다>>")
    bodyCondition.fatigueDegree -= Int.random(in: 5...10)
})
let pilates: Activity = Activity(name: "필라테스", action: { bodyCondition in
    print("<<\(pilates.name)을(를) 시작합니다>>")
    bodyCondition.coreStrength += Int.random(in: 5...10)
    bodyCondition.fatigueDegree += Int.random(in: 5...10)
    bodyCondition.bodyWeight -= Int.random(in: 1...10)
})

var yourBodyCondition: BodyCondition = BodyCondition(
    upperBodyStrength: 0,
    lowerBodyStrength: 0,
    muscularEndurance: 0,
    fatigueDegree: 0,
    coreStrength: 0
)


situp.action(yourBodyCondition)
pilates.action(yourBodyCondition)
longDistanceRunning.action(yourBodyCondition)
dynamicRest.action(yourBodyCondition)
squirt.action(yourBodyCondition)
yourBodyCondition.checkBodyCondition()



