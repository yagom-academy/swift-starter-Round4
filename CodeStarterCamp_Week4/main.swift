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
var routine = Routine(name: "hellRoutine", activities: [sitUps, activeRest, squat])
routine.startRoutine(bodyCondition: &bodyCondition)
