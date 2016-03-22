//
//  DetailViewController.h
//  ScrollViewImageGalleries
//
//  Created by Thomas Friesman on 2016-03-21.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController


@property (nonatomic,weak) id <UIScrollViewDelegate> delegate;

@property (nonatomic) UIImageView *detailImage;





@end
