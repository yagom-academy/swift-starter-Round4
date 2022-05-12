import Foundation

let hellRoutineExercise = [sitUp, sitUp, squat, squat, activeRest, deadLift, deadLift, runningLongTime, runningLongTime, activeRest]
let ohohMyGodRoutineExercise = [sitUp, sitUp, squat, squat, sitUp, sitUp, activeRest, deadLift, deadLift, sitUp, sitUp, runningLongTime, runningLongTime, activeRest]
var hellRoutine = Routine(name: "hellRoutine", routineOrder: hellRoutineExercise)
var ohMyGodRoutine = Routine(name: "ohMyGodRoutine", routineOrder: ohohMyGodRoutineExercise)

var yagomFitness = FitnessCenter(name: "Yagom", routineList: [hellRoutine, ohMyGodRoutine])
yagomFitness.startExercise()
