//
//  Activity.swift
//  CodeStarterCamp_Week4
//
//  Created by suyeon park on 2023/03/14.
//

import Foundation

//활동 타입
struct Activity {
        let name: String
        let action: (BodyCondition) -> Void
}

//예시 활동
let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
    printStartMessage(name: "윗몸일으키기")
    
    let power = Int.random(in: 10...20)
    printUpperBodyStrength(power: power)
    bodyCondition.upperBodyStrength += power
    
    exercising(bodyCondition: bodyCondition, from: 10, to: 20)
    
    printMyBodyCondition(bodyCondition: bodyCondition)
})

let 스쿼트: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    printStartMessage(name: "스쿼트")
    
    let power = Int.random(in: 20...30)
    printLowerBodyStrength(power: power)
    bodyCondition.lowerBodyStrength += power
    
    exercising(bodyCondition: bodyCondition, from: 10, to: 20)
    
    printMyBodyCondition(bodyCondition: bodyCondition)
})

let 오래달리기: Activity = Activity(name: "오래달리기", action: { bodyCondition in
    printStartMessage(name: "오래달리기")
    
    let power = Int.random(in: 20...30)
    printMuscularEndurance(power: power)
    bodyCondition.muscularEndurance += power
    
    let uppperPower = Int.random(in: 5...10)
    printUpperBodyStrength(power: uppperPower)
    bodyCondition.upperBodyStrength += uppperPower
    
    let lowerPower = Int.random(in: 5...10)
    printLowerBodyStrength(power: lowerPower)
    bodyCondition.lowerBodyStrength += lowerPower
    
    exercising(bodyCondition: bodyCondition, from: 20, to: 30)
    
    printMyBodyCondition(bodyCondition: bodyCondition)
})

let 동적휴식: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    printStartMessage(name: "동적휴식")
    
    relax(bodyCondition: bodyCondition, from: 5, to: 10)
    
    printMyBodyCondition(bodyCondition: bodyCondition)
})

let 취침: Activity = Activity(name: "취침", action: { bodyCondition in
    printStartMessage(name: "취침")
    
    relax(bodyCondition: bodyCondition, from: 50, to: 100)
    
    printMyBodyCondition(bodyCondition: bodyCondition)
})

private func exercising(bodyCondition: BodyCondition, from start: Int, to end: Int) {
    let fatigue = Int.random(in: start...end)
    print("피로도가 \(fatigue) 상승합니다.")
    bodyCondition.fatigue += fatigue
}

private func relax(bodyCondition: BodyCondition, from start: Int, to end: Int) {
    let fatigue = Int.random(in: start...end)
    print("피로도가 \(fatigue) 하락합니다.")
    bodyCondition.fatigue -= fatigue
}

private func printStartMessage(name: String) {
    print("<<\(name)을(를) 시작합니다>>")
}

private func printUpperBodyStrength(power: Int) {
    print("상체근력이 \(power) 상승합니다.")
}

private func printLowerBodyStrength(power: Int) {
    print("하체근력이 \(power) 상승합니다.")
}

private func printMuscularEndurance(power: Int) {
    print("근지구력이 \(power) 상승합니다.")
}

private func printMyBodyCondition(bodyCondition: BodyCondition) {
    print("--------------\n현재의 컨디션은 다음과 같습니다.\n상체근력:\(bodyCondition.upperBodyStrength)\n하체근력: \(bodyCondition.lowerBodyStrength)\n근지구력: \(bodyCondition.muscularEndurance)\n피로도: \(bodyCondition.fatigue)\n--------------")
}
