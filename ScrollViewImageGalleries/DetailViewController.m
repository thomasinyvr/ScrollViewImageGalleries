//
//  DetailViewController.m
//  ScrollViewImageGalleries
//
//  Created by Thomas Friesman on 2016-03-21.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import "DetailViewController.h"
#import "ViewController.h"


@interface DetailViewController() <UIScrollViewDelegate>


@property (nonatomic) UIScrollView *scrollView;
//@property (nonatomic) UIImageView *imageView;


@end

@implementation DetailViewController

-(void)viewDidLoad
{
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    
    self.scrollView.contentSize = self.detailImage.bounds.size;
    self.scrollView.delegate = self;
    self.scrollView.minimumZoomScale = 1.0;
    self.scrollView.maximumZoomScale = 4.0;
    self.scrollView.zoomScale = 1.0;
    
    [UIView animateWithDuration:1.0 animations:^{
        self.scrollView.contentOffset = CGPointMake(300, 100);
    }];
    
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.detailImage];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
    return self.detailImage;
    
}


@end
