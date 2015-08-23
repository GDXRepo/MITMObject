//
//  SingleViewController.m
//  MITMObjectSample
//
//  Created by Георгий Малюков on 22.08.15.
//  Copyright (c) 2015 Georgiy Malyukov. All rights reserved.
//

#import "SingleViewController.h"


@interface SingleViewController ()<UIScrollViewDelegate> {
    
}

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end


@implementation SingleViewController


#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // init sample views
    CGRect rect = self.scrollView.bounds;
    UIView *firstView = [[UIView alloc] initWithFrame:rect];
    firstView.backgroundColor = [UIColor redColor];
    
    rect.origin.x = rect.size.width;
    UIView *secondView = [[UIView alloc] initWithFrame:rect];
    secondView.backgroundColor = [UIColor greenColor];
    
    [self.scrollView addSubview:firstView];
    [self.scrollView addSubview:secondView];
    
    self.scrollView.contentSize = CGSizeMake(rect.size.width * 2, 0);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.scrollView.delegate = self;
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"Scrolling in presenter received.");
}

@end
