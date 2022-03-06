//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let randomNum: (Int, Int) -> Int
randomNum = { (from: Int, to: Int) -> Int in
    return Int.random(in: from...to)
}
