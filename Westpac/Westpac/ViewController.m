//
//  ViewController.m
//  Westpac
//
//  Created by Muthu Rama on 29/10/2015.
//  Copyright © 2015 Muthu Rama. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "RestService.h"
#import "ForecastData.h"
#import "WeatherHelpher.h"
#import "Daily.h"
#import "Currently.h"


@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (weak, nonatomic) IBOutlet UIImageView *imgWeatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblHummidity;
@property (weak, nonatomic) IBOutlet UILabel *lblRain;
@property (weak, nonatomic) IBOutlet UILabel *lblSummary;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (weak, nonatomic) IBOutlet UILabel *lblTemperature;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (nonatomic,strong) WeatherForecast * forecast;
@property (nonatomic,strong) ForecastData * selectedForecast;
@property (strong,nonatomic) NSArray * pickerViewArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [self fetchData];

    [super viewDidLoad];
    [self rotatePickerView];
    
 }


#pragma mark - Picker View

-(void) rotatePickerView{
    
    //Rotate the picker view horizontally
    
    CGAffineTransform rotate = CGAffineTransformMakeRotation(-3.14/2);
    rotate = CGAffineTransformScale(rotate, 0.30, 6.0);
    [self.pickerView setTransform:rotate];
    
}

#pragma mark - Refresh UI

-(void) refreshUI{
    
    NSString * icon = self.selectedForecast.icon;
    
    NSString * iconName = [WeatherHelpher weatherIcon:icon];
    
    self.imgWeatherIcon.image = [UIImage imageNamed:iconName];
    
    self.lblSummary.text = self.selectedForecast.summary;
    
    [self.lblSummary sizeToFit];
    
    NSLog(@"%@",[NSString stringWithFormat:@"%.2lf",self.selectedForecast.temperatureMax]);

    
    NSString *temperature = [NSString stringWithFormat:@"%@%@C",[NSString stringWithFormat:@"%.0lf",(self.forecast.currently.temperature-32)/1.8], @"\u00B0"];
    
    self.lblTemperature.text = temperature ;
    
    [self.lblTemperature sizeToFit];
    self.lblHummidity.text =[NSString stringWithFormat:@"%.0lf %%", self.selectedForecast.humidity*100];
    self.lblRain.text =[NSString stringWithFormat:@"%.0lf %%", self.selectedForecast.precipProbability*100];
    
}



#pragma mark - Segment Control
- (IBAction)segmentControlChanged:(UISegmentedControl *)sender {
    
    [self fetchData];

}


#pragma  mark picker view delegate
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.pickerViewArray count];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    self.selectedForecast = [self.pickerViewArray objectAtIndex:row];
    [self refreshUI];
    
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UILabel *lblTemp = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 160, 280)];
    
    //Rotate the label
    CGAffineTransform rotate = CGAffineTransformMakeRotation(M_PI/2);
    rotate = CGAffineTransformScale(rotate, 0.40, 6.0);
    [lblTemp setTransform:rotate];
    
    
    ForecastData *data = [self.pickerViewArray objectAtIndex:row];
    
    NSLog(@"Time %f Day %@", data.time, [self getDateFromDouble:data.time ]);
    
    NSString * str = [self getDateFromDouble:data.time ];
    
    str= [str stringByAppendingString:@"\n"];
    NSString *temperature = [NSString stringWithFormat:@"Max %@%@C",[NSString stringWithFormat:@"%.0lf",(data.temperatureMax-32)/1.8], @"\u00B0"];

    str =[str stringByAppendingString:temperature];
    
    lblTemp.text =str ;
    
    
    //Label Appearance
    lblTemp.font=[UIFont fontWithName:@"Helvetica-Bold" size:12.0f];
    lblTemp.textAlignment = NSTextAlignmentCenter;
    lblTemp.numberOfLines = 0;
    lblTemp.backgroundColor = [UIColor clearColor];
    lblTemp.textColor =[UIColor whiteColor];
    lblTemp.clipsToBounds = YES;
    
    
    //Hide the default indicator and show the image indicator
    [[_pickerView.subviews objectAtIndex:1] setHidden:YES];
    [[_pickerView.subviews objectAtIndex:2] setHidden:YES];

    
    
    return lblTemp;
    
}

-(void) setPickerViewData{
    
    
    NSLog(@"%@" ,self.forecast.daily.forecastData);
    
    self.pickerViewArray = self.forecast.daily.forecastData;

    
    [self.pickerView reloadAllComponents];
    if ([self.pickerViewArray count]>0) {
        [self.pickerView selectRow:0 inComponent:0 animated:YES];
        self.selectedForecast = [self.pickerViewArray objectAtIndex:0];
        
    }
    
    
    
}


#pragma mark - fetch forecast data
-(void) fetchData{
    
    __weak __typeof(self) weakSelf = self;
    [self.activityIndicator startAnimating];
    AppDelegate * appDelegate = [[UIApplication sharedApplication] delegate];
    [RestService sharedManager].city= appDelegate.cities[self.segmentControl.selectedSegmentIndex];
    
    [[RestService sharedManager] fetchDataWithCompletionBlock:^(WeatherForecast *weatherForecast, NSError *error) {
        
        __strong __typeof(self) strongSelf = weakSelf;
        
        if(!error)
        {
            NSLog(@"weatherForecast%@" ,weatherForecast);
            strongSelf.forecast = weatherForecast;
            [strongSelf setPickerViewData];
            [strongSelf refreshUI];
        }else{
            NSLog(@"Error %@", error);
        }
        
        [strongSelf.activityIndicator stopAnimating];

    } ];
    
}




#pragma mark - helper class
-(NSString*) getDateFromDouble:(double ) doubleTime{
    
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:doubleTime];
    
    NSDateFormatter* day = [[NSDateFormatter alloc] init];
    [day setDateFormat: @"EEE"];
    return [day stringFromDate:date];
    
}
@end
