//
//  Script.swift
//  divine
//
//  Created by Marc van Eyken on 2016-04-10.
//  Copyright © 2016 MVE Solutiions Inc. All rights reserved.
//

import Foundation
import SQLite

class Script {
    var questions = [Question]()
    
    func addQuestion(question: Question) {
        questions.append(question)
    }
    
    func toDatabase() {
        do {
            let db = try  Connection("path/do/db.sqllite3")
        } catch _ {
            let db = nil
        }
        let stripts = Table("scripts")
        let id = Expression<Int64>("id")
        let sequence = Expression<Int64>("sequence")
        let phrase = Expression<String?>("phrase")
        let code = Expression<String?>("code")
        
        try db.run(scripts.create { t in
            t.column(id, PrimaryKey: true)
            t.column(sequence)
            t.column(phrase)
            t.column(code)
            })
        
        // Clear the database
        // ...
        
        for question in questions {
            let insert = scripts.insert(id <- question.id, sequence <- question.sequence, phrase <- question.phrase, code <- question.code)
            let
        }
        
    }

}