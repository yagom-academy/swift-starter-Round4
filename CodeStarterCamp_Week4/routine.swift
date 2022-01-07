//  CodeStarterCamp_Week4
//
//  Created by song on 2021/12/29.
//

import Foundation

class Routine {
    let name: String
    let upperBodyExcercises = [윗몸일으키기,윗몸일으키기,동적휴식,윗몸일으키기,윗몸일으키기,동적휴식,오래달리기,오래달리기]
    let lowerBodyExcercises = [스쿼트,스쿼트,동적휴식,스쿼트,스쿼트,동적휴식,오래달리기,오래달리기]
    
    init (name:String){
        self.name = name
    }
    enum ExcercisesError : Error {
        
        case fatigueOver
    }
    
    
    func startLowerBodyExcercises() throws {
        
        for exercise in lowerBodyExcercises {
            guard bodyCondition.fatigue < goalsBodyCondition.fatigue else {
                throw ExcercisesError.fatigueOver
            }
            print(exercise.name)
            exercise.action()
        }
        print("--------------")
    }
    
    
    func startUpperBodyExcercises() throws {
        
        for exercise in upperBodyExcercises {
            guard bodyCondition.fatigue < goalsBodyCondition.fatigue else {
                throw ExcercisesError.fatigueOver
            }
            print(exercise.name)
            exercise.action()
        }
        print("--------------")
    }
    
    
    
}

