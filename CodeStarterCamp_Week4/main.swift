import Foundation

let hellRoutineExercise = [sitUp, sitUp, squat, squat, activeRest, deadLift, deadLift, runningLongTime, runningLongTime, activeRest]
let ohMyGodRoutineExercise = [sitUp, sitUp, squat, squat, sitUp, sitUp, activeRest, deadLift, deadLift, sitUp, sitUp, runningLongTime, runningLongTime, activeRest]
var hellRoutine = Routine(name: "hellRoutine", routineOrder: hellRoutineExercise)
var ohMyGodRoutine = Routine(name: "ohMyGodRoutine", routineOrder: ohMyGodRoutineExercise)

var yagomfitness = FitnessCenter(name: "yagom", routineList: [hellRoutine, ohMyGodRoutine])

yagomfitness.enrollExercise()
yagomfitness.doExercise()

