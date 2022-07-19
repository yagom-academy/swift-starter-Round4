//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var BodyConditionw = BodyCondition()
let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기", action: { BodyConditionw in BodyConditionw.moveSitUp()
})
let 스쿼트: Activity = Activity(name: "스쿼트", action: { BodyConditionw in BodyConditionw.moveSquat()
})
let 오래달리기: Activity = Activity(name: "오래달리기", action: { BodyConditionw in BodyConditionw.moveLongRun()
})
let 휴식: Activity = Activity(name: "휴식", action: { BodyConditionw in BodyConditionw.moveRest()
})

moveExercise(윗몸일으키기)
moveExercise(스쿼트)
moveExercise(오래달리기)
moveExercise(휴식)
