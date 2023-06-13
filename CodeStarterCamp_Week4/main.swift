//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// MARK: Activity 정의
let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기") { condition in
    condition.increaseUpperBodyCondition(by: getRandomStats(range: 10...20))
    condition.increaseFatigueLevel(by: getRandomStats(range: 10...20))
}

let 스쿼트 = Activity(name: "스쿼트") { condition in
    condition.increaseLowerBodyCondition(by: getRandomStats(range: 20...30))
    condition.increaseFatigueLevel(by: getRandomStats(range: 10...20))
}

let 오래달리기 = Activity(name: "오래달리기") { condition in
    condition.increaseUpperBodyCondition(by: getRandomStats(range: 5...10))
    condition.increaseLowerBodyCondition(by: getRandomStats(range: 5...10))
    condition.increaseMuscularEduranceCondition(by: getRandomStats(range: 20...30))
    condition.increaseFatigueLevel(by: getRandomStats(range: 20...30))
}

let 동적휴식 = Activity(name: "동적휴식") { condition in
    condition.increaseFatigueLevel(by: getRandomStats(range: -10 ... -5))
}

func getRandomStats(range: ClosedRange<Int>) -> Int {
    Int.random(in: range)
}

// MARK: - 실행
var myBodyCondition = BodyCondition(upperBodyStrength: 10, lowerBodyStrength: 20, muscularEndurance: 20, fatigueLevel: 0)
let hell = Routine(name: "hellRoutine", activities: [윗몸일으키기, 동적휴식, 스쿼트])

//func startRoutine(to routine: Routine) {
//    do {
//        let cycle = try routine.inputCycle()
//        for _ in 0..<cycle {
//            try routine.executeRoutine(bodyCondition: myBodyCondition)
//        }
//    } catch RoutineError.inputError {
//        print("잘못된 입력 형식입니다. 다시 입력해주세요.")
//        startRoutine(to: routine)
//    } catch RoutineError.overwork {
//        print("피로도가 100 이상입니다. 루틴을 중단합니다.")
//    } catch {
//        print("알 수 없는 에러가 발생했습니다.")
//    }
//}
//
//startRoutine(to: hell)
hell.startRoutine()
