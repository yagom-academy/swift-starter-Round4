//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var mom = BodyCondition(upperBodyStrength: 100, lowerBodyStrength: 110, muscularEndurance: 110, fatigability: 50)
var special = Routine(name: "특별한 운동", activities: [.sitUp, .squat])

var trainer = Manager(member: mom, routine: special)

trainer.setRoutine()
