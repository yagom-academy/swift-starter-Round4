//
//  activity.swift
//  CodeStarterCamp_Week4
//
//  Created by junho lee on 2022/07/18.
//

import Foundation

class BodyCondition {
    private var upperBodyMuscleStrength: Int {
        didSet {
            print("상체근력이 \(upperBodyMuscleStrength - oldValue) 상승합니다.")
        }
    }
    private var lowerBodyMuscleStrength: Int {
        didSet {
            print("하체근력이 \(lowerBodyMuscleStrength - oldValue) 상승합니다.")
        }
    }
    private var muscularEndurance: Int {
        didSet {
            print("근지구력이 \(muscularEndurance - oldValue) 상승합니다.")
        }
    }
    private var fatigue: Int {
        didSet {
            if fatigue > oldValue {
                print("피로도가 \(fatigue - oldValue) 상승합니다.")
            } else {
                print("피로도가 \(oldValue - fatigue) 하락합니다.")
            }
        }
    }
    
    init(upperBodyMuscleStrength: Int,
         lowerBodyMuscleStrength: Int,
         muscularEndurance: Int,
         fatigue: Int) {
        self.upperBodyMuscleStrength = upperBodyMuscleStrength
        self.lowerBodyMuscleStrength = lowerBodyMuscleStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
    
    func raiseUpperBodyMuscleStrength(_ strength: Int) {
        self.upperBodyMuscleStrength += strength
    }
    
    func raiseLowerBodyMuscleStrength(_ strength: Int) {
        self.lowerBodyMuscleStrength += strength
    }
    
    func raiseMuscularEndurance(_ endurance: Int) {
        self.muscularEndurance += endurance
    }
    
    func raiseFatigue(_ fatigue: Int) {
        self.fatigue += fatigue
    }
    
    func dropFatigue(_ fatigue: Int) {
        self.fatigue = fatigue > self.fatigue ? 0 : self.fatigue - fatigue
    }
    
    func printCurrentBodyCondition() {
        print("현재의 컨디션은 다음과 같습니다.",
              "상체근력: \(self.upperBodyMuscleStrength)",
              "하체근력: \(self.lowerBodyMuscleStrength)",
              "근지구력: \(self.muscularEndurance)",
              "피로도: \(self.fatigue)",
              "--------------"
              ,separator: "\n")
    }
}

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let sitUp: Activity = Activity(name: "윗몸일으키기",
                               action: { (bodyCondition: BodyCondition) in
    print("윗몸일으키기를 시작합니다.")
    bodyCondition.raiseUpperBodyMuscleStrength(Int.random(in: 10...20))
    bodyCondition.raiseFatigue(Int.random(in: 10...20))
    print("--------------")
})

let squat: Activity = Activity(name: "스쿼트",
                               action: { (bodyCondition: BodyCondition) in
    print("스쿼트를 시작합니다.")
    bodyCondition.raiseLowerBodyMuscleStrength(Int.random(in: 20...30))
    bodyCondition.raiseFatigue(Int.random(in: 10...20))
    print("--------------")
})

let longRun: Activity = Activity(name: "오래달리기",
                                 action: { (bodyCondition: BodyCondition) in
    print("오래달리기를 시작합니다.")
    bodyCondition.raiseMuscularEndurance(Int.random(in: 20...30))
    bodyCondition.raiseUpperBodyMuscleStrength(Int.random(in: 5...10))
    bodyCondition.raiseLowerBodyMuscleStrength(Int.random(in: 5...10))
    bodyCondition.raiseFatigue(Int.random(in: 20...30))
    print("--------------")
})

let dynamicRest: Activity = Activity(name: "동적휴식") {
    (bodyCondition: BodyCondition) in
    print("동적휴식을 시작합니다.")
    bodyCondition.dropFatigue(Int.random(in: 5...10))
    print("--------------")
}

let sleep: Activity = Activity(name: "잠자기") {
    print("잠자기를 시작합니다.")
    $0.dropFatigue(Int.random(in: 20...30))
    print("--------------")
}
