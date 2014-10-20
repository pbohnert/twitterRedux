//
//  NewTweetViewController.swift
//  twitterRedux
//
//  Created by Peter Bohnert on 10/20/14.
//  Copyright (c) 2014 Blue Lotus Labs. All rights reserved.
//

import UIKit

class NewTweetViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var textViewField: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var user = User.currentUser
        
        self.profileImageView.setImageWithURL(user!.profileImageURL)
        self.profileImageView.layer.cornerRadius = 10.0
        self.profileImageView.clipsToBounds = true
        self.nameLabel.text = user!.name
        self.screenNameLabel.text = "@\(user!.screenName)"
        
        self.textViewField.delegate = self
        TSMessage.setDefaultViewController(self)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func postNewTweet(sender: AnyObject) {
        TwitterClient.sharedInstance.postTweetWithCompletion(self.textViewField.text, replyId: nil) { (tweet, error) -> Void in
            if (tweet != nil) {
                self.navigationController?.popViewControllerAnimated(true)
            } else {
                println(error)
                TSMessage.showNotificationWithTitle("Error posting tweet", type: TSMessageNotificationType.Error)
            }
            
        }
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
