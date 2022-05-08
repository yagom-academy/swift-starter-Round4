//
//  Exercise.swift
//  CodeStarterCamp_Week4
//
//  Created by 정선아 on 2022/05/08.
//

import Foundation

struct Exercise {
        let name: String
        var action: () -> Void

}

// 상체운동
let sitUp = Exercise(name: "윗몸일으키기", action: {
    person.upperBodyStrength += Int.random(in: 10...20)
    person.fatigue += Int.random(in: 10...20)
})

let deadLift = Exercise(name: "데드리프트", action: {
    person.upperBodyStrength += Int.random(in: 10...20)
    person.lowerBodyStrength += Int.random(in: 5...10)
})

let plank = Exercise(name: "플랭크", action: {
    person.upperBodyStrength += Int.random(in: 10...20)
})

let barbellRow = Exercise(name: "바벨로우", action: {
    person.upperBodyStrength += Int.random(in: 10...20)
})

let cablePullover = Exercise(name: "케이블 풀오버", action: {
    person.upperBodyStrength += Int.random(in: 10...20)
})

// 하체운동
let squat = Exercise(name: "스쿼트", action: {
    person.lowerBodyStrength += Int.random(in: 20...30)
    person.fatigue += Int.random(in: 10...20)
})

let lunge = Exercise(name: "런지", action: {
    person.lowerBodyStrength += Int.random(in: 20...30)
    person.muscularEndurance += Int.random(in: 10...15)
})

let legExtension = Exercise(name: "레그 익스텐션", action: {
    person.lowerBodyStrength += Int.random(in: 20...30)
})

// 유산소운동
let longRun = Exercise(name: "오래달리기", action: {
    person.muscularEndurance += Int.random(in: 20...30)
    person.upperBodyStrength += Int.random(in: 5...10)
    person.lowerBodyStrength += Int.random(in: 5...10)
    person.fatigue += Int.random(in: 20...30)
})

// 동적휴식
let activeRest = Exercise(name: "동적휴식", action: {
    person.fatigue -= Int.random(in: 5...10)
})
