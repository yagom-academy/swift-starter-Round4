//
//  step1.swift
//  CodeStarterCamp_Week4
//
//  Created by 임기웅 on 2022/07/18.
//

import Foundation

class BodyCondition {
    var upperBodyMuscleStrength: Int {
        didSet {
            print("상체근력이 \(upperBodyMuscleStrength - oldValue) 상승합니다")
        }
    }
    var lowerBodyMuscleStrength: Int {
        didSet {
            print("하체근력이 \(lowerBodyMuscleStrength - oldValue) 상승합니다.")
        }
    }
    var muscularEndurance: Int {
        didSet {
            print("근지구력이 \(muscularEndurance - oldValue) 상승합니다.")
        }
    }
    var fatigue: Int {
        didSet {
            if fatigue - oldValue >= 0 {
                print("피로도가 \(fatigue - oldValue) 상승합니다")
            } else {
                print("피로도가 \(oldValue - fatigue) 감소합니다")
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
}

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

func checkBodyCondition(bodyCondition: BodyCondition) {
    print("""
    ------------------------
    현재의 컨디션은 다음과 같습니다.
    상제근력: \(bodyCondition.upperBodyMuscleStrength)
    하체근력: \(bodyCondition.lowerBodyMuscleStrength)
    근지구력: \(bodyCondition.muscularEndurance)
    피로도: \(bodyCondition.fatigue)
    ------------------------
    \n\n
    """)
}

let sitUp: Activity = Activity(
    name: "윗몸일으키기",
    action: { (bodyCondition: BodyCondition) -> Void in
        let plusUpperBodyMuscleStrength = Int.random(in: 10...20)
        let plusFatigue = Int.random(in: 10...20)
        print("<<윗몸일으키기를 시작합니다>>")
        bodyCondition.upperBodyMuscleStrength += plusUpperBodyMuscleStrength
        bodyCondition.fatigue += plusFatigue
    }
)
let squats: Activity = Activity(
    name: "스쿼트",
    action: { (bodyCondition: BodyCondition) -> Void in
        let plusLowerBodyMuscleStrength = Int.random(in: 20...30)
        let plusFatigue = Int.random(in: 10...20)
        print("<<스쿼트를 시작합니다>>")
        bodyCondition.lowerBodyMuscleStrength += plusLowerBodyMuscleStrength
        bodyCondition.fatigue += plusFatigue
    }
)
let longRun: Activity = Activity(
    name: "오래달리기",
    action: { (bodyCondition: BodyCondition) -> Void in
        let plusMuscularEndurance = Int.random(in: 20...30)
        let plusUpperBodyMuscleStrength = Int.random(in: 5...10)
        let plusLowerBodyMuscleStrength = Int.random(in: 5...10)
        let plusFatigue = Int.random(in: 20...30)
        print("<<오래달리기를 시작합니다>>")
        bodyCondition.muscularEndurance += plusMuscularEndurance
        bodyCondition.upperBodyMuscleStrength += plusUpperBodyMuscleStrength
        bodyCondition.lowerBodyMuscleStrength += plusLowerBodyMuscleStrength
        bodyCondition.fatigue += plusFatigue
    }
)
let rest: Activity = Activity(
    name: "휴식",
    action: { (bodyCondition: BodyCondition) -> Void in
        let minusFatigue = Int.random(in: 5...10)
        print("<<잠시 휴식을 취합니다>>")
        bodyCondition.fatigue -= minusFatigue
    }
)
let pushup: Activity = Activity(
    name: "팔굽혀펴기",
    action: { (BodyCondition: BodyCondition) -> Void in
        let plusUpperBodyMuscleStrength = Int.random(in: 20...30)
        let plusFatigue = Int.random(in: 10...20)
        print("<<팔굽혀펴기를 시작합니다>>")
        BodyCondition.upperBodyMuscleStrength += plusUpperBodyMuscleStrength
        BodyCondition.fatigue += plusFatigue
    }
)
