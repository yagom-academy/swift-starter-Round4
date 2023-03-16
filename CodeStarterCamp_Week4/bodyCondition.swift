//
//  body.swift
//  CodeStarterCamp_Week4
//
//  Created by minsong kim on 2023/03/13.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int {
        didSet {
            print("상체근력이 \(upperBodyStrength - oldValue) 상승합니다.")
        }
    }
    var lowerBodyStrength: Int {
        didSet {
            print("하체근력이 \(lowerBodyStrength - oldValue) 상승합니다.")
        }
    }
    var muscularEndurance: Int {
        didSet {
            print("근지구력이 \(muscularEndurance - oldValue) 상승합니다.")
        }
    }
    var fatigability: Int {
        didSet {
            if fatigability < 0 {
                fatigability = 0
            } else if fatigability > oldValue {
                print("피로도가 \(fatigability - oldValue) 상승합니다.")
            } else {
                print("피로도가 \(oldValue - fatigability) 하락합니다.")
            }
        }
    }
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigability: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigability = fatigability
    }
    
    func conditionCheck() {
        print(
        """
        현재의 컨디션은 다음과 같습니다.
        상체근력: \(upperBodyStrength)
        하체근력: \(lowerBodyStrength)
        근지구력: \(muscularEndurance)
        피로도: \(fatigability)
        --------------
        """
        )
    }
    
    func fatigabilityCheck() throws {
        guard fatigability > 0 else {
            throw Errors.minusFatigability
        }
        guard fatigability < 100 else {
            throw Errors.maxFatigability
        }
    }
}
