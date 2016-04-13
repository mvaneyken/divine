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
    
    func dbPath() -> String {
        return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
    }
    
    func toDatabase() {
        let path = dbPath()
        let db = try! Connection("\(path)/db.sqllite3")
        let scripts = Table("scripts")
        let id = Expression<Int64>("id")
        let sequence = Expression<Int64>("sequence")
        let phrase = Expression<String?>("phrase")
        let code = Expression<String?>("code")

        if questions.count > 0 {
            try! db.run(scripts.drop(ifExists: true))
            try! db.run(scripts.create { t in
                t.column(id, primaryKey: true)
                t.column(sequence)
                t.column(phrase)
                t.column(code)
                })

            for question in questions {
                let insert = scripts.insert(id <- question.id, sequence <- question.sequence, phrase <- question.phrase, code <- question.code)
                try! db.run(insert)
            }
            print("A scripts \(db.scalar(scripts.count))")
        }
    }
    
    func loadDatabase() {
        let path = dbPath()
        let db = try! Connection("\(path)/db.sqllite3")
        let scripts = Table("scripts")
        let id = Expression<Int64>("id")
        let sequence = Expression<Int64>("sequence")
        let phrase = Expression<String?>("phrase")
        let code = Expression<String?>("code")
        let query = try! db.prepare(scripts)
        for row in query {
            let question = Question(id: row[id], sequence: row[sequence], phrase: row[phrase]!, code: row[code]!)
            addQuestion(question)
        }
    }

}