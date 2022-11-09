//
//  Activity.swift
//  CodeStarterCamp_Week4
//
//  Created by ByungHoon Ann on 2022/11/08.
//

import Foundation

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
    
    func startExercise() {
        print("<<\(name)을(를) 시작합니다>>")
    }
}
