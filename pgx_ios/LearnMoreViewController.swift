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
    
    @IBAction func CPICButtonClick(_ sender: AnyObject) {
        openURL(urlStr: "https://cpicpgx.org")
    }
    @IBAction func PharmGKBClicked(_ sender: AnyObject) {
        openURL(urlStr: "https://pharmgkb.org")
    }
    @IBAction func PGRNClicked(_ sender: AnyObject) {
        openURL(urlStr: "https://pgrn.org")
    }
    @IBAction func G2C2Clicked(_ sender: AnyObject) {
        openURL(urlStr: "https://genomicseducation.net")
    }
    @IBAction func IgniteClicked(_ sender: AnyObject) {
        openURL(urlStr: "https://ignite-genomics.org")
    }
    @IBAction func GenelexClicked(_ sender: AnyObject) {
        openURL(urlStr: "https://www.genelex.com")
    }
    @IBAction func GenesightClicked(_ sender: AnyObject) {
        openURL(urlStr: "https://genesight.com")
    }
    @IBAction func OneomeClicked(_ sender: AnyObject) {
        openURL(urlStr: "https://oneome.com")
    }
    @IBAction func YouScriptClicked(_ sender: AnyObject) {
        openURL(urlStr: "https://youscript.com")
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
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        switch restorationIdentifier {
        case "intro1"?:
            self.performSegue(withIdentifier: "toIntro2", sender: nextButton)
            break
        case "intro2"?:
            self.performSegue(withIdentifier: "toIntro3", sender: nextButton)
            break
        case "intro3"?:
            self.performSegue(withIdentifier: "toIntro4", sender: nextButton)
            break
        case "intro4"?:
            self.performSegue(withIdentifier: "toLearn1", sender: nextButton)
            break
        case "learn1"?:
            self.performSegue(withIdentifier: "toLearn2", sender: nextButton)
            break
        case "learn2"?:
            self.performSegue(withIdentifier: "toLearn3", sender: nextButton)
            break
        case "learn3"?:
            self.performSegue(withIdentifier: "toLearn4", sender: nextButton)
            break
        case "learn4"?:
            self.performSegue(withIdentifier: "toLearn5", sender: nextButton)
            break
        case "learn5"?:
            self.performSegue(withIdentifier: "toLearn6", sender: nextButton)
            break
        case "learn6"?:
            self.performSegue(withIdentifier: "toLearn7", sender: nextButton)
            break
        case "learn7"?:
            self.performSegue(withIdentifier: "toLearn8", sender: nextButton)
            break
        case "learn8"?:
            self.performSegue(withIdentifier: "toLearn9", sender: nextButton)
            break
        case "learn9"?:
            self.performSegue(withIdentifier: "backToGetStarted", sender: nextButton)
            break
        default:
            break
        }
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        switch restorationIdentifier {
        case "intro1"?:
            self.performSegue(withIdentifier: "backToGetStarted", sender: backButton)
            break
        case "intro2"?:
            self.performSegue(withIdentifier: "backToIntro1", sender: backButton)
            break
        case "intro3"?:
            self.performSegue(withIdentifier: "backToIntro2", sender: backButton)
            break
        case "intro4"?:
            self.performSegue(withIdentifier: "backToIntro3", sender: backButton)
            break
        case "learn1"?:
            self.performSegue(withIdentifier: "backToIntro4", sender: backButton)
            break
        case "learn2"?:
            self.performSegue(withIdentifier: "backToLearn1", sender: backButton)
            break
        case "learn3"?:
            self.performSegue(withIdentifier: "backToLearn2", sender: backButton)
            break
        case "learn4"?:
            self.performSegue(withIdentifier: "backToLearn3", sender: backButton)
            break
        case "learn5"?:
            self.performSegue(withIdentifier: "backToLearn4", sender: backButton)
            break
        case "learn6"?:
            self.performSegue(withIdentifier: "backToLearn5", sender: backButton)
            break
        case "learn7"?:
            self.performSegue(withIdentifier: "backToLearn6", sender: backButton)
            break
        case "learn8"?:
            self.performSegue(withIdentifier: "backToLearn7", sender: backButton)
            break
        case "learn9"?:
            self.performSegue(withIdentifier: "backToLearn8", sender: backButton)
            break
        default:
            break
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
            case "learn9"?:
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



