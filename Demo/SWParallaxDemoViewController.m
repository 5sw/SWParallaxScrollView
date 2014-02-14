//
//  SWParallaxDemoViewController.m
//  ParallaxScrollView
//
//  Created by Sven Weidauer on 14.02.14.
//  Copyright (c) 2014 Sven Weidauer. All rights reserved.
//

#import "SWParallaxDemoViewController.h"

#import "SWParallaxScrollView.h"

@implementation SWParallaxDemoViewController

- (void)loadView
{
    SWParallaxScrollView *view = [[SWParallaxScrollView alloc] init];

    UIImage *back = [UIImage imageNamed: @"back"];
    UIImage *mid = [UIImage imageNamed: @"mid"];
    UIImage *front = [UIImage imageNamed: @"front"];

    static const int TileCount = 20;

    CGSize tileSize = back.size;
    for (int i = 0; i < 2 * TileCount; i++) {
        CGRect tileFrame = CGRectMake( i *tileSize.width, 80, tileSize.width, tileSize.height );

        if (i < TileCount) {
            UIImageView *tile = [[UIImageView alloc] initWithImage: back];
            tile.frame = tileFrame;
            [view addSubview: tile onLayer: -1];

            tile = [[UIImageView alloc] initWithImage: mid];
            tile.frame = tileFrame;
            [view addSubview: tile onLayer: 0];
        }

        UIImageView *tile = [[UIImageView alloc] initWithImage: front];
        tile.frame = tileFrame;
        [view addSubview: tile onLayer: 1];
    }

    view.contentSize = CGSizeMake( TileCount * tileSize.width, tileSize.height );

    view.backgroundColor = [UIColor colorWithRed: 120. / 0xFF green: 200. / 0xFF blue: 237. / 0xFF alpha: 1];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector( tapped: )];
    tap.numberOfTouchesRequired = 2;
    [view addGestureRecognizer: tap];

    self.view = view;
}

- (void)tapped: (id)sender
{
    [(SWParallaxScrollView *)self.view setContentOffset:CGPointMake(0, 0) animated:YES];
}

@end
