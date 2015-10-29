//
//  RestService.h
//  Westpac
//
//  Created by Muthu Rama on 29/10/2015.
//  Copyright © 2015 Muthu Rama. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cities.h"
#import "WeatherForecast.h"

@interface RestService : NSObject

@property (nonatomic, strong) Cities *city;

+ (instancetype)sharedManager;


- (void )fetchDataWithCompletionBlock:(void(^)(WeatherForecast * weatherForecast, NSError * error))completionBlock;

@end
