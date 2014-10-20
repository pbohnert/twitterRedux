//
//  ContainerViewController.swift
//  twitterRedux
//
//  Created by Peter Bohnert on 10/20/14.
//  Copyright (c) 2014 Blue Lotus Labs. All rights reserved.
//

import UIKit
import QuartzCore

enum SlideOutState {
    case Collapsed
    case LeftPanelExpanded
}

class ContainerViewController: UIViewController, CenterViewControllerDelegate, UIGestureRecognizerDelegate {
    var leftViewController: SidePanelViewController!
    var loginController: LoginViewController!
    var centerViewController: UINavigationController!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "userDidLogin", name: userDidLoginNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "userDidLogout", name: userDidLogoutNotification, object: nil)

        // first set up left panel
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.leftViewController = storyboard.instantiateViewControllerWithIdentifier("SidePanelViewController") as SidePanelViewController
        addChildViewController(self.leftViewController)
        self.menuView.addSubview(self.leftViewController.view)
        self.leftViewController.view.frame = self.view.frame
        self.leftViewController.didMoveToParentViewController(self)
        self.leftViewController.delegate = self
        
        if (User.currentUser != nil) {
            self.centerViewController = storyboard.instantiateViewControllerWithIdentifier("TweetsNavigationViewController") as UINavigationController
            self.addChildViewController(self.centerViewController)
            self.contentView.addSubview(self.centerViewController.view)
            self.centerViewController.view.frame = self.view.frame
            self.centerViewController.didMoveToParentViewController(self)
        } else {
            self.loginController = storyboard.instantiateViewControllerWithIdentifier("LoginViewController") as LoginViewController
            addChildViewController(self.loginController)
            self.contentView.addSubview(self.loginController.view)
            self.loginController.view.frame = self.view.frame
            self.loginController.didMoveToParentViewController(self)
            
        }
        self.view.bringSubviewToFront(self.contentView)
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

   
    
    
    var currentState: SlideOutState = .Collapsed {
        didSet {
            let shouldShowShadow = currentState != .Collapsed
            showShadowForCenterViewController(shouldShowShadow)
        }
    }
    
    func userDidLogin() {
        //self.setTweetsControllerInContentView()
        //self.slideMenuController.setData()
        
        if (self.centerViewController == nil) {
            var storyboard = UIStoryboard(name: "Main", bundle: nil)
            self.centerViewController = storyboard.instantiateViewControllerWithIdentifier("TweetsNavigationViewController") as UINavigationController
            self.addChildViewController(self.centerViewController)
        }
        
        view.addSubview(self.centerViewController.view)
        self.centerViewController.view.frame = self.view.frame
        self.centerViewController.didMoveToParentViewController(self)
    }
    
    func userDidLogout() {
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.loginController = storyboard.instantiateViewControllerWithIdentifier("LoginViewController") as LoginViewController
        addChildViewController(self.loginController)
       // self.contentView.addSubview(self.loginController.view)
       // self.loginController.view.frame = self.view.frame
        self.loginController.didMoveToParentViewController(self)
    }
    
    

    
    // MARK: Gesture recognizer
    
    func handlePanGesture(recognizer: UIPanGestureRecognizer) {
        let gestureIsDraggingFromLeftToRight = (recognizer.velocityInView(view).x > 0)
        
        switch(recognizer.state) {
        case .Began:
            if (currentState == .Collapsed) {
                if (gestureIsDraggingFromLeftToRight) {
          ///// //   addLeftPanelViewController()
                }
                showShadowForCenterViewController(true)
            }
        case .Changed:
            recognizer.view!.center.x = recognizer.view!.center.x + recognizer.translationInView(view).x
            recognizer.setTranslation(CGPointZero, inView: view)
        case .Ended:
            if (leftViewController != nil) {
                // animate the side panel open or closed based on whether the view has moved more or less than halfway
                let hasMovedGreaterThanHalfway = recognizer.view!.center.x > view.bounds.size.width
    ////  //      animateLeftPanel(shouldExpand: hasMovedGreaterThanHalfway)
            }
        default:
            break
        }
    }
    
    func showShadowForCenterViewController(shouldShowShadow: Bool) {
        if (shouldShowShadow) {
            centerViewController.view.layer.shadowOpacity = 0.8
        } else {
            centerViewController.view.layer.shadowOpacity = 0.0
        }
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

