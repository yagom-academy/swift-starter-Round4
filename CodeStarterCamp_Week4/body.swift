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
        --------------
        현재의 컨디션은 다음과 같습니다.
        상체근력: \(upperBodyStrength)
        하체근력: \(lowerBodyStrength)
        근지구력: \(muscularEndurance)
        피로도: \(fatigability)
        --------------
        """
        )
    }
}

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}


let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기", action: { BodyCondition -> Void in
    let upperBodyCount = Int.random(in: 10...20)
    let fatigabilityCount = Int.random(in: 10...20)
    BodyCondition.upperBodyStrength += upperBodyCount
    BodyCondition.fatigability += fatigabilityCount
    print(
    """
    <<\(윗몸일으키기.name)을(를) 시작합니다.>>
    상체근력이 \(upperBodyCount)만큼 상승합니다.
    피로도가 \(fatigabilityCount)만큼 상승합니다.
    """
    )
    BodyCondition.conditionCheck()
})

let 스쿼트: Activity = Activity(name: "스쿼트", action: { BodyCondition -> Void in
    let lowerBodyCount = Int.random(in: 20...30)
    let fatigabilityCount = Int.random(in: 10...20)
    BodyCondition.lowerBodyStrength += lowerBodyCount
    BodyCondition.fatigability += fatigabilityCount
    print(
    """
    <<\(스쿼트.name)을(를) 시작합니다.>>
    하체근력이 \(lowerBodyCount)만큼 상승합니다.
    피로도가 \(fatigabilityCount)만큼 상승합니다.
    """
    )
    BodyCondition.conditionCheck()
})

let 오래달리기: Activity = Activity(name: "오래달리기", action: { BodyCondition -> Void in
    let upperBodyCount = Int.random(in: 5...10)
    let lowerBodyCount = Int.random(in: 5...10)
    let muscularEnduranceCount = Int.random(in: 20...30)
    let fatigabilityCount = Int.random(in: 20...30)
    BodyCondition.upperBodyStrength += upperBodyCount
    BodyCondition.lowerBodyStrength += lowerBodyCount
    BodyCondition.muscularEndurance += muscularEnduranceCount
    BodyCondition.fatigability += fatigabilityCount
    print(
    """
    <<\(오래달리기.name)을(를) 시작합니다.>>
    상체근력이 \(upperBodyCount)만큼 상승합니다.
    하체근력이 \(lowerBodyCount)만큼 상승합니다.
    근지구력이 \(muscularEnduranceCount)만큼 상승합니다.
    피로도가 \(fatigabilityCount)만큼 상승합니다.
    """
    )
    BodyCondition.conditionCheck()
})

let 동적휴식: Activity = Activity(name: "동적휴식", action: { BodyCondition -> Void in
    let fatigabilityCount = Int.random(in: 5...10)
    BodyCondition.fatigability -= fatigabilityCount
    print(
    """
    <<\(동적휴식.name)을(를) 시작합니다.>>
    피로도가 \(fatigabilityCount)만큼 줄어듭니다.
    """
    )
    BodyCondition.conditionCheck()
})

