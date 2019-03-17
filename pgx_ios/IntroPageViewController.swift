//
//  IntroPageViewController.swift
//  pgx_ios
//
//  Created by James Gray on 12/21/17.
//  Copyright © 2017 Tabor Scott. All rights reserved.
//

import UIKit

class IntroPageViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        // Do any additional setup after loading the view.
    }

    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch restorationIdentifier {
            case "intro1"?:
                switch swipeGesture.direction {
                case UISwipeGestureRecognizerDirection.left:
                    performSegue(withIdentifier: "toIntro2", sender: UISwipeGestureRecognizerDirection.left)
                    print("To page 2")
                default:
                    break
                }
            case "intro2"?:
                switch swipeGesture.direction {
                case UISwipeGestureRecognizerDirection.left:
                    performSegue(withIdentifier: "toIntro3", sender: UISwipeGestureRecognizerDirection.left)
                case UISwipeGestureRecognizerDirection.right:
                    performSegue(withIdentifier: "toIntro1", sender: UISwipeGestureRecognizerDirection.right)
                    print("Back to page 1")
                default:
                    break
                }
            case "intro3"?:
                switch swipeGesture.direction {
                case UISwipeGestureRecognizerDirection.left:
                    performSegue(withIdentifier: "toIntro4", sender: UISwipeGestureRecognizerDirection.left)
                case UISwipeGestureRecognizerDirection.right:
                    performSegue(withIdentifier: "toIntro2", sender: UISwipeGestureRecognizerDirection.right)
                    print("Back to page 2")
                default:
                    break
                }
            case "intro4"?:
                switch swipeGesture.direction {
                case UISwipeGestureRecognizerDirection.left:
                    performSegue(withIdentifier: "toGetStarted", sender: UISwipeGestureRecognizerDirection.left)
                    UserDefaults.standard.set(true, forKey: "firstLaunch")
                case UISwipeGestureRecognizerDirection.right:
                    performSegue(withIdentifier: "toIntro3", sender: UISwipeGestureRecognizerDirection.right)
                    print("Back to page 3")
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
