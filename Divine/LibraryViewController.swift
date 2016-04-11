//
//  LibraryViewController.swift
//  divine
//
//  Created by Marc van Eyken on 2016-04-10.
//  Copyright © 2016 MVE Solutiions Inc. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LibraryViewController: UIViewController {
    // Litterals
    let kLibraryURL = "libraryURL"
    var script = Script()

    @IBOutlet weak var libraryURL: UITextField!
    @IBOutlet weak var getScript: UIButton!
    
    @IBAction func libraryURL(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(libraryURL.text, forKey: kLibraryURL)
    }
    
    @IBAction func getScript(sender: AnyObject) {
        let url: String = libraryURL.text! + "/api/scripts"
        let question = Question()
        Alamofire.request(.GET, url)
            .responseJSON { response in
                for (_, row) in JSON(response.result.value!) {
                    question.id = row["id"].intValue
                    question.sequence = row["sequence"].intValue
                    question.phrase = row["phrase"].string!
                    question.code = row["code"].string!              }
                    self.script.addQuestion(question)
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getDefaults()
    }

    override func viewDidDisappear(animated: Bool) {
        script.toDatabase()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getDefaults() {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let _: String = defaults.stringForKey(kLibraryURL) {
            libraryURL.text = defaults.stringForKey(kLibraryURL)
        } else {
            libraryURL.text = ""
        }
    }

    func displayMessage(message: String) {
        let alertView = UIAlertController(title: "divine Grief", message: message, preferredStyle: .Alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        presentViewController(alertView, animated: true, completion: nil)
    }
    
}

