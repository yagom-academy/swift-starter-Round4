//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by Jungmo Yu on 2021/12/31.
//

import Foundation


class Routine {
    var name: String
    var routine: [Exercise]
    
    init(name: String = "", routine: [Exercise]) {
        self.name = name
        self.routine = routine
    }

    func startRoutine() {
        for exercise in self.routine {
            exercise.action()
            print(exercise.name)
        }
    }
    
}
