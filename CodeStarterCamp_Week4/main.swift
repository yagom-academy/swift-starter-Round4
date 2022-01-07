var vennie = BodyCondition()


let 윗몸일으키기 = Exercise(name: "윗몸일으키기", action: {
    vennie.upperBodyStrength += randomIntBetween(10, 20)
    vennie.fatigue += randomIntBetween(10, 20)
})

let 스쿼트 = Exercise(name: "스쿼트", action: {
    vennie.lowerBodyStrength += randomIntBetween(20, 30)
    vennie.fatigue += randomIntBetween(10, 20)
})

let 오래달리기 = Exercise(name: "오래달리기", action: {
    vennie.upperBodyStrength += randomIntBetween(5, 10)
    vennie.lowerBodyStrength += randomIntBetween(5, 10)
    vennie.muscularEndurance += randomIntBetween(20, 30)
    vennie.fatigue += randomIntBetween(20, 30)
})

let 동적휴식 = Exercise(name: "동적휴식", action: {
    vennie.fatigue -= randomIntBetween(5, 10)
    if vennie.fatigue < 0 {
        vennie.fatigue = 0
    }
})

let routine = Routine(name: "vennie's Routine", person: vennie, routines: [스쿼트, 윗몸일으키기, 스쿼트, 오래달리기, 동적휴식, 스쿼트, 윗몸일으키기, 오래달리기, 동적휴식])
routine.start()
