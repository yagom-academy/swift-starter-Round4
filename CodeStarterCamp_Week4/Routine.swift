//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by LIMGAUI on 2022/01/04.
//

import Foundation

struct Routine {
    let name: String
    let exercises: [Exercise]
    
    init(name: String, exercises: [Exercise]) {
        self.name = name
        self.exercises = exercises
    }
}

enum Routines {
    case uppperBodyExercise
    case lowerBodyExercise
    case backExercise
    case chestExercise
    case shoulderExercise
    case aerobicExercise
    
    var name: String {
        switch self {
        case .uppperBodyExercise:
            return "상체운동"
        case .lowerBodyExercise:
            return "하체운동"
        case .backExercise:
            return "등운동"
        case .chestExercise:
            return "가슴운동"
        case .shoulderExercise:
            return "어깨운동"
        case .aerobicExercise:
            return "유산소운동"
        }
    }
}
