//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let sitUp: Exercise = Exercise(name: "윗몸일으키기") { $0.changeStatusAfterSitup() }
let squat: Exercise = Exercise(name: "스쿼트") { $0.changeStatusAfterSquat() }
let longRunning: Exercise = Exercise(name: "오래달리기") { $0.changeStatusAfterLongRunning() }
let activeRest: Exercise = Exercise(name: "동적휴식") { $0.changeStatusAfterActiveRest() }
let todayRoutine: Routine = Routine(name: "전신 근육 박살내기 루틴", routineArray: [sitUp, sitUp, activeRest, squat, squat, activeRest, longRunning, longRunning])
let hellOfSitup: Routine = Routine(name: "지옥의 윗몸일으키기", routineArray: [sitUp, sitUp, activeRest, sitUp, sitUp, activeRest])
let deathOfSquat: Routine = Routine(name: "죽음의 스쿼트", routineArray: [squat, squat, activeRest, squat, squat, activeRest])
let slowLongRunning: Routine = Routine(name: "천천히 오래달리기", routineArray: [longRunning, activeRest])
let routineList: [Routine] = [todayRoutine, hellOfSitup, deathOfSquat, slowLongRunning]
let yagomFitnessCenter: FitnessCenter = FitnessCenter(centerName: "yagom", routineList: routineList)

yagomFitnessCenter.startForTotalRoutine()


