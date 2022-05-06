//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by JAEHYEON on 2022/05/05.
//

import Foundation

struct Routine {
    var name: String
    var exercises: [Exercise] = []
    
    func startRoutine(_ exercises: [Exercise]) {
        print("""
    --------------
    \(self.name)을 시작합니다.
    """)
        
        for exercise in exercises {
            print(exercise.name)
            exercise.action()
        }
        printBodyCondition(myBodyCondition)
    }
    
    func printBodyCondition(_ body: BodyCondition) {
        print("""
    --------------
    현재의 컨디션은 다음과 같습니다.
    상체근력: \(body.upperBodyStrength)
    하체근력: \(body.lowerBodyStrength)
    근지구력: \(body.muscularEndurance)
    피로도: \(body.fatigueLevel)
    """)
    }
}
