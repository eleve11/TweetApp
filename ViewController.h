//
//  ViewController.h
//  sampleTweet
//
//  Created by Andrea D'Olimpio on 19/12/12.
//  Copyright (c) 2012 eleve11. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Twitter/TWTweetComposeViewController.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic,strong) IBOutlet UIImageView *foto;
@property (nonatomic,strong) IBOutlet UITextField *myTweet;
@property (strong,nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) TWTweetComposeViewController *tweetView;

-(IBAction)tweet;
-(IBAction)selezionaImmagine;
-(IBAction)scattaFoto;
-(IBAction)fuorischermo;

@end