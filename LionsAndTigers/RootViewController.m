//
//  ViewController.m
//  LionsAndTigers
//
//  Created by Matt on 1/16/15.
//  Copyright (c) 2015 Matt. All rights reserved.
#import "TopViewController.h"
#import "HUDViewController.h"
#import "RootViewController.h"

@interface RootViewController ()<TopDelegate, HudViewControllerDelegate, RootDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftPin;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightpin;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topPin;

@end

@implementation RootViewController
@synthesize delegate;
- (void)viewDidLoad {

    [super viewDidLoad];

}
# pragma mark TopViewController delegate
-(void)topRevealButtonTapped{

    if (self.leftPin.constant==-16) {
        self.leftPin.constant = 130;
        self.rightpin.constant = -160;
        self.topPin.constant = -20;
        [UIView animateWithDuration:0.5 animations:^{[self.view layoutIfNeeded];}];

    }
    else{
        self.leftPin.constant = -16;
        self.rightpin.constant = -16;
        self.topPin.constant = 0;
        [UIView animateWithDuration:0.5 animations:^{[self.view layoutIfNeeded];}];

    }
}
#pragma mark HUDViewController delegate;
-(void)changeToLions{
    [self.delegate loadLions];

}
-(void)changeToTigers{
    [self.delegate loadTigers];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"TopSegue"]) {
        UINavigationController *navC = segue.destinationViewController;
        TopViewController *tvc = navC.childViewControllers[0];
        tvc.delegate = self;
        self.delegate = tvc;


    }
    else if ([segue.identifier isEqualToString:@"HUDSegue"]){
        HUDViewController *hVC = segue.destinationViewController;
        hVC.delegate = self;
    }

}


@end
