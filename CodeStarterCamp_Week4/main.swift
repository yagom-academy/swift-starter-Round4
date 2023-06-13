//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var bodyCondition: BodyCondition  = BodyCondition()
//checkBodyCondition(activityName: TypesOfActivity.sitUps.description, bodyCondition: &bodyCondition)
var routine = Routine(name: "테스트", activities: [sitUps, activeRest, squat])
routine.startRoutine(bodyCondition: &bodyCondition)
