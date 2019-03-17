//
//  LearnMoreViewController.swift
//  pgx_ios
//
//  Created by James Gray on 12/20/17.
//  Copyright © 2017 Tabor Scott. All rights reserved.
//

import UIKit

class LearnMoreViewController: UIViewController {
    
    @IBOutlet weak var backButtonToGetStarted: UIBarButtonItem!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBAction func CPICButtonClick(sender: AnyObject) {
        openURL(urlStr: "https://cpicpgx.org")
    }
    @IBAction func PharmGKBClicked(sender: AnyObject) {
        openURL(urlStr: "https://pharmgkb.org")
    }
    @IBAction func PGRNClicked(sender: AnyObject) {
        openURL(urlStr: "https://pgrn.org")
    }
    @IBAction func G2C2Clicked(sender: AnyObject) {
        openURL(urlStr: "https://genomicseducation.net")
    }
    @IBAction func IgniteClicked(sender: AnyObject) {
        openURL(urlStr: "https://ignite-genomics.org")
    }
    func openURL(urlStr:String!) {
        if let url = NSURL(string:urlStr) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let buttonPressed = sender as? UIBarButtonItem {
            switch restorationIdentifier {
            case "intro1"?:
                if buttonPressed == nextButton {
                    performSegue(withIdentifier: "toIntro2", sender: nextButton)
                }
                else {
                    performSegue(withIdentifier: "backToGetStarted", sender: backButton)
                }
                break
            case "intro2"?:
                if buttonPressed == nextButton {
                    performSegue(withIdentifier: "toIntro3", sender: nextButton)
                }
                else {
                    performSegue(withIdentifier: "backToIntro1", sender: backButton)
                }
                break
            case "intro3"?:
                if buttonPressed == nextButton {
                    performSegue(withIdentifier: "toIntro4", sender: nextButton)
                }
                else {
                    performSegue(withIdentifier: "backToIntro2", sender: backButton)
                }
                break
            case "intro4"?:
                if buttonPressed == nextButton {
                    performSegue(withIdentifier: "toLearn1", sender: nextButton)
                }
                else {
                    performSegue(withIdentifier: "backToIntro3", sender: backButton)
                }
                break
            case "learn1"?:
                if buttonPressed == nextButton {
                    performSegue(withIdentifier: "toGeneticTest", sender: nextButton)
                }
                else {
                    performSegue(withIdentifier: "backToIntro4", sender: backButton)
                }
                break
            case "learn2"?:
                if buttonPressed == nextButton {
                    performSegue(withIdentifier: "toWhyIndividuals", sender: nextButton)
                }
                else {
                    performSegue(withIdentifier: "toBasicGenetics", sender: backButton)
                }
                break
            case "learn3"?:
                if buttonPressed == nextButton {
                    performSegue(withIdentifier: "toWhyIndividCont", sender: nextButton)
                }
                else {
                    performSegue(withIdentifier: "toGeneticTests", sender: backButton)
                }
                break
            case "learn4"?:
                if buttonPressed == nextButton {
                    performSegue(withIdentifier: "toTypes", sender: nextButton)
                }
                else {
                    performSegue(withIdentifier: "toWhyIndividuals", sender: backButton)
                }
                break
            case "learn5"?:
                if buttonPressed == nextButton {
                    performSegue(withIdentifier: "toParentDrug", sender: nextButton)
                }
                else {
                    performSegue(withIdentifier: "toCont", sender: backButton)
                }
                break
            case "learn6"?:
                if buttonPressed == nextButton {
                    performSegue(withIdentifier: "toEvid", sender: nextButton)
                }
                else {
                    performSegue(withIdentifier: "toTypes", sender: backButton)
                }
                break
            case "learn7"?:
                if buttonPressed == nextButton {
                    performSegue(withIdentifier: "toEducational", sender: nextButton)
                }
                else {
                    performSegue(withIdentifier: "toParentDrug", sender: backButton)
                }
                break
            case "learn8"?:
                if buttonPressed == backButton {
                    performSegue(withIdentifier: "toEvidence", sender: nextButton)
                }
                else {
                    performSegue(withIdentifier: "backToGetStated", sender: backButton)
                }
                break
            default:
                break
            }
        }
    }
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch restorationIdentifier {
            case "intro1"?:
                switch swipeGesture.direction {
                case UISwipeGestureRecognizer.Direction.up:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizer.Direction.up)
                default:
                    break
                }
            case "intro2"?:
                switch swipeGesture.direction {
                case UISwipeGestureRecognizer.Direction.up:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizer.Direction.up)
                default:
                    break
                }
            case "intro3"?:
                switch swipeGesture.direction {
                case UISwipeGestureRecognizer.Direction.up:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizer.Direction.up)
                default:
                    break
                }
            case "intro4"?:
                switch swipeGesture.direction {
                case UISwipeGestureRecognizer.Direction.up:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizer.Direction.up)
                default:
                    break
                }
            case "learn1"?:
                switch swipeGesture.direction {
                case UISwipeGestureRecognizer.Direction.up:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizer.Direction.up)
                default:
                    break
                }
            case "learn2"?:
                switch swipeGesture.direction {
                case UISwipeGestureRecognizer.Direction.up:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizer.Direction.up)
                default:
                    break
                }
            case "learn3"?:
                switch swipeGesture.direction {
                case UISwipeGestureRecognizer.Direction.up:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizer.Direction.up)
                default:
                    break
                }
            case "learn4"?:
                switch swipeGesture.direction {
                case UISwipeGestureRecognizer.Direction.up:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizer.Direction.up)
                default:
                    break
                }
            case "learn5"?:
                switch swipeGesture.direction {
                case UISwipeGestureRecognizer.Direction.up:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizer.Direction.up)
                default:
                    break
                }
            case "learn6"?:
                switch swipeGesture.direction {
                case UISwipeGestureRecognizer.Direction.up:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizer.Direction.up)
                default:
                    break
                }
            case "learn7"?:
                switch swipeGesture.direction {
                case UISwipeGestureRecognizer.Direction.up:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizer.Direction.up)
                default:
                    break
                }
            case "learn8"?:
                switch swipeGesture.direction {
                case UISwipeGestureRecognizer.Direction.up:
                    performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizer.Direction.up)
                default:
                    break
                }
            default:
                break
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}



