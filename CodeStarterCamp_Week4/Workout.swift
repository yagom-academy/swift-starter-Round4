//
//  Workout.swift
//  CodeStarterCamp_Week4
//
//  Created by Hyungmin Lee on 2023/03/14.
//

import Foundation

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

struct Workout {
    let 윗몸일으키기 = Activity(name: "윗몸일으키기", action: { bodyCondition in
        bodyCondition.upperBodyStrength += Int.random(in: 10...20)
        bodyCondition.fatigue += Int.random(in: 10...20)
    })

    let 스쿼트 = Activity(name: "스쿼트", action: { bodyCondition in
        bodyCondition.lowerBodyStrength += Int.random(in: 20...30)
        bodyCondition.fatigue += Int.random(in: 10...20)
    })

    let 오래달리기 = Activity(name: "오래달리기", action: { bodyCondition in
        bodyCondition.muscleEndurance += Int.random(in: 20...30)
        bodyCondition.upperBodyStrength += Int.random(in: 5...10)
        bodyCondition.lowerBodyStrength += Int.random(in: 5...10)
        bodyCondition.fatigue += Int.random(in: 20...30)
    })

    let 동적휴식 = Activity(name: "동적휴식", action: { bodyCondition in
        var fatigue = Int.random(in: 5...10)        
        if bodyCondition.fatigue <= fatigue {
            fatigue = bodyCondition.fatigue
        }

        bodyCondition.fatigue -= fatigue
    })
}
