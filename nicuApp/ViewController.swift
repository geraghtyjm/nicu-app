//
//  ViewController.swift
//  nicuApp
//
//  Created by Matt Gannon on 9/24/17.
//  Copyright © 2017 Matt Gannon. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timerLabel.text = String(counter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var playButton: UIBarButtonItem!;
    
    @IBOutlet weak var pauseButton: UIBarButtonItem!;
    
    @IBOutlet weak var refreshButton: UIBarButtonItem!;

    @IBOutlet weak var timerLabel: UILabel!
    
    var timer = Timer();
    var counter = 0;
    //var TIME_INCREMENT = 3600;
    
    @IBAction func playButton(sender: AnyObject) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true);
    }
    
    func updateCounter() {
        counter+=1;
        self.timerLabel.text = String(counter);
        print(counter)
    }
    
    @IBAction func pauseButton(sender: AnyObject) {
        timer.invalidate();
    }
    
    @IBAction func refreshButton(sender: AnyObject) {
        timer.invalidate();
        counter = 0;
        timerLabel.text = String(counter);
    }
    
    
}
