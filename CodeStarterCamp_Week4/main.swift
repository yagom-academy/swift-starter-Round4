//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let sitUp = Activity(name: "윗몸일으키기") { bodyCondition in
    print("<<윗몸일으키기를 시작합니다>>")
    bodyCondition.upperBodyStrength += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)
    bodyCondition.checkCurrent()
}

let squat = Activity(name: "스쿼트") { bodyCondition in
    print("<<스쿼트를 시작합니다>>")
    bodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 10...20)
    bodyCondition.checkCurrent()
}

let running = Activity(name: "오래달리기") { bodyCondition in
    print("<<오래달리기를 시작합니다>>")
    bodyCondition.muscularEndurance += Int.random(in: 20...30)
    bodyCondition.upperBodyStrength += Int.random(in: 5...10)
    bodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    bodyCondition.fatigue += Int.random(in: 20...30)
    bodyCondition.checkCurrent()
}

let dyanamicRest = Activity(name: "동적휴식") { bodyCondition in
    print("<<동적휴식를 시작합니다>>")
    bodyCondition.fatigue -= Int.random(in: 5...10)
    bodyCondition.checkCurrent()
}

let pullUp = Activity(name: "턱걸이") { bodyCondition in
    print("<<턱걸이를 시작합니다>>")
    bodyCondition.upperBodyStrength += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 10...20)
    bodyCondition.checkCurrent()
}

let pushUp = Activity(name: "팔굽혀펴기") { bodyCondition in
    print("<<팔굽혀펴기를 시작합니다>>")
    bodyCondition.upperBodyStrength += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 10...20)
    bodyCondition.checkCurrent()
}

let bodyCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0)

let routine = Routine(name: "상체 운동", activities: [sitUp, pullUp, pushUp])

func promptForRoutineInput() {
    do {
        try routine.getInput(with: bodyCondition)
    } catch RoutineError.invalidInput {
        print("잘못된 입력 형식입니다. 다시 입력해주세요.")
        promptForRoutineInput()  // 재귀 호출
    } catch RoutineError.overFatigue {
        print("피로도가 100 이상입니다. 루틴을 중단합니다.")
        bodyCondition.checkCurrent()
    } catch {
        print("알 수 없는 오류 발생")
    }
}

promptForRoutineInput()  // 함수 호출
