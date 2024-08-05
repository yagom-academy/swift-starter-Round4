import Foundation

struct Activity {
    var name: String
    var action: (BodyCondition) -> Void
    
    func startExercise(_ bodyCondition: BodyCondition) {
        print(MagicNumber.blankPage)
        print("<<\(name)을(를) 시작합니다>>")
        action(bodyCondition)
    }
}

let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
    bodyCondition.상체근력 += Int.random(in: Intensity.midiumExercise)
    bodyCondition.피로도 += Int.random(in: Intensity.midiumExercise)
})

let 스쿼트: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    bodyCondition.하체근력 += Int.random(in: Intensity.hardExercise)
    bodyCondition.피로도 += Int.random(in: Intensity.midiumExercise)
})

let 오래달리기: Activity = Activity(name: "오래달리기", action: { bodyCondition in
    bodyCondition.근지구력 += Int.random(in: Intensity.hardExercise)
    bodyCondition.상체근력 += Int.random(in: Intensity.softExercise)
    bodyCondition.하체근력 += Int.random(in: Intensity.softExercise)
    bodyCondition.피로도 += Int.random(in: Intensity.softExercise)
})

let 동적휴식: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    bodyCondition.피로도 += -Int.random(in: Intensity.midiumExercise)
    bodyCondition.근지구력 += -Int.random(in: Intensity.softExercise)
    bodyCondition.상체근력 += -Int.random(in: Intensity.softExercise)
    bodyCondition.하체근력 += -Int.random(in: Intensity.softExercise)
})
