//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by Seong A Oh on 2022/05/06.
//

import Foundation

class BodyCondition {
    var name: String
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigue: Int
    
    init(name: String, upperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigue: Int) {
        self.name = name
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
    
    func exercise(routine: Routine) {
        print("\(self.name)님이 \(routine.name)을 시작합니다.")
        print("--------------")
        routine.exercises.forEach {
            $0.action(self)
            print($0.name)
        }
        currentCondition()
    }
    
    private func currentCondition() {
        print("""
                  --------------
                  현재의 컨디션은 다음과 같습니다.
                  상체근력: \(self.upperBodyStrength)
                  하체근력: \(self.lowerBodyStrength)
                  근지구력: \(self.muscularEndurance)
                  피로도: \(self.fatigue)
                  """)
    }
}
