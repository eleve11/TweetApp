//
//  ViewController.m
//  sampleTweet
//
//  Created by Andrea D'Olimpio on 19/12/12.
//  Copyright (c) 2012 eleve11. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

@synthesize foto,tweetView,textView,myTweet;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.textView = [[TWTweetComposeViewController alloc]init];
    
    TWTweetComposeViewControllerCompletionHandler completamento = ^(TWTweetComposeViewControllerResult result) {
        switch (result) {
            case TWTweetComposeViewControllerResultCancelled:
                NSLog(@"operazione cancellata");
                break;
                
            case TWTweetComposeViewControllerResultDone:
                NSLog(@"tweet inviato");
                break;
        }
        [self dismissViewControllerAnimated:YES ];
    };
    
    [self.tweetView setCompletionHandler:completamento];
}

-(void)selezionaImmagine {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
        UIImagePickerController *picker0 = [[UIImagePickerController aloc] init];
        [picker0 setDelegate:self];
        [picker0 setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [picker0 setMediaTypes:[NSArray arrayWithObjects:(NSString *)kUTTypeImage, nil]];
        [picker0 setAllowsEditing:NO];
        [self presentModalViewController:picker0 animated:YES];
    }
}



-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSString *tipo = [info objectForKey:UIImagePickerControllerMediaType];
    [self dismissModalViewControllerAnimated:YES];
    if ([tipo isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *immagine = [info objectForKey:UIImagePickerControllerOriginalImage];
        self.foto.image = immagine;
    }
    
}

-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissModalViewControllerAnimated:YES];
}

-(void) fuorischermo {
    [textView resignFirstResponder];
    [myTweet resignFirstResponder];
}

-(void) tweet {
    if ([TWTweetComposeViewController canSendTweet]) {
        NSLog(@"invio abilitato");
    }else {
        NSLog(@"invio disabiitato");
    }
    
    NSURL *url [[NSURL alloc]initWithString:self.myTweet.text];
    [self.tweetView removeAllURLs];
    [self.tweetView removeAllImages];
    
    [self.tweetView addImage:self.foto.image];
    [self.tweetView setInitialText:self.textView.text];
    [self.tweetView addURL:url];
    
    [self presentModalViewController:self.tweetView animated:YES];
}

-(void) viewDidUnload
{
    [super viewDidUnload];
    self.tweetView = nil;
    self.textView = nil;
    self.myTweet = nil;
    self.foto = nil;
}

@end