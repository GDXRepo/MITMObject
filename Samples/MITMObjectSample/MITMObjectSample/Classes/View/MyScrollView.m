//
//  MyScrollView.m
//  MITMObjectSample
//
//  Created by Георгий Малюков on 23.08.15.
//  Copyright (c) 2015 Georgiy Malyukov. All rights reserved.
//

#import "MyScrollView.h"
#import "MITMObject.h"


@interface MyScrollView () {
    MITMObject *mitm;
}

@end


@implementation MyScrollView

MITM_IMPLEMENT(mitm);


#pragma mark - Root

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        MITM_INIT(mitm);
    }
    return self;
}


#pragma mark - MITM Overrides

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"Scrolling inside a subclassed object received.");
    // forward call
    if ([self.delegate respondsToSelector:@selector(scrollViewDidScroll:)]) {
        [self.delegate scrollViewDidScroll:scrollView];
    }
}

@end
