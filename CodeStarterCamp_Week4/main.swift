import Foundation

let sunnyBodyCondition: BodyCondition = BodyCondition(upeerBodyStrength: 100, lowerBodyStrength: 100, muscularEndurance: 100, fatigue: 40)

let weightTrainingRoutine: Routine = Routine(routineName: "근력운동", routineOrder: [sitUp, squats, activeRest])

doRoutine(weightTrainingRoutine, for: sunnyBodyCondition)
