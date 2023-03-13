//
//  body.swift
//  CodeStarterCamp_Week4
//
//  Created by minsong kim on 2023/03/13.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigability: Int
    
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
        """
        )
    }
}

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
    self.upperBodyStrength += random(in: (10...20))
    self.fatigability += random(in: 10...20)
    print(
    """
    <<\(Activity.name)을(를) 시작합니다.>>
    상체근력이 상승합니다.
    피로도가 상승합니다.
    """
    )
})



