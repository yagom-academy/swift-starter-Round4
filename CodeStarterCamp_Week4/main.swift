//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

class BodyCondition {
    var upperBodyMuscle = 50 {
        willSet(newValue) {
            print("상체 근력이 \(newValue - upperBodyMuscle) 상승합니다")
        }
    }
    
    var lowerBodyMuscle = 60 {
        willSet(newValue) {
            print("하체 근력이 \(newValue - lowerBodyMuscle) 상승합니다")
        }
    }
    
    var endurance = 30 {
        willSet(newValue) {
            print("근지구력이 \(newValue - endurance) 상승합니다")
        }
    }
    
    var fatigue = 15 {
        willSet(newValue) {
            if newValue > fatigue {
                print("피로도가 \(newValue - fatigue) 상승합니다")
            } else {
                print("피로도가 \(fatigue - newValue) 하락합니다")
            }
        }
    }
    
    func printBodyCondition() {
        print("현재의 컨디션은 다음과 같습니다.")
        print("""
        상체근력: \(self.upperBodyMuscle)
        하체근력: \(self.lowerBodyMuscle)
        근지구력: \(self.endurance)
        피로도: \(self.fatigue)
        ----------------
        """)
    }
}

func doExercise(activity: Activity, body: BodyCondition) -> Void {
    print("<<\(activity.name)을(를) 시작합니다>>")
    activity.action(body)
    print("----------------")
}

let sitUp = Activity(name: "윗몸일으키기", action: { (bodyCondition) -> Void in
    var body = bodyCondition
    body.upperBodyMuscle += Int.random(in: 10...20)
    body.fatigue += Int.random(in: 10...20)
} )

let squat = Activity(name: "스쿼트", action: { (bodyCondition) -> Void in
    var body = bodyCondition
    body.lowerBodyMuscle += Int.random(in: 20...30)
    body.fatigue += Int.random(in: 10...20)
} )

let running = Activity(name: "오래달리기", action: { (bodyCondition) -> Void in
    var body = bodyCondition
    body.endurance += Int.random(in: 20...30)
    body.upperBodyMuscle += Int.random(in: 5...10)
    body.lowerBodyMuscle += Int.random(in: 5...10)
    body.fatigue += Int.random(in: 20...30)
} )

let rest = Activity(name: "동적휴식", action: { (bodyCondition) -> Void in
    var body = bodyCondition
    body.fatigue -= Int.random(in: 5...10)
} )

var leon = BodyCondition()
doExercise(activity: squat, body: leon)
leon.printBodyCondition()

