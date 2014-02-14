//
//  SWParallaxScrollView.h
//  ParallaxScrollView
//
//  Created by Sven Weidauer on 14.02.14.
//  Copyright (c) 2014 Sven Weidauer. All rights reserved.
//

#import <UIKit/UIKit.h>

/** A parallax scroll view associates a layer (as a @c CGFloat) with each
 *  subview. Layer 0 scrolls with the regular scrolling speed while views on
 *  layers < 0 move slower and views on layer > 0 move faster.
 */
@interface SWParallaxScrollView : UIScrollView

/** Adds a new subview on the given layer
 *  @param view The subview to add
 *  @param layer The layer to add this subview to.
 *
 *  The view is inserted so that it comes after all views with a smaller or
 *  equal layer.
 */
- (void)addSubview:(UIView *)view onLayer: (CGFloat)layer;

@end
