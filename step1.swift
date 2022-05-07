//
//  step1.swift
//  CodeStarterCamp_Week4
//
//  Created by Jiyoung Lee on 2022/05/04.
//

import Foundation

struct BodyType {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var musclarEndurance: Int
    var fatigue: Int
}


struct Exercise {
    let name: String
    let action: () -> Void
}

let sitUp: Exercise = Exercise(name: "윗몸일으키기", action: { () -> Void in
    upperBodyStrength += Int.random(in: 10...20)
    fatigue += Int.random(in: 10...20)
})

let squat: Exercise = Exercise(name: "스쿼트", action: { () -> Void in
    lowerBodyStrength += Int.random(in: 20...30)
    fatigue += Int.random(in: 10...20)
    
})

struct Routine {
    var name: String
    var exercises = [Exercise]()
    
    init(name: String) {
        self.name = name
    }
}
