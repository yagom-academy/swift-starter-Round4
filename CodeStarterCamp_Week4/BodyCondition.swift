//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by 김형철 on 2023/03/15.
//

import Foundation


class BodyCondition {
    var upperStrength: Int  {
        didSet {
            print("상체근력이 \(upperStrength - oldValue)만큼 상승했습니다.")
        }
    }
    var lowerStrength: Int  {
        didSet {
            print("하체근력이 \(lowerStrength - oldValue)만큼 상승했습니다.")
        }
    }
    var muscularEndurance: Int  {
        didSet {
            print("근지구력이 \(muscularEndurance - oldValue)만큼 상승했습니다.")
        }
    }
    var fatigability: Int  {
        didSet {
            if fatigability - oldValue < 0 {
                print("피로도가 \(oldValue - fatigability)만큼 하락했습니다.")
            } else {
                print("피로도가 \(fatigability - oldValue)만큼 상승했습니다.")
            }
        }
    }
    
    init(upperStrength: Int, lowerStrength: Int, muscularEndurance: Int, fatigability: Int) {
        self.upperStrength = upperStrength
        self.lowerStrength = lowerStrength
        self.muscularEndurance = muscularEndurance
        self.fatigability = fatigability
    }
    
    func checkCondition() {
        print("""
        --------------
        현재의 컨디션은 다음과 같습니다.
        상체근력: \(upperStrength)
        하체근력: \(lowerStrength)
        근지구력: \(muscularEndurance)
        피로도: \(fatigability)
        --------------
        """)
    }
}
