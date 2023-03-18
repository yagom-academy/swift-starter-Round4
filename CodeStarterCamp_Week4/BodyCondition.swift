//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by Whales on 2023/03/17.
//

import Swift

class BodyCondition {
    var upperBodyMuscleStrength: Int{
        didSet {
            print("상체근력이 \(upperBodyMuscleStrength - oldValue) 상승합니다.")
        }
    }
    var lowerBodyMuscleStrength: Int{
        didSet {
            print("하체근력이 \(lowerBodyMuscleStrength - oldValue) 상승합니다.")
        }
    }
    var muscularEndurance: Int{
        didSet {
            print("근지구력이 \(muscularEndurance - oldValue) 상승합니다.")
        }
    }
    var degreeOfFatigue: Int {
        didSet {
            guard degreeOfFatigue - oldValue >= 0 else {
                print("피로도가 \(oldValue - degreeOfFatigue) 하락합니다.")
                return
            }
            print("피로도가 \(degreeOfFatigue - oldValue) 상승합니다.")
        }
    }
    
    init(upper: Int, lower: Int, muscular: Int, fatigue: Int) {
        self.upperBodyMuscleStrength = upper
        self.lowerBodyMuscleStrength = lower
        self.muscularEndurance = muscular
        self.degreeOfFatigue = fatigue
    }

    func checkBodyCondition () {
        print("""
        ------------------------
        현재의 컨디션은 다음과 같습니다.
        상체근력: \(upperBodyMuscleStrength)
        하체근력: \(lowerBodyMuscleStrength)
        근지구력: \(muscularEndurance)
        피로도: \(degreeOfFatigue)
        ------------------------
        
        """)
    }
}

