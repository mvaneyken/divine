//
//  Question.swift
//  Devine
//
//  Created by Marc van Eyken on 2016-04-10.
//  Copyright © 2016 MVE Solutiions Inc. All rights reserved.
//

import Foundation

class Question {
    var id: Int
    var sequence: Int
    var phrase: String
    var code: String
    
    init() {
        self.id = 0
        self.sequence = 0
        self.phrase = String()
        self.code = String()
    }
    
    init(id: Int, sequence: Int, phrase: String, code: String) {
        self.id = id
        self.sequence = sequence
        self.phrase = phrase
        self.code = code
    }
}
