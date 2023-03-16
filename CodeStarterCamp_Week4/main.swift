//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var charles = BodyCondition(upperStrength: 0, lowerStrength: 0, muscularEndurance: 0, fatigability: 0)

let sitUp = Activity(name: "윗몸일으키기") { charles in
    print("<<윗몸일으키기을(를) 시작합니다>>")
    charles.upperStrength += Int.random(in: 10 ... 20)
    charles.fatigability += Int.random(in: 10 ... 20)
    charles.checkCondition()
}


let squat = Activity(name: "스쿼트") { charles in
    print("<<스쿼트을(를) 시작합니다>>")
    charles.lowerStrength += Int.random(in: 20 ... 30)
    charles.fatigability += Int.random(in: 10 ... 20)
    charles.checkCondition()
}

let lognRun = Activity(name: "오래달리기") { charles in
    print("<<오래달리기을(를) 시작합니다>>")
    charles.muscularEndurance += Int.random(in: 20 ... 30)
    charles.upperStrength += Int.random(in: 5 ... 10)
    charles.lowerStrength += Int.random(in: 5 ... 10)
    charles.fatigability += Int.random(in: 20 ... 30)
    charles.checkCondition()
}

let dynamicRestin = Activity(name: "동적휴식") { chalres in
    print("<<동적휴식을(를) 시작합니다>>")
    charles.fatigability -= Int.random(in: 5 ... 10)
    charles.checkCondition()
}


let deadLift = Activity(name: "데드리프트") { charles in
    print("<<데드리프트을(를) 시작합니다>>")
    charles.upperStrength += Int.random(in: 10 ... 20)
    charles.lowerStrength += Int.random(in: 10 ... 20)
    charles.fatigability += Int.random(in: 10 ... 20)
}

let benchPress = Activity(name: "벤치프레스") { charles in
    print("<<벤치프레스을(를) 시작합니다>>")
    charles.upperStrength += Int.random(in: 20 ... 30)
    charles.fatigability += Int.random(in: 20 ... 30)
    charles.checkCondition()
}


sitUp.action(charles)
squat.action(charles)
lognRun.action(charles)
dynamicRestin.action(charles)
