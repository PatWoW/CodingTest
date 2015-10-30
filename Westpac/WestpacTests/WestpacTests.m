//
//  WestpacTests.m
//  WestpacTests
//
//  Created by Muthu Rama on 29/10/2015.
//  Copyright © 2015 Muthu Rama. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RestService.h"
#import "AppDelegate.h"
#import "Daily.h"
#import "Hourly.h"

@interface WestpacTests : XCTestCase

@end

@implementation WestpacTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testWebService {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Forecast Data"];
    
    AppDelegate * appDelegate = [[UIApplication sharedApplication] delegate];
    [RestService sharedManager].city= appDelegate.cities[0];
    
    [[RestService sharedManager] fetchDataWithCompletionBlock:^(WeatherForecast *weatherForecast, NSError *error) {
      
        XCTAssertEqualObjects(weatherForecast.timezone, @"Australia/Sydney", "Base should be Australia/Sydney");
        
        XCTAssertTrue([weatherForecast.daily.forecastData isKindOfClass:[NSArray class]], @"Should return a NSArray");
        XCTAssertTrue([weatherForecast.hourly.data isKindOfClass:[NSArray class]], @"Should return a NSArray");

        
        [expectation fulfill];
        
    }];
    
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Error : %@", error);
        }
    }];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
