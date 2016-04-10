//
//  Script.swift
//  divine
//
//  Created by Marc van Eyken on 2016-04-10.
//  Copyright © 2016 MVE Solutiions Inc. All rights reserved.
//

import Foundation

class Script {
    var scripts = [Question]()
    
    func addQuestion(question: Question) {
        scripts.append(question)
    }
}