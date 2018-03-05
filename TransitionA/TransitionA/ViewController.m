//
//  ViewController.m
//  TransitionA
//
//  Created by home on 2018/3/1.
//  Copyright © 2018年 home. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}


- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    
    HUTransitionVerticalLinesAnimator *animator = [[HUTransitionVerticalLinesAnimator alloc] init];

    return animator;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
