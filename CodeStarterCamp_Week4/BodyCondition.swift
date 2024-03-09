//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by Jay Shin on 3/7/24.
//

class BodyCondition {
    var upperMuscleStrength: Int {
        didSet {
            print("상체근력이 \(upperMuscleStrength - oldValue) 상승합니다.")
        }
    }
    var lowerMuscleStrength: Int {
        didSet {
            print("하체근력이 \(lowerMuscleStrength - oldValue) 상승합니다.")
        }
    }
    var muscularEndurance: Int {
        didSet {
            print("근지구력이 \(muscularEndurance - oldValue) 상승합니다.")
        }
    }
    var fatigue: Int {
        didSet {
            if fatigue >= oldValue {
                print("피로도가 \(fatigue - oldValue) 상승합니다.")
            } else {
                print("피로도가 \(oldValue - fatigue) 감소합니다.")
            }
        }
    }
    
    init(upperMuscleStrength: Int, lowerMuscleStrength: Int, muscularEndurance: Int, fatigue: Int) {
        self.upperMuscleStrength = upperMuscleStrength
        self.lowerMuscleStrength = lowerMuscleStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
    
    func checkBodyCondition() {
        print("""
              ----------
              현재의 컨디션은 다음과 같습니다.
              상체근력: \(myBodyCondition.upperMuscleStrength)
              하체근력: \(myBodyCondition.lowerMuscleStrength)
              근지구력: \(myBodyCondition.muscularEndurance)
              피로도: \(myBodyCondition.fatigue)
              ----------
              """)
    }
}
