//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by LIMGAUI on 2022/01/04.
//

import Foundation

struct BodyCondition {
    var uppperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigue: Int
    
    init(uppperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigue: Int) {
        self.uppperBodyStrength = uppperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }

    func checkCurrentBodyCondition() {
        print("--------------")
        print("현재의 컨디션은 다음과 같습니다.")
        print("\(InBody.uppperBodyStrength.name): \(self.uppperBodyStrength)")
        print("\(InBody.lowerBodyStrength.name): \(self.lowerBodyStrength)")
        print("\(InBody.muscularEndurance.name): \(self.muscularEndurance)")
        print("\(InBody.fatigue.name): \(self.fatigue)")
    }
}

enum InBody {
    case uppperBodyStrength
    case lowerBodyStrength
    case muscularEndurance
    case fatigue
    
    var name: String {
        switch self {
        case .uppperBodyStrength:
            return "상체근력"
        case .lowerBodyStrength:
            return "하체근력"
        case .muscularEndurance:
            return "근지구력"
        case .fatigue:
            return "피로도"
        }
    }
}
