//
//  StatsViewController.swift
//  Todo App
//
//  Created by Kelly Hong on 10/12/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    
    var counter = 0

    @IBOutlet weak var stat: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // counter
        let detailviewcontroller: DetailViewController = DetailViewController()
        let x = detailviewcontroller.counter
        let xString = String(x)
        stat.text = xString

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateCounter() {
        counter += 1
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
