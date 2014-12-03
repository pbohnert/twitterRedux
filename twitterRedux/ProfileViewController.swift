//
//  ProfileViewController.swift
//  twitterRedux
//
//  Created by Peter Bohnert on 12/2/14.
//  Copyright (c) 2014 Blue Lotus Labs. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var user: User!
    
    override func viewDidLoad() {
        if (self.user == nil) {
            self.user = User.currentUser
        }
        
        super.viewDidLoad()
        //self.setData()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func setData() {
//        if (user.bannerImageUrl != nil) {
 //           self.bannerImageView.setImageWithURL(user.bannerImageUrl)
 //       } else {
 //           self.bannerImageView.backgroundColor = UIColor.grayColor()
 //       }
 //       self.profileImageView.setImageWithURL(user.profileImageUrl)
 //       self.profileImageView.layer.borderWidth = 3.0
 //       self.profileImageView.layer.borderColor = UIColor.whiteColor().CGColor
 //       self.profileImageView.layer.cornerRadius = 10.0
 //       self.profileImageView.clipsToBounds = true
 //       self.view.bringSubviewToFront(self.profileImageView)
 //
 //       self.nameLabel.text = user.name
 //       self.screenNameLabel.text = "@\(user.screenName)"
 //       self.tagLineLabel.text = user.tagLine
 // /      self.locationLabel.text = user.location
 //       if (user.url != nil) {
 //           self.urlLabel.text = user.url
  //          self.urlLabel.hidden = false
  //      }
  //      self.followingCountLabel.text = "\(user.followingCount)"
  //      self.followersCountLabel.text = "\(user.followersCount)"
  //      self.tweetsCountLabel.text = "\(user.tweetsCount)"
  //  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
