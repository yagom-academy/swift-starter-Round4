//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

//세가지 routine을 실행
var firstRoutine : Routine = Routine()
firstRoutine.startRoutine()
var secoundRoutine : Routine = Routine(name: "3분할 중 두번째 Routine", exercises: [deadLift, sitUp , activeRest] )
secoundRoutine.startRoutine()
var thirdRoutine : Routine = Routine(name: "3분할 중 세번째 Routine", exercises: [squat, sitUp , shuttleRun , activeRest])
thirdRoutine.startRoutine()


