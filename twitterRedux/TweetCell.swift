//
//  TweetCell.swift
//  twitterRedux
//
//  Created by Peter Bohnert on 10/20/14.
//  Copyright (c) 2014 Blue Lotus Labs. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screennameLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    
    var tweet: Tweet? {
        didSet {
            self.profileImageView.setImageWithURL(self.tweet!.user?.profileImageURL)
            self.nameLabel.text = self.tweet!.user.name
            self.screennameLabel.text = "@\(self.tweet!.user.screenName)"
            self.tweetLabel.text = self.tweet!.text
            self.timestampLabel.text = self.tweet!.createdAt.shortTimeAgoSinceNow()
            
            
            self.profileImageView.layer.cornerRadius = 10.0
            self.profileImageView.clipsToBounds = true
            
            self.layoutIfNeeded()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
