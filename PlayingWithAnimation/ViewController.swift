//
//  ViewController.swift
//  PlayingWithAnimation
//
//  Created by Kenneth Wilcox on 3/26/16.
//  Copyright © 2016 Kenneth Wilcox. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tap: UIButton!
    var imageView: UIImageView!
    var currentAnimation = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView = UIImageView(image: UIImage(named: "penguin"))
        imageView.center = view.center
        view.addSubview(imageView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapped(sender: AnyObject) {
        tap.hidden = true
        
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: { 
            [unowned self] in
            switch self.currentAnimation {
            case 0:
                self.imageView.transform = CGAffineTransformMakeScale(2, 2)
            case 1:
                self.imageView.transform = CGAffineTransformIdentity
            case 2:
                self.imageView.transform = CGAffineTransformMakeTranslation(-256, -256)
            case 3:
                self.imageView.transform = CGAffineTransformIdentity
            case 4:
                self.imageView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
            case 5:
                self.imageView.transform = CGAffineTransformIdentity
            case 6:
                self.imageView.alpha = 0.1
                self.imageView.backgroundColor = UIColor.greenColor()
            case 7:
                self.imageView.alpha = 1
                self.imageView.backgroundColor = UIColor.clearColor()
            default:
                break
            }
        }) { [unowned self] (finished: Bool) in
                self.tap.hidden = false
        }
        
        currentAnimation = (currentAnimation + 1 ) % 8
        print(currentAnimation)
    }
    
}

