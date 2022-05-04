import Foundation

struct Exercise {
    let name: String
    let action: () -> Void
}

let sitUP = Exercise(name: "윗몸일으키기",action: {
    player.upperBodyStrength += Int.random(in: 10...20)
    player.tiredness += Int.random(in: 10...20)
})
let Squatting = Exercise(name: "스쿼트",action: {
    player.lowerBodyStrength += Int.random(in: 20...30)
    player.tiredness += Int.random(in: 10...20)
})
let longRun = Exercise(name: "오래달리기",action: {
    player.muscleEndurance += Int.random(in: 20...30)
    player.upperBodyStrength += Int.random(in: 5...10)
    player.lowerBodyStrength += Int.random(in: 5...10)
    player.tiredness += Int.random(in: 20...30)
})
let activeRest = Exercise(name: "동적휴식",action: {
    player.tiredness -= Int.random(in: 5...10)
})
