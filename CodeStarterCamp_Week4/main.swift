var vennie = BodyCondition()

let sitUp = Exercise(name: "윗몸일으키기") {
    $0.upperBodyStrength += $0.randomIntBetween(10, 20)
    $0.fatigue += $0.randomIntBetween(10, 20)
}

let squat = Exercise(name: "스쿼트") {
    $0.lowerBodyStrength += $0.randomIntBetween(20, 30)
    $0.fatigue += $0.randomIntBetween(10, 20)
}

let running = Exercise(name: "오래달리기") {
    $0.upperBodyStrength += $0.randomIntBetween(5, 10)
    $0.lowerBodyStrength += $0.randomIntBetween(5, 10)
    $0.muscularEndurance += $0.randomIntBetween(20, 30)
    $0.fatigue += $0.randomIntBetween(20, 30)
}

let activeRest = Exercise(name: "동적휴식") {
    $0.fatigue -= $0.randomIntBetween(5, 10)
    if $0.fatigue < 0 {
        $0.fatigue = 0
    }
}

let routine = Routine(name: "vennie's Routine", person: vennie, routines: [squat,sitUp, squat, running, activeRest, squat, sitUp, running, activeRest])
routine.start()
