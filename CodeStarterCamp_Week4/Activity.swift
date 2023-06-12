//
//  Activity.swift
//  CodeStarterCamp_Week4
//
//  Created by 김예림 on 2023/06/10.
//

import Foundation

struct Activity {
    fileprivate let name: String
    private let action: (inout BodyCondition) -> Void
    
    init(name: String, action: @escaping (inout BodyCondition) -> Void) {
        self.name = name
        self.action = action
    }
    
    func perform(on bodyCondition: inout BodyCondition) {
        action(&bodyCondition)
    }
    
}


let sitUps: Activity = Activity(name: "윗몸일으키기") { bodyCondition in
    let amountOfUpperStrength = Range.tenToTwenty.randomValue()
    let amountOfFatigue = Range.tenToTwenty.randomValue()
    
    bodyCondition.upperBodyStrength += amountOfUpperStrength
    bodyCondition.fatigue += amountOfFatigue
    
    printIncrement(name: "윗몸일으키기",
                   upper: amountOfUpperStrength,
                   fatigue: amountOfFatigue)
    
}



let squat: Activity = Activity(name: "스쿼트") { bodyCondition in
    let amountOfLowerStrength = Range.twentyToThirty.randomValue()
    let amountOfFatigue = Range.tenToTwenty.randomValue()
    
    bodyCondition.lowerBodyStrength += amountOfLowerStrength
    bodyCondition.fatigue += amountOfFatigue
    
    printIncrement(name: "스쿼트",
                   lower: amountOfLowerStrength,
                   fatigue: amountOfFatigue)
        
}

let longRun: Activity = Activity(name: "오래달리기") { bodyCondition in
    let amountOfMuscle = Range.twentyToThirty.randomValue()
    let amountOfUpperAndLower = Range.fiveToTen.randomValue()
    let amountOfFatigue = Range.twentyToThirty.randomValue()
    
    bodyCondition.muscularEndurance += amountOfMuscle
    bodyCondition.lowerBodyStrength += amountOfUpperAndLower
    bodyCondition.upperBodyStrength += amountOfUpperAndLower
    bodyCondition.fatigue += amountOfFatigue
    
    printIncrement(name: "오래달리기",
                   upper: amountOfUpperAndLower,
                   lower: amountOfUpperAndLower,
                   muscle: amountOfMuscle,
                   fatigue: amountOfFatigue)
    
}

let activeRest: Activity = Activity(name: "동적휴식") { bodyCondition in
    let amountOfFatigue = Range.fiveToTen.randomValue()
    bodyCondition.fatigue -= amountOfFatigue
    
    printIncrement(name: "동적휴식", fatigue: amountOfFatigue)

}

func printBodyCondition(bodyCondition: BodyCondition) {
    print("--------------")
    print("현재의 컨디션은 다음과 같습니다.")
    print("상체근력: \(bodyCondition.upperBodyStrength)")
    print("하체근력: \(bodyCondition.lowerBodyStrength)")
    print("근지구력: \(bodyCondition.muscularEndurance)")
    print("피로도: \(bodyCondition.fatigue)")
    print("--------------")
}

func printIncrement(name activityName: String,
                            upper: Int? = nil, lower: Int? = nil, muscle: Int? = nil, fatigue: Int? = nil) {
    print("<<\(activityName)을(를) 시작합니다>>")
    if let upper = upper {
        print("상체근력이 \(upper) 상승합니다.")
    }
    if let lower = lower {
        print("하체근력이 \(lower) 상승합니다.")
    }
    if let muscle = muscle {
        print("근지구력이 \(muscle) 상승합니다.")
    }
    if let fatigue = fatigue {
        print("피로도가 \(fatigue) \(fatigue > 0 ? "상승" : "하락")합니다.")
    }
}

func checkBodyCondition(activityName: String, bodyCondition: inout BodyCondition) {

    switch activityName {
    case "윗몸일으키기":
        sitUps.perform(on: &bodyCondition)
    case "스쿼트":
        squat.perform(on: &bodyCondition)
    case "오래달리기":
        longRun.perform(on: &bodyCondition)
    case "동적휴식":
        activeRest.perform(on: &bodyCondition)
    default:
        print("해당하는 활동이 없습니다.")
    }
    
    printBodyCondition(bodyCondition: bodyCondition)
}

