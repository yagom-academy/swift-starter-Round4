//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by Chaeeun Shin on 3/8/24.
//

struct Routine {
    let name: String
    let activities: [Activity]
    
    init(name: String) {
        self.name = name
        self.activities = Exercise.allCases.map{ Activity(exercise: $0) }.shuffled()
    }
    
    func runRoutine(times count: Int, with condition: BodyCondition) throws {        
        for i in 1...count {
            print("\(i) 번째 \(self.name)(을/를) 시작합니다")
            
            for activity in activities {
                activity.takeExercise(with: condition)
                
                if condition.fatigue > 100 {
                    throw RoutineError.exceedingFatigue
                }
            }
        }
    }
}
