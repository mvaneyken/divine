//
//  ScriptViewController.swift
//  divine
//
//  Created by Marc van Eyken on 2016-04-10.
//  Copyright © 2016 MVE Solutiions Inc. All rights reserved.
//

import UIKit

class ScriptViewController: UIViewController {
    var script = Script()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        script.loadDatabase()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

