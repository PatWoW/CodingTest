//
//  RestService.m
//  Westpac
//
//  Created by Muthu Rama on 29/10/2015.
//  Copyright © 2015 Muthu Rama. All rights reserved.
//

#import "RestService.h"
#import "Cities.h"
#import "AppDelegate.h"

@interface RestService()

@property (nonatomic, strong) NSString *serviceUrl;

@end
@implementation RestService

+ (instancetype)sharedManager
{
    static RestService *sharedMyManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (NSString*) serviceUrl{
    
    NSLog(@"URl %@", [NSString stringWithFormat:@"https://api.forecast.io/forecast/d8f3047f6acceb203e124acd1fd6f0cf/%@,%@",self.city.lat,self.city.lag]);
    return [NSString stringWithFormat:@"https://api.forecast.io/forecast/d8f3047f6acceb203e124acd1fd6f0cf/%@,%@",self.city.lat,self.city.lag];
    
}

- (void )fetchDataWithCompletionBlock:(void(^)(WeatherForecast * weatherForecast, NSError * error))completionBlock{
    {
        NSString * str= self.serviceUrl;
        NSURL *url = [NSURL URLWithString:str];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        
        
        
        [NSURLConnection sendAsynchronousRequest:request
                                           queue:[NSOperationQueue mainQueue]
                               completionHandler:^(NSURLResponse *response,
                                                   NSData *data, NSError *connectionError)
         {
             [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
             
             if (data.length > 0 && connectionError == nil)
             {
                 NSDictionary *serviceResponse = [NSJSONSerialization JSONObjectWithData:data
                                                                                 options:0
                                                                                   error:NULL];
                 
                 
                 
                 WeatherForecast *responseModel = [[WeatherForecast alloc] initWithDictionary:serviceResponse];
                 
                 completionBlock(responseModel,nil);
                 
             }else{
                 completionBlock(nil, connectionError);
                 
             }
             
         }];
    }
}
@end
