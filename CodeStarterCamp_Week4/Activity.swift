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


let sitUps: Activity = Activity(name: TypesOfActivity.sitUps.description) { bodyCondition in
    let amountOfUpperStrength = Range.tenToTwenty.randomValue
    let amountOfFatigue = Range.tenToTwenty.randomValue
    
    bodyCondition.update(upperBodyStrength: amountOfUpperStrength, fatigue: amountOfFatigue)
    printIncrement(name: TypesOfActivity.sitUps.description,
                   upper: amountOfUpperStrength,
                   fatigue: amountOfFatigue)
    
}



let squat: Activity = Activity(name: TypesOfActivity.squat.description) { bodyCondition in
    let amountOfLowerStrength = Range.twentyToThirty.randomValue
    let amountOfFatigue = Range.tenToTwenty.randomValue
    
    bodyCondition.update(lowerBodyStrength: amountOfLowerStrength, fatigue: amountOfFatigue)
    printIncrement(name: TypesOfActivity.squat.description,
                   lower: amountOfLowerStrength,
                   fatigue: amountOfFatigue)
        
}

let longRun: Activity = Activity(name: TypesOfActivity.longRun.description) { bodyCondition in
    let amountOfMuscle = Range.twentyToThirty.randomValue
    let amountOfUpperAndLower = Range.fiveToTen.randomValue
    let amountOfFatigue = Range.twentyToThirty.randomValue
    
    bodyCondition.update(upperBodyStrength: amountOfUpperAndLower,
                         lowerBodyStrength: amountOfUpperAndLower,
                         muscularEndurance: amountOfMuscle,
                         fatigue: amountOfFatigue)
    printIncrement(name: TypesOfActivity.longRun.description,
                   upper: amountOfUpperAndLower,
                   lower: amountOfUpperAndLower,
                   muscle: amountOfMuscle,
                   fatigue: amountOfFatigue)
    
}

let activeRest: Activity = Activity(name: TypesOfActivity.activeRest.description) { bodyCondition in
    let amountOfFatigue = Range.fiveToTen.randomValue
    bodyCondition.update(fatigue: amountOfFatigue)
    
    printIncrement(name: TypesOfActivity.activeRest.description, fatigue: amountOfFatigue)

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
                    upper: Int? = nil,
                    lower: Int? = nil,
                    muscle: Int? = nil,
                    fatigue: Int? = nil) {
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
    case TypesOfActivity.sitUps.description:
        sitUps.perform(on: &bodyCondition)
    case TypesOfActivity.squat.description:
        squat.perform(on: &bodyCondition)
    case TypesOfActivity.longRun.description:
        longRun.perform(on: &bodyCondition)
    case TypesOfActivity.activeRest.description:
        activeRest.perform(on: &bodyCondition)
    default:
        print("해당하는 활동이 없습니다.")
    }
    
    printBodyCondition(bodyCondition: bodyCondition)
}

