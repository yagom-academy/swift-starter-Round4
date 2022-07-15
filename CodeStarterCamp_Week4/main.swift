import Foundation

var sunnyBodyCondition: BodyCondition = BodyCondition(upeerBodyStrength: 100, lowerBodyStrength: 100, muscularEndurance: 100, fatigue: 10)
var hyeokBodyCondition: BodyCondition = BodyCondition(upeerBodyStrength: 200, lowerBodyStrength: 200, muscularEndurance: 200, fatigue: 20)

sunnyBodyCondition = sitUp.action(sunnyBodyCondition)
sunnyBodyCondition = squats.action(sunnyBodyCondition)
sunnyBodyCondition = longRun.action(sunnyBodyCondition)
sunnyBodyCondition = activeRest.action(sunnyBodyCondition)
hyeokBodyCondition = sitUp.action(hyeokBodyCondition)

