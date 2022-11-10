//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


// MARK: - STEP1 호출
var myCondition: BodyCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigueLevel: 0)
//workOut(activity: sitUp, by: myCondition)
//workOut(activity: squat, by: myCondition)
//workOut(activity: longRunning, by: myCondition)
//workOut(activity: activeRest, by: myCondition)
//
//myCondition.informBodyCondition()


// MARK: - STEP2 호출
var myRoutine: Routine = Routine(name: "hyemorysRoutine")

func executeRoutine() {
    do {
        try myRoutine.repeatRoutine(by: myCondition)
    } catch RoutineError.invalidInput {
        print("잘못된 입력 형식입니다. 다시 입력해주세요.")
        executeRoutine()
    } catch RoutineError.fatigueLevelLimit {
        print("피로도가 100이상입니다. 루틴을 중단합니다.")
        myCondition.informBodyCondition()
    } catch {
        print(error)
    }
}

print("루틴을 몇 번 반복할까요?")
executeRoutine()

