//
//  ViewController.swift
//  Animate
//
//  Created by Michael Stromer on 8/12/14.
//  Copyright (c) 2014 Michael Stromer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let container = UIView()
    let redSquare = UIView()
    let blueSquare = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.container.frame = CGRectMake(10, 60, 300, 300)
        self.view.addSubview(container)
        
        self.redSquare.frame = CGRectMake(0, 0, 300, 300)
        self.blueSquare.frame = redSquare.frame
        
        self.redSquare.backgroundColor = UIColor.redColor()
        self.blueSquare.backgroundColor = UIColor.blueColor()
        
        self.container.addSubview(redSquare)
        
}
    @IBAction func animateButton(sender: AnyObject) {
        
        let size : CGFloat = CGFloat( Int(rand()) % 40 + 20.0)
        let yPosition : CGFloat = CGFloat( Int(rand()) % 200 + 20.0)
        //set position
        let coloredSquare = UIView()
        coloredSquare.backgroundColor = UIColor.blueColor()
        coloredSquare.frame = CGRectMake(0, yPosition, size, size)
        self.view.addSubview(coloredSquare)
        
        let duration = 1.0
        let delay = 0.0
        let options = UIViewAnimationOptions.CurveLinear
        UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
            coloredSquare.backgroundColor = UIColor.redColor()
            coloredSquare.frame = CGRectMake(320-size, yPosition, size, size)}, completion: {
                animationFinished in coloredSquare.removeFromSuperview()
            })
    }
    @IBAction func animateNotes(sender: AnyObject) {
        // create a 'tuple' (a pair or more of objects assigned to a single variable)
        let views = (frontView: self.redSquare, backView: self.blueSquare)
        
        // set a transition style
        let transitionOptions = UIViewAnimationOptions.TransitionCurlUp
        
        UIView.transitionWithView(self.container, duration: 1.0, options: transitionOptions, animations: {
            // remove the front object...
            views.frontView.removeFromSuperview()
            
            // ... and add the other object
            self.container.addSubview(views.backView)
            
            }, completion: { finished in
                // any code entered here will be applied
                // .once the animation has completed
        })
    }
    @IBOutlet var textView: UITextView!
    // textView stories
}