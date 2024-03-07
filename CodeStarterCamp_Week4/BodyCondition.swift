//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by 이지은 on 3/7/24.
//

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
    var fatigue: Int {
        didSet {
            if fatigue - oldValue >= 0 {
                print("피로도가 \(fatigue - oldValue) 상승합니다.")
            }
            else {
                print("피로도가 \(oldValue - fatigue) 하락합니다.")
            }
        }
    }
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
    
    func showCondition() {
        print("""
                --------------
                현재의 컨디션은 다음과 같습니다.
                상체근력: \(upperBodyStrength)
                하체근력: \(lowerBodyStrength)
                근지구력: \(muscularEndurance)
                피로도: \(fatigue)
                --------------\n
                """)
    }
}
