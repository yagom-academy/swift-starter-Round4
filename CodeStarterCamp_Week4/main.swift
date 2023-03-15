//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var bodyCondition: BodyCondition = BodyCondition()

let sitUp: Activity = Activity(name: "윗몸일으키기") {
    print("<<윗몸일으키기을(를) 시작합니다.>>")
    try $0.warnExcessiveFatigue()
    $0.upperBodyStrength += 13 //Int.random(in: 10...20)
    $0.fatigability += 18 //Int.random(in: 10...20)
    print("--------------")
}

let squat: Activity = Activity(name: "스쿼트") {
    print("<<스쿼트을(를) 시작합니다.>>")
    try $0.warnExcessiveFatigue()
    $0.lowerBodyStrength += 20 //Int.random(in: 20...30)
    $0.fatigability += 25 //Int.random(in: 10...20)
    print("--------------")
}

let longRun: Activity = Activity(name: "오래달리기") {
    print("<<오래달리기을(를) 시작합니다.>>")
    try $0.warnExcessiveFatigue()
    $0.muscularEndurance += Int.random(in: 20...30)
    $0.upperBodyStrength += Int.random(in: 5...10)
    $0.lowerBodyStrength += Int.random(in: 5...10)
    $0.fatigability += Int.random(in: 20...30)
    print("--------------")
}

let dynamicBreak: Activity = Activity(name: "동적휴식") {
    print("<<동적휴식을(를) 시작합니다.>>")
    try $0.warnExcessiveFatigue()
    $0.fatigability += -7 //Int.random(in: -10...(-5))
    print("--------------")
}

var routine: Routine = Routine(routineName: "hellRoutine", activities: [sitUp, dynamicBreak, squat])

print("루틴을 몇 번 반복할까요?")

while true {
    do {
        let input = try routine.checkInputValid()
        print("--------------")
        for round in 1...input {
            routine.startReminder = "\(round)"
            print(routine.startReminder)
            print(bodyCondition.fatigability)
            for activity in routine.activities {
                try activity.action(bodyCondition)
            }
        }
    } catch HealthTrainingError.invalidInput {
        print("잘못된 입력 형식입니다. 다시 입력해주세요.")
        continue
    } catch HealthTrainingError.overFatigability {
        print("피로도가 100 이상입니다. 루틴을 중단합니다.")
    }
    
    bodyCondition.printMeasuredBodyCondition()
    break
}
