//
//  SidePanelViewController.swift
//  twitterRedux
//
//  Created by Peter Bohnert on 10/20/14.
//  Copyright (c) 2014 Blue Lotus Labs. All rights reserved.
//

import UIKit


class SidePanelViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screennameLabel: UILabel!
    
    var panelDelegate: PanelDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initProfileView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initProfileView() {
        if (User.currentUser != nil) {
            var user = User.currentUser
            self.profileImageView.setImageWithURL(user!.profileImageURL)
            self.profileImageView.layer.borderWidth = 2.0
            self.profileImageView.layer.cornerRadius = 10.0
            self.profileImageView.clipsToBounds = true
            
            self.nameLabel.text = user!.name
            self.screennameLabel.text = "@\(user!.screenName)"
        }
    }
    
    @IBAction func tapHome(sender: UITapGestureRecognizer) {
        panelDelegate.showMyTimeline()
    }
    
    @IBAction func tapProfileView(sender: UITapGestureRecognizer) {
        panelDelegate.showMyProfile()
    }
    
    @IBAction func onSignout(sender: UITapGestureRecognizer) {
        User.currentUser?.logout()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
