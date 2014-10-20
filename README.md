twitterRedux - revised Twitter client with Container View Control
=================
October/November iOS Bootcamp, Codepath.com (observer class)
Original course exercise was to build a full featured Twitter Client.  
This exercise builds upon that adding a custom container VC or Hamburger menu (Slide out panel)

Time spent:  10 hours


--> Original Project User Stories
* [x] User can sign in using OAuth login flow
* [x] User can view last 20 tweets from their home timeline
* [x] The current signed in user will be persisted across restarts
* [x] In the home timeline, user can view tweet with the user profile picture, username, tweet text, and timestamp. In other words, design the custom cell with the proper Auto Layout settings. You will also need to augment the model classes.
* [x] User can pull to refresh
* [x] User can compose a new tweet by tapping on a compose button.
* [partial] User can tap on a tweet to view it, with controls to retweet, favorite, and reply.

--> New Project User Stories
--   Hamburger menu
* [ ] Dragging anywhere in the view should reveal the menu.
* [ ] The menu should include links to your profile, the home timeline, and the mentions view.
--   Profile page
* [ ] Contains the user header view
* [ ] Contains a section with the users basic stats: # tweets, # following, # followers


----> ![GIF demo](twitterDemo.gif)
--> Cocoapods (external libs) used

* [AFNetworking](https://github.com/AFNetworking/AFNetworking)
* [MBProgressHUD] (https://github.com/jdg/MBProgressHUD)
* [TSMessage] (https://github.com/toursprung/TSMessages)
* [BDBOAuth1Manager] (https://github.com/bdbergeron/BDBOAuth1Manager)
ler.
