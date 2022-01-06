import Foundation

let hellRoutine = Routine(name: "hellRoutine", exerciseArray: [running, squat, pushUp, lunge, dumbbellPress, running, activeRest])
let ohMyGodRoutine = Routine(name: "ohMyGodRoutine", exerciseArray: [running, deadlift, benchPress, squat, dumbbellPress, running, activeRest])
var yagomPT = FitnessCenter()
var mmim = Person(name: "mmim", myFitnesscenter: yagomPT)
var tacoCat = Person(name: "tacoCat", myFitnesscenter: yagomPT)
yagomPT.members.append(mmim)
yagomPT.routineList.append(hellRoutine)
yagomPT.routineList.append(ohMyGodRoutine)
yagomPT.startExcercise()
mmim.exercise(for: inputSetFromReadline, routine: selectRoutineFromReadline)
