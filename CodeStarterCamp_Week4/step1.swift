//
//  step1.swift
//  CodeStarterCamp_Week4
//
//  Created by 한서영 on 2022/07/12.
//

import Foundation

struct BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigue: Int
    
}

struct Activity {
        let name: String
        let action: (BodyCondition) -> Void
}


let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
        //BodyCondition에 영향을 주는 클로저 내용
})
