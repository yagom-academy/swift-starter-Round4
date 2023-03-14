//
//  Activity.swift
//  CodeStarterCamp_Week4
//
//  Created by eve on 2023/03/13.
//

import Foundation

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
    
    func doExercise(_ condition: BodyCondition) {
        print("<<\(name)을(를) 시작합니다>>")
        action(condition)
        print("--------------")
        condition.checkBody()
    }
}
