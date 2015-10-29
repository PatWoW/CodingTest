//
//  ViewController.m
//  Westpac
//
//  Created by Muthu Rama on 29/10/2015.
//  Copyright © 2015 Muthu Rama. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (weak, nonatomic) IBOutlet UIImageView *imgWeatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblHummidity;
@property (weak, nonatomic) IBOutlet UILabel *lblRain;
@property (weak, nonatomic) IBOutlet UILabel *lblSummary;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (weak, nonatomic) IBOutlet UILabel *lblTemperature;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self rotatePickerView];
    
 }

- (IBAction)segmentControlChanged:(UISegmentedControl *)sender {
    
    
}


-(void) rotatePickerView{
    
    //Rotate the picker view horizontally
    
    CGAffineTransform rotate = CGAffineTransformMakeRotation(-3.14/2);
    rotate = CGAffineTransformScale(rotate, 0.10, 6.0);
    [self.pickerView setTransform:rotate];
    
    self.pickerView.backgroundColor = [UIColor whiteColor];
}


@end
