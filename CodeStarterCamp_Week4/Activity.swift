//
//  Activity.swift
//  CodeStarterCamp_Week4
//
//  Created by 심정민 on 2023/06/14.
//

import Foundation

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기", action: { (bodyCondition: BodyCondition)  in
    print("<<\(윗몸일으키기.name)을(를) 시작합니다.>>")
    let randomUpperStrength: Int = Int.random(in: 10...20)
    let randomFatigue: Int = Int.random(in: 10...20)
    bodyCondition.upperBodyStrength += randomUpperStrength
    bodyCondition.fatigability += randomFatigue
    print("상체근력이 \(randomUpperStrength) 상승합니다.")
    print("상체근력이 \(randomFatigue) 상승합니다.")
    print("--------------")
    bodyCondition.printCondition()
    
})

let 스쿼트: Activity = Activity(name: "스쿼트", action: { (bodyCondition: BodyCondition)  in
    print("<<\(스쿼트.name)을(를) 시작합니다.>>")
    let randomLowerStrength: Int = Int.random(in: 20...30)
    let randomFatigue: Int = Int.random(in: 10...20)
    bodyCondition.lowerBodyStrength += randomLowerStrength
    bodyCondition.fatigability += randomFatigue
    print("상체근력이 \(randomLowerStrength) 상승합니다.")
    print("상체근력이 \(randomFatigue) 상승합니다.")
    print("--------------")
    bodyCondition.printCondition()
})

let 오래달리기: Activity = Activity(name: "오래달리기", action: { (bodyCondition: BodyCondition)  in
    print("<<\(오래달리기.name)을(를) 시작합니다.>>")
    let randomMuscularStrength: Int = Int.random(in: 20...30)
    let randomLowerStrength: Int = Int.random(in: 5...10)
    let randomUpperStrength: Int = Int.random(in: 5...10)
    let randomFatigue: Int = Int.random(in: 20...30)
    bodyCondition.muscularEndurance += randomMuscularStrength
    bodyCondition.lowerBodyStrength += randomLowerStrength
    bodyCondition.upperBodyStrength += randomUpperStrength
    bodyCondition.fatigability += randomFatigue
    print("상체근력이 \(randomMuscularStrength) 상승합니다.")
    print("상체근력이 \(randomLowerStrength) 상승합니다.")
    print("상체근력이 \(randomUpperStrength) 상승합니다.")
    print("상체근력이 \(randomFatigue) 상승합니다.")
    print("--------------")
    bodyCondition.printCondition()
})

let 동적휴식: Activity = Activity(name: "동적휴식", action: { (bodyCondition: BodyCondition)  in
    print("<<\(동적휴식.name)을(를) 시작합니다.>>")
    let randomFatigue: Int = Int.random(in: 5...10)
    bodyCondition.fatigability -= randomFatigue
    print("상체근력이 \(randomFatigue) 하락합니다.")
    print("--------------")
    bodyCondition.printCondition()
})

let 플랭크: Activity = Activity(name: "플랭크", action: { (bodyCondition: BodyCondition)  in
    print("<<\(플랭크.name)을(를) 시작합니다.>>")
    let randomUpperStrength: Int = Int.random(in: 10...20)
    let randomFatigue: Int = Int.random(in: 10...20)
    bodyCondition.upperBodyStrength += randomUpperStrength
    bodyCondition.fatigability += randomFatigue
    print("상체근력이 \(randomUpperStrength) 상승합니다.")
    print("상체근력이 \(randomFatigue) 상승합니다.")
    print("--------------")
    bodyCondition.printCondition()
})
