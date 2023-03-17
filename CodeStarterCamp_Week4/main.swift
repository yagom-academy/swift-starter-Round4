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
        didSet(beforValue) {
            printCondition(subScripts: "상체근력이", beforeValue: beforValue, afterValue: upperBodyStrength)
        }
    }
    var lowerBodyStrength: Int {
        didSet(beforValue) {
            printCondition(subScripts: "하체근력이", beforeValue: beforValue, afterValue: lowerBodyStrength)
        }
    }
    var muscularEndurance: Int {
        didSet(beforValue) {
            printCondition(subScripts: "근지구력이", beforeValue: beforValue, afterValue: muscularEndurance)
        }
    }
    var fatigue: Int {
        didSet(beforValue) {
            printCondition(subScripts: "피로도가", beforeValue: beforValue, afterValue: fatigue)
            print("-----------")
            
        }
    }
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
    
    func checkCondition() {
        print("""
              현재의 컨디션은 다음과 같습니다.
              상체근력: \(upperBodyStrength)
              하체근력: \(lowerBodyStrength)
              근지구력: \(muscularEndurance)
              피로도: \(fatigue)
              -----------
              """)
    }
    
    func changeStats(by action: String) {
        print("<<\(action)을(를) 시작합니다.>>")
        
        switch action {
            case "윗몸일으키기" :
                upperBodyStrength += Int.random(in: 10...20)
                fatigue += Int.random(in: 10...20)
            case "스쿼트" :
                lowerBodyStrength += Int.random(in: 20...30)
                fatigue += Int.random(in: 10...20)
            case "오래달리기" :
                muscularEndurance += Int.random(in: 20...30)
                upperBodyStrength += Int.random(in: 5...10)
                lowerBodyStrength += Int.random(in: 5...10)
                fatigue += Int.random(in: 20...30)
            case "동적휴식" :
                fatigue -= Int.random(in: 5...10)
            default: print("아무것도 하지 않았으니 아무일도 일어나지 않습니다.")
        }
    }
    
    func printCondition(subScripts: String, beforeValue: Int, afterValue : Int) {
        if beforeValue < afterValue {
            print("\(subScripts) \((beforeValue - afterValue) * -1) 상승합니다.")
        } else if beforeValue > afterValue {
            print("\(subScripts) \((afterValue - beforeValue) * -1) 하락합니다.")
        }
    }
}

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let sitUp: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
    lazy var exerciseName: String = sitUp.name
    bodyCondition.changeStats(by: exerciseName)
})

let squats: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    lazy var exerciseName: String = squats.name
    bodyCondition.changeStats(by: exerciseName)
})

let longRun: Activity = Activity(name: "오래달리기", action: { bodyCondition in
    lazy var exerciseName: String = longRun.name
    bodyCondition.changeStats(by: exerciseName)
})

let stretching: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    lazy var exerciseName: String = stretching.name
    bodyCondition.changeStats(by: exerciseName)
})

var bodyCondition: BodyCondition = BodyCondition(upperBodyStrength: 10, lowerBodyStrength: 10, muscularEndurance: 10, fatigue: 10)

sitUp.action(bodyCondition)
squats.action(bodyCondition)
stretching.action(bodyCondition)
longRun.action(bodyCondition)

bodyCondition.checkCondition()
