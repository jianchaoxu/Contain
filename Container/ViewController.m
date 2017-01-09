//
//  ViewController.m
//  Container
//
//  Created by 易骏 on 16/6/15.
//  Copyright © 2016年 Tracy. All rights reserved.

#import "ViewController.h"
#import "ContainerView.h"
#define WIDTH  self.view.frame.size.width
#define HEIGHT  self.view.frame.size.height


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    ContainerView *con=[[ContainerView alloc]initWithFrame:CGRectMake(WIDTH/2, HEIGHT/2, 160, 160)];
    con.view=YES;
    con.center=CGPointMake(WIDTH/2, HEIGHT/2);
    con.backgroundColor=[UIColor clearColor];
    [self.view addSubview:con];
    con.value=0.3;
    
    UIImageView *imv=[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH/2, HEIGHT/2, 100, 100)];
    imv.image=[UIImage imageNamed:@"baby"];
    imv.layer.masksToBounds=YES;
    imv.layer.cornerRadius=50;
    imv.center=CGPointMake(WIDTH/2, HEIGHT/2);
    [self.view addSubview:imv];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
