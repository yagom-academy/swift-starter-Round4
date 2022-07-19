//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var kiwoongsBody = BodyCondition(upperBodyMuscleStrength: 20, lowerBodyMuscleStrength: 10, muscularEndurance: 25, fatigue: 10)

sitUp.action(kiwoongsBody)
pushup.action(kiwoongsBody)
rest.action(kiwoongsBody)
checkBodyCondition(bodyCondition: kiwoongsBody)
