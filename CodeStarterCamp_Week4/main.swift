//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BodyCondition {
    var 상체근력: Int
    var 하체근력: Int
    var 근지구력: Int
    var 피로도: Int
    
    init(상체근력: Int, 하체근력: Int, 근지구력: Int, 피로도: Int) {
        self.상체근력 = 상체근력
        self.하체근력 = 하체근력
        self.근지구력 = 근지구력
        self.피로도 = 피로도
    }
}

struct Exercise {
    let name: String
    let action: (BodyCondition) -> Void
}

let 윗몸일으키기: Exercise = Exercise(name: "윗몸일으키기", action: { person in
    person.상체근력 += Int.random(in: 10...20)
    person.피로도 += Int.random(in: 10...20)
})

let 스쿼트: Exercise = Exercise(name: "스쿼트", action: { person in
    person.하체근력 += Int.random(in: 20...30)
    person.피로도 += Int.random(in: 10...20)
})

let 오래달리기: Exercise = Exercise(name: "오래달리기", action: { person in
    person.근지구력 += Int.random(in: 20...30)
    person.상체근력 += Int.random(in: 5...10)
    person.하체근력 += Int.random(in: 5...10)
    person.피로도 += Int.random(in: 20...30)
})

let 동적휴식: Exercise = Exercise(name: "동적휴식", action: { person in
    person.피로도 -= Int.random(in: 5...10)
})

struct Routine {
    let name: String
    let exercises: [Exercise]
    
    func start(_ person: BodyCondition) {
        print("""
              --------------
              \(name)을 시작합니다.
              """)
        
        var exercises = exercises
        
        while exercises.count > 0 {
            if let nameOfExercise = exercises.first?.name {
                print(nameOfExercise)
            }
            exercises.first?.action(person)
            exercises.removeFirst()
        }
        
        printPresentCondition(person)
    }
}

func printPresentCondition(_ person: BodyCondition) {
    print("""
          --------------
          현재의 컨디션은 다음과 같습니다.
          상체근력: \(person.상체근력)
          하체근력: \(person.하체근력)
          근지구력: \(person.근지구력)
          피로도: \(person.피로도)
          """)
}

let misterLee: BodyCondition = BodyCondition(상체근력: 0, 하체근력: 0, 근지구력: 0, 피로도: 0)
let missKim: BodyCondition = BodyCondition(상체근력: 0, 하체근력: 0, 근지구력: 0, 피로도: 0)
let hellRoutine: Routine = Routine(name: "hellRoutine", exercises: [윗몸일으키기, 윗몸일으키기, 동적휴식, 스쿼트, 스쿼트, 동적휴식, 오래달리기, 오래달리기])

hellRoutine.start(misterLee)
hellRoutine.start(missKim)
