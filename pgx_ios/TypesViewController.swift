//
//  TypesViewController.swift
//  pgx_ios
//
//  Created by James Gray on 12/20/17.
//  Copyright © 2017 Tabor Scott. All rights reserved.
//

import UIKit

class TypesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                performSegue(withIdentifier: "toCont", sender: UISwipeGestureRecognizerDirection.right)
            case UISwipeGestureRecognizerDirection.down:
                performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.down)
                print("Swiped down")
            case UISwipeGestureRecognizerDirection.left:
                performSegue(withIdentifier: "toParentDrug", sender: UISwipeGestureRecognizerDirection.left)
                print("Swiped left")
            case UISwipeGestureRecognizerDirection.up:
                performSegue(withIdentifier: "backToGetStarted", sender: UISwipeGestureRecognizerDirection.up)
                print("Swiped up")
            default:
                break
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
