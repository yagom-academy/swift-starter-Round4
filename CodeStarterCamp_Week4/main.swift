import Foundation

let player = BodyCondtion()
let exercises = [sitUP, sitUP, activeRest, squat, squat, activeRest, longRun, longRun]
let hellRoutine = Routine(name: "hellRoutine", exercises: exercises)

hellRoutine.start()
player.checkCondition()
