import Foundation

var myInitialBodyCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscleEndurance: 0, fatigue: 0)
let myExerciseRoutine = [sitUp, sitUp, squat, squat, activeRest, deadLift, deadLift, runningLongTime, runningLongTime, activeRest]
var myRoutine = Routine(name: "My Routine", routineOrder: myExerciseRoutine)

myRoutine.startRoutine()
myRoutine.printCurrentBodyCondition(with: myInitialBodyCondition)
