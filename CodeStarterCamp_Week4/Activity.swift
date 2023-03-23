//
//  File.swift
//  CodeStarterCamp_Week4
//
//  Created by redmango1446 on 2023/03/18.
//

import Foundation

struct Activity {
    let name: String
    let action: (Person) -> Void
}

let sitUp: Activity = Activity(name: "윗몸일으키기", action: { person in
    person.changeStats(by: sitUp.name)
})

let squats: Activity = Activity(name: "스쿼트", action: { person in
    person.changeStats(by: squats.name)
})

let longRun: Activity = Activity(name: "오래달리기", action: { person in
    person.changeStats(by: longRun.name)
})

let stretching: Activity = Activity(name: "동적휴식", action: { person in
    person.changeStats(by: stretching.name)
})
