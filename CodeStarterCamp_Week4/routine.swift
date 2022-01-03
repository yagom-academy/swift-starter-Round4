//
//  routine.swift
//  CodeStarterCamp_Week4
//
//  Created by song on 2021/12/29.
//

import Foundation

struct Routine {
    let name: String
    let excercises = [윗몸일으키기,윗몸일으키기,동적휴식,스쿼트,스쿼트,동적휴식,오래달리기,오래달리기]
    
    func start() {
        print("--------------")
        print("\(name)을 시작합니다.")
        excercises.forEach { exercise in
            print(exercise.name)
            exercise.action()
            
        }
    }
}
