//
//  Activity.swift
//  CodeStarterCamp_Week4
//
//  Created by Lee minyeol on 2023/06/14.
//

import Foundation

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let situp: Activity = Activity(name: "윗몸일으키기", action: { BodyCondition in
    BodyCondition.upperBodyMuscle += Random.tenToTwenty.value;executeAction(condition: .upperBodyMuscle, energy: true, random: .tenToTwenty)
    BodyCondition.fatigue += Random.tenToTwenty.value; executeAction(condition: .fatigue, energy: true, random: .tenToTwenty)
})

let squat: Activity = Activity(name: "스쿼트", action: { BodyCondition in
    BodyCondition.lowerBodyMuscle += Random.tenToTwenty.value
    BodyCondition.fatigue += Random.tenToTwenty.value
})

let longrun: Activity = Activity(name: "오래달리기", action: { BodyCondition in
    BodyCondition.muscularEndurance += Random.tenToTwenty.value; executeAction(condition: .muscularEndurance, energy: true, random: .tenToTwenty)
    BodyCondition.upperBodyMuscle += Random.fiveToTen.value; executeAction(condition: .upperBodyMuscle, energy: true, random: .fiveToTen)
    BodyCondition.lowerBodyMuscle += Random.fiveToTen.value; executeAction(condition: .lowerBodyMuscle, energy: true, random: .fiveToTen)
    BodyCondition.fatigue += Random.tenToTwenty.value; executeAction(condition: .fatigue, energy: true, random: .tenToTwenty)
})

let activerest: Activity = Activity(name: "동적휴식", action: { BodyCondition in
    BodyCondition.fatigue -= Random.fiveToTen.value; executeAction(condition: .fatigue, energy: false, random: .fiveToTen)
})
