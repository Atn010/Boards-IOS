//
//  ViewController.swift
//  Money Board
//
//  Created by Antonius George on 08/05/18.
//  Copyright © 2018 Apple Developer Academy @ Binus. All rights reserved.
//

import UIKit

class SplashPageVC: UIViewController {
    
    let Data = DataStore.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onClick(_ sender: UIButton) {
        
        
        performSegue(withIdentifier: "toMainBoard", sender: self)
    }
    
    


}

