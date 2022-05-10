//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let sitUp = Exercise(name: "윗몸일으키기") { person in
    person.growthMuscles(bodyPart: .upperBody,
                      overLimitValue: 10,
                      underLimitValue: 20)
    person.manageFatigue(overLimitValue: 10,
                         underLimitValue: 20,
                         restOfTraining: .training)
}

let squat = Exercise(name: "스쿼트") { person in
    person.growthMuscles(bodyPart: .lowerBody,
                      overLimitValue: 20,
                      underLimitValue: 30)
    person.manageFatigue(overLimitValue: 10,
                         underLimitValue: 20,
                         restOfTraining: .training)
}

let longRun = Exercise(name: "오래달리기") { person in
    person.growthMuscles(bodyPart: .muscularEndurance,
                      overLimitValue: 20,
                      underLimitValue: 30)
    
    person.growthMuscles(bodyPart: .lowerBody,
                      overLimitValue: 5,
                      underLimitValue: 10)
    
    person.growthMuscles(bodyPart: .upperBody,
                      overLimitValue: 5,
                      underLimitValue: 10)
    
    person.manageFatigue(overLimitValue: 20,
                         underLimitValue: 30,
                         restOfTraining: .training)
}

let dynamicalRest = Exercise(name: "동적휴식") { person in
    person.manageFatigue(overLimitValue: 30,
                         underLimitValue: 50,
                         restOfTraining: .rest)
}

let pushUp = Exercise(name: "푸시업") { person in
    person.growthMuscles(bodyPart: .upperBody,
                      overLimitValue: 10,
                      underLimitValue: 20)
    
    person.manageFatigue(overLimitValue: 10,
                         underLimitValue: 20,
                         restOfTraining: .training)
    
    person.growthMuscles(bodyPart: .muscularEndurance,
                      overLimitValue: 10,
                      underLimitValue: 15)
}

let helloRoutine = Routine(name: "helloRoutine",
                           exercises: [sitUp, sitUp, dynamicalRest, squat, squat, dynamicalRest, longRun, longRun, dynamicalRest, pushUp, pushUp])

let ohMyGodRoutine = Routine(name: "ohMyGodRoutine",
                             exercises: [sitUp, sitUp, dynamicalRest, dynamicalRest, dynamicalRest, squat, squat, dynamicalRest, dynamicalRest, pushUp, pushUp, pushUp, dynamicalRest, dynamicalRest, dynamicalRest])

var bodyCondition: BodyCondition = BodyCondition(upperBody: 0,
                                                 lowerBody: 0,
                                                 muscularEndurance: 0,
                                                 fatigue: 0)

var fitnessCenter: FitnessCenter = FitnessCenter(goalBodyCondition: bodyCondition,
                                                 fitnessGuest: nil, routine: [helloRoutine, ohMyGodRoutine])

fitnessCenter.run()

