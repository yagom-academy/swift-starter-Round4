import Foundation

var sunnyBodyCondition: BodyCondition = BodyCondition(upeerBodyStrength: 100, lowerBodyStrength: 100, muscularEndurance: 100, fatigue: 10)
var hyeokBodyCondition: BodyCondition = BodyCondition(upeerBodyStrength: 200, lowerBodyStrength: 200, muscularEndurance: 200, fatigue: 20)

sitUp.action(sunnyBodyCondition)
squats.action(sunnyBodyCondition)
longRun.action(sunnyBodyCondition)
activeRest.action(sunnyBodyCondition)
sitUp.action(hyeokBodyCondition)

