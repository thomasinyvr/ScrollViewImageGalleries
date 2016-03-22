//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Thomas Friesman on 2016-03-21.
//  Copyright © 2016 Thomas Friesman. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic) UITapGestureRecognizer *tapGestureRecognizer;
@property (nonatomic)UIImageView *destinationImage;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(galleryImageTapped:)];
    
    [self.scrollView addGestureRecognizer:tapGestureRecognizer];
    
    
    
    
    [super viewWillAppear:animated];
    NSArray *lighthouseImages = @[[UIImage imageNamed:@"Lighthouse-in-Field"], [UIImage imageNamed:@"Lighthouse-night"], [UIImage imageNamed:@"Lighthouse-zoomed"]];
    
    int startingPointOfX = 0;
    
    for (UIImage *lighthouse in lighthouseImages)
    {
        UIImageView *lighthouseView = [[UIImageView alloc] initWithFrame:CGRectMake(startingPointOfX, 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame))];
        
        lighthouseView.userInteractionEnabled = YES;
        
        lighthouseView.clipsToBounds = YES;
        
        startingPointOfX += self.scrollView.frame.size.width;
        
        lighthouseView.image = lighthouse;
        [self.scrollView addSubview:lighthouseView];
    }
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * 3, self.scrollView.frame.size.height);
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    

        DetailViewController *destination = segue.destinationViewController;
    destination.detailImage = sender;

        destination.delegate = self;

}


-(IBAction)galleryImageTapped:(UITapGestureRecognizer *)sender

{
    
    UIView* view = sender.view;
    CGPoint loc = [sender locationInView:view];
    UIImageView *subview = (UIImageView*)[view hitTest:loc withEvent:nil];
    //[self.destinationImage setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)];


    
    
    [self performSegueWithIdentifier:@"showDetailViewController" sender:subview];
}

@end
