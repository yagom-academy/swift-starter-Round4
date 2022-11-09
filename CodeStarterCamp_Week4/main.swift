//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


let bodyCondition = BodyCondition(fatigue: 100)

func startActivity(exercise: Exercise,
                   condition: BodyCondition) {
    let activity = Activity(name: exercise.rawValue) { bodyCondition in
        bodyCondition.upperBodyStrength += exercise.upperMuscleStrength
        bodyCondition.muscularEndurance += exercise.muscularEndurance
        bodyCondition.lowerBodyStrength += exercise.lowerMuscleStrength
        bodyCondition.fatigue += exercise.fatigue
    }
    
    activity.startExercise()
    activity.action(condition)
}
 
startActivity(exercise: .sitUp, condition: bodyCondition)
startActivity(exercise: .squat, condition: bodyCondition)
startActivity(exercise: .longRun, condition: bodyCondition)
startActivity(exercise: .dynamicBreak, condition: bodyCondition)

bodyCondition.printCondition()
