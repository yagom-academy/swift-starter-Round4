import Foundation

var myBodyCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscleEndurance: 0, fatigue: 0)
let myExcerciseRoutine = [sitUp, sitUp, squat, squat, activeRest, deadLift, deadLift, runningLongTime, runningLongTime, activeRest]
var myRoutine = Routine(name: "My Routine", routineOrder: myExcerciseRoutine)

myRoutine.startRoutine()
myRoutine.printCurrentBodyCondition(with: myBodyCondition)
