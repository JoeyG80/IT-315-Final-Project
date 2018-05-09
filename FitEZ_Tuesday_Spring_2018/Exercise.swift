//
//  Exercise.swift
//  FitEZ_Tuesday_Spring_2018
//
//  Created by Don Almeida on 4/3/18.
//  Copyright © 2018 Almeida Org. All rights reserved.
//

import Foundation
class Exercise {
    var ExerciseCategory:String = ""
    var ExerciseName:String = ""
    var ExerciseInstructions:String = ""
    var ExerciseImageName:String = ""
    var ExerciseID:Int32 = 0
    var ExerciseURL:String = ""
    
    init(exCategory:String, exName:String, exInstruction:String) {
        ExerciseName = exName
        ExerciseCategory = exCategory
        ExerciseInstructions = exInstruction
    }
}






