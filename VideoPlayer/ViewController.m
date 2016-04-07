//
//  ViewController.m
//  VideoPlayer
//
//  Created by Arafat on 06/04/2016.
//  Copyright © 2016 Arafat Khan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   // NSURL *movieURL = [[NSBundle mainBundle]URLForResource:@"small1" withExtension:@"mp4"];
    NSString * url = @"http://techslides.com/demos/sample-videos/small.mp4";
    //NSString * url = @"https://github.com/versluis/Movie-Player/blob/master/Movie%20Player/video.mov?raw=true";
   //NSURL *movieURL = [NSURL fileURLWithPath:url];
    NSURL *movieURL = [NSURL URLWithString:url];
//
//    
//    // create an AVPlayer
//    AVPlayer *player = [AVPlayer playerWithURL:movieURL];
//    
//    // create a player view controller
//    AVPlayerViewController *controller = [[AVPlayerViewController alloc]init];
//    controller.player = player;
//    
//    
//    // show the view controller
//    //[self addChildViewController:controller];
//    [controller.view setFrame:self.view.frame];
//    [self.view addSubview:controller.view];
//    [player play];
    
    
    // First create an AVPlayerItem
    AVPlayerItem* playerItem = [AVPlayerItem playerItemWithURL:movieURL];
    
    // Subscribe to the AVPlayerItem's DidPlayToEndTime notification.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didFinishPlaying:) name:AVPlayerItemDidPlayToEndTimeNotification object:playerItem];
    
    // Pass the AVPlayerItem to a new player
    AVPlayer* player = [[AVPlayer alloc] initWithPlayerItem:playerItem];

    
    // create an AVPlayer
    //AVPlayer *player = [AVPlayer playerWithURL:movieURL];
    
    
    // create a player view controller
    AVPlayerViewController *controller = [[AVPlayerViewController alloc]init];
    controller.player = player;
    player.allowsExternalPlayback = YES;
    [player play];
    controller.delegate = self;
    
    // show the view controller
    [self addChildViewController:controller];
    [self.view addSubview:controller.view];
    controller.view.frame = self.view.frame;
}


-(void)didFinishPlaying:(NSNotification *) notification {
    // Will be called when AVPlayer finishes playing playerItem
    
    NSLog(@"finish");
}

- (void)playerViewControllerWillStartPictureInPicture:(AVPlayerViewController *)playerViewController{
    
    NSLog(@"playerViewControllerWillStartPictureInPicture");
}

- (void)playerViewControllerWillStopPictureInPicture:(AVPlayerViewController *)playerViewController{
    
    NSLog(@"playerViewControllerWillStopPictureInPicture");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
