//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by Nat Kim on 2023/12/18.
//

import Foundation

// MARK: - Round4 [STEP1] 활동을 만들어 진행해보자

var bodyCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0)

let sitUp: Activity = Activity(name: .sitUp) { bodyCondition in
    bodyCondition.performActivity(.sitUp)
}


sitUp.action(bodyCondition)
bodyCondition.printCurrentCondition()


let squat: Activity = Activity(name: .squat) { bodyCondition in
    bodyCondition.performActivity(.squat)
}

squat.action(bodyCondition)
bodyCondition.printCurrentCondition()

let marathon: Activity = Activity(name: .longDistanceRunning) { bodyCondition in
    bodyCondition.performActivity(.longDistanceRunning)
}

marathon.action(bodyCondition)
bodyCondition.printCurrentCondition()

let coolingDown: Activity = Activity(name: .dynamicRest) { bodyCondition in
    bodyCondition.performActivity(.dynamicRest)
}

coolingDown.action(bodyCondition)
bodyCondition.printCurrentCondition()

let doingYoga: Activity = Activity(name: .yoga) { bodyCondition in
    bodyCondition.performActivity(.yoga)
}

doingYoga.action(bodyCondition)
bodyCondition.printCurrentCondition()
