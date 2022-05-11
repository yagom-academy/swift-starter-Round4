//
//  InputManager.swift
//  CodeStarterCamp_Week4
//
//  Created by 김인호 on 2022/05/11.
//

import Foundation

struct InputManager {
    func changeInputToInt() throws -> Int {
        guard let input = readLine(), let convertedInput = Int(input) else {
            throw FitnessError.wrongInput
        }
        return convertedInput
    }
}
