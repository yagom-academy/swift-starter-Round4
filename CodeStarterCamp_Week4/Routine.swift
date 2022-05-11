//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by mingmac on 2022/05/08.
//

import Foundation

struct Routine {
    let name: String
    var routineArray: Array<Exercise>
 
    func startExercise(with bodyConditon: BodyCondition, overTiredness: Int) throws {
        for exercise in routineArray {
            print("\(exercise.name)")
            exercise.action(bodyConditon)
        }
        if bodyConditon.tiredness > overTiredness {
            throw FitnessCenterError.runAwayMember
        }
    }
}
