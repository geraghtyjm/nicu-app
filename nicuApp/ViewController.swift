//
//  ViewController.swift
//  nicuApp
//
//  Created by Matt Gannon on 9/24/17.
//  Copyright © 2017 Matt Gannon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Timer view
    @IBOutlet weak var playButton: UIBarButtonItem!;
    @IBOutlet weak var pauseButton: UIBarButtonItem!;
    @IBOutlet weak var refreshButton: UIBarButtonItem!;
    @IBOutlet weak var timerLabel: UILabel!
    
    var counter = 0
    var timer = Timer()
    var isTimerRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pauseButton.isEnabled = false
        
        basicView.isHidden = false;
        cardiacView.isHidden = true;
        specialView.isHidden = true;
        assessView.isHidden = true;
        medView.isHidden = true;
        procView.isHidden = true;
        
    }
    
    @IBAction func playButton(sender: AnyObject) {
        if isTimerRunning == false {
            runTimer()
        }
    }
    
    @IBAction func pauseButton(sender: AnyObject) {
        createAlert(title: "PAUSE", message: "Resume session or save and exit");
    }
    
    
    //Alert on pause
    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert);
        alert.addAction(UIAlertAction(title: "Resume", style: UIAlertActionStyle.default, handler: { (action) in alert.dismiss(animated: true, completion: nil);
            self.runTimer();
        }));
        
        alert.addAction(UIAlertAction(title: "Save & Quit", style: UIAlertActionStyle.default, handler: { (action) in alert.dismiss(animated: true, completion: nil)
        }));

        
        self.present(alert, animated: true, completion: nil);
        
    }
    
    @IBAction func refreshButton(sender: AnyObject) {
        timer.invalidate();
        counter = 0;
        timerLabel.text = String(counter);
    }
    
    @objc func updateCounter() {
        counter = counter + 1
        timerLabel.text = timeString(time: TimeInterval(counter))
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateCounter)), userInfo: nil, repeats: true)
        isTimerRunning = true
        pauseButton.isEnabled = true
    }

    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Tabs view
    @IBOutlet weak var basicButton: UIBarButtonItem!
    @IBOutlet weak var cardiacButton: UIBarButtonItem!
    @IBOutlet weak var medButton: UIBarButtonItem!
    @IBOutlet weak var assessButton: UIBarButtonItem!
    @IBOutlet weak var specialButton: UIBarButtonItem!
    @IBOutlet weak var procButton: UIBarButtonItem!
    
    
    @IBOutlet weak var basicView: UIView!
    @IBOutlet weak var cardiacView: UIView!
    @IBOutlet weak var medView: UIView!
    @IBOutlet weak var assessView: UIView!
    @IBOutlet weak var specialView: UIView!
    @IBOutlet weak var procView: UIView!
    
    func hideAll (view: UIView) {
        cardiacView.isHidden = true;
        specialView.isHidden = true;
        assessView.isHidden = true;
        medView.isHidden = true;
        procView.isHidden = true;
        basicView.isHidden = true;
        
        print("view is hidden: ", view.isHidden);
        view.isHidden = false;
        print("view is hidden: ", view.isHidden);
    }
    
    @IBAction func basicButton(sender: AnyObject) {
        print("Basic button press");
        hideAll(view: basicView);
    }
    
    @IBAction func cardiacButton(sender: AnyObject) {
        print("Cardiac button press");
        hideAll(view: cardiacView);
    }
    
    @IBAction func medButton(sender: AnyObject) {
        print("Medication button press");
        hideAll(view: medView);
    }
    
    @IBAction func assessButton(sender: AnyObject) {
        print("Assessment button press");
        hideAll(view: assessView);
    }
    
    @IBAction func specialButton(sender: AnyObject) {
        print("Special button press");
        hideAll(view: specialView);
    }
    
    @IBAction func procView(sender: AnyObject) {
        print("Procedure button press");
        hideAll(view: procView);
    }
    
    
    
    
    
    
    
    
    
}
