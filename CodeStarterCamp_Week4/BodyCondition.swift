//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by 이지원 on 2023/06/09.
//

import Foundation

final class BodyCondition {
    private var upperBodyStrength: Int {
        didSet {
            print("상체 근력이 \(upperBodyStrength - oldValue) 상승합니다.")
        }
    }
    private var lowerBodyStrength: Int {
        didSet {
            print("하체 근력이 \(lowerBodyStrength - oldValue) 상승합니다.")
        }
    }
    private var muscularEndurance: Int {
        didSet {
            print("지구력이 \(muscularEndurance - oldValue) 상승합니다.")
        }
    }
    private var fatigueLevel: Int {
        didSet {
            if fatigueLevel > oldValue {
                print("피로도가 \(fatigueLevel - oldValue) 상승합니다.")
            } else {
                print("피로도가 \(oldValue - fatigueLevel) 하락합니다.")
            }
        }
    }
    
    func showMyBodyCondition() {
        print("--------------")
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(upperBodyStrength)")
        print("하체근력: \(lowerBodyStrength)")
        print("근지구력: \(muscularEndurance)")
        print("피로도: \(fatigueLevel)")
        print("--------------")
    }
    
    func increaseUpperBodyCondition(by strength: Int) {
        self.upperBodyStrength += strength
    }
    
    func increaseLowerBodyCondition(by strength: Int) {
        self.lowerBodyStrength += strength
    }
    
    func increaseMuscularEduranceCondition(by strength: Int) {
        self.muscularEndurance += strength
    }
    
    func increaseFatigueLevel(by strength: Int) {
        self.fatigueLevel += strength
    }
    
    
    func updateBodyCondition(upperBodyStrength: Int? = nil,
                             lowerBodyStrength: Int? = nil,
                             muscularEdurance: Int? = nil,
                             fatigueLevel: Int? = nil) {
        if let upperBodyStrength {
            self.upperBodyStrength += upperBodyStrength
        }
        if let lowerBodyStrength {
            self.lowerBodyStrength += lowerBodyStrength
        }
        if let muscularEdurance {
            self.muscularEndurance += muscularEdurance
        }
        if let fatigueLevel {
            self.fatigueLevel += fatigueLevel
        }
        
        showMyBodyCondition()
    }
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigueLevel: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigueLevel = fatigueLevel
    }
}
