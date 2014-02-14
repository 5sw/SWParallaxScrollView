//
//  SWParallaxScrollView.m
//  ParallaxScrollView
//
//  Created by Sven Weidauer on 14.02.14.
//  Copyright (c) 2014 Sven Weidauer. All rights reserved.
//

#import "SWParallaxScrollView.h"

#import <map>

@implementation SWParallaxScrollView {
    std::multimap<CGFloat, UIView *> _layerSubviews;
    CGPoint _oldContentOffset;
}

- (void)addSubview:(UIView *)view onLayer:(CGFloat)layer
{
    [super addSubview: view];

    const auto &it = _layerSubviews.upper_bound( layer );
    if (it == _layerSubviews.end()) {
        [super addSubview: view];
    } else {
        [super insertSubview: view belowSubview: it->second];
    }

    _layerSubviews.emplace( layer, view );
}

- (void)addSubview:(UIView *)view
{
    [self addSubview: view onLayer: 0.0];
}

- (void)willRemoveSubview:(UIView *)subview
{
    [super willRemoveSubview: subview];

    auto iterator = std::find_if( _layerSubviews.begin(), _layerSubviews.end(), [subview] ( const std::pair<CGFloat, UIView *> &item ) { return item.second == subview; } );
    _layerSubviews.erase( iterator );
}

- (void)layoutSubviews
{
    CGPoint contentOffset = self.contentOffset;
    CGPoint oldContentOffset = _oldContentOffset;

    if (CGPointEqualToPoint( contentOffset,  oldContentOffset )) return;

    CGVector delta = CGVectorMake( contentOffset.x - oldContentOffset.x, contentOffset.y - oldContentOffset.y );

    CGFloat currentLayer = -CGFLOAT_MAX;
    CGVector currentDelta = CGVectorMake( -delta.dx, -delta.dy );

    for (const auto &layerView : _layerSubviews) {
        if (layerView.first == 0.0) continue;

        if (layerView.first != currentLayer) {
            currentLayer = layerView.first;
            CGFloat movement = pow( 2, currentLayer ) - 1;
            currentDelta = CGVectorMake( delta.dx * movement, delta.dy * movement );
        }

        CGPoint center = layerView.second.center;
        center.x -= currentDelta.dx;
        center.y -= currentDelta.dy;
        layerView.second.center = center;
    }

    _oldContentOffset = contentOffset;
}

@end
