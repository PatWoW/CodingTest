//
//  WeatherHelpher.m
//  Westpac
//
//  Created by Muthu Rama on 30/10/2015.
//  Copyright © 2015 Muthu Rama. All rights reserved.
//

#import "WeatherHelpher.h"

@implementation WeatherHelpher


+(NSString * ) weatherIcon:( NSString *) weatherType{
    
    
    NSDictionary *iconDictionary = @{@"clear-day": @"Sunny",
                                     @"clear-night": @"Sunny",
                                     @"rain": @"Rain",
                                     @"snow": @"Snow",
                                     @"sleet": @"LightingStorm",
                                     @"wind": @"LightingStorm",
                                     @"fog": @"Sunny",
                                     @"cloudy": @"Cloudy",
                                     @"partly-cloudy-day": @"PartlyCloudly",
                                     @"partly-cloudy-night": @"PartlyCloudly"
                                     
                                     };
    
    return [iconDictionary objectForKey:weatherType] ?: @"Sunny";
    
}
@end
