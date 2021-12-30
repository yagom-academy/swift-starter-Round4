//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by Jungmo Yu on 2021/12/30.
//

import Foundation

struct Routine {
    var name: String
    var routine: [Exercise]
    
    func startRoutine() {
        print("--------------")
        print("\(self.name)을 시작합니다.")
        for exercise in self.routine {
            exercise.action()
            print(exercise.name)
        }
        print("--------------")
        printPhysicalCondition()
    }
    
    func printPhysicalCondition() {
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력 : \(myBodyCondition.upperBodyStrength)")
        print("하체근력 : \(myBodyCondition.lowerBodyStrength)")
        print("근지구력 : \(myBodyCondition.muscularEndurance)")
        print("피로도 : \(myBodyCondition.fatigue)")
    }
}
