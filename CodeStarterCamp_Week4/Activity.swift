//
//  Activity.swift
//  CodeStarterCamp_Week4
//
//  Created by 김형철 on 2023/03/15.
//

import Foundation


struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
    
    
    func doExercise(with condition: BodyCondition) {
        print("<<\(self.name)을(를) 시작합니다>>")
        self.action(condition)
    }
}
