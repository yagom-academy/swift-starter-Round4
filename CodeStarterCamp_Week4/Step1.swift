//
//  Step1.swift
//  CodeStarterCamp_Week4
//
//  Created by Daehoon Lee on 2023/03/13.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int = 100 {
        didSet(oldValue) {
            print("상체근력이 \(upperBodyStrength - oldValue) 상승합니다.")
        }
    }
    var lowerBodyStrength: Int = 80 {
        didSet(oldValue) {
            print("하체근력이 \(lowerBodyStrength - oldValue) 상승합니다.")
        }
    }
    var muscularEndurance: Int = 80 {
        didSet(oldValue) {
            print("근지구력이 \(muscularEndurance - oldValue) 상승합니다.")
        }
    }
    var fatigability: Int = 0 {
        didSet(oldValue) {
            if fatigability >= oldValue {
                print("피로도가 \(fatigability - oldValue) 상승합니다.")
            } else {
                print("피로도가 \(oldValue - fatigability) 감소합니다.")
            }
        }
    }
    
    func printMeasuredBodyCondition() {
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(self.upperBodyStrength)")
        print("하체근력: \(self.lowerBodyStrength)")
        print("근지구력: \(self.muscularEndurance)")
        print("피로도: \(self.fatigability)")
        print("--------------")
    }
}

struct Activity {
    var name: String
    let action: (BodyCondition) -> Void
}
