

#import <Foundation/Foundation.h>

@class Hourly, Daily, Currently, Flags;

@interface WeatherForecast : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double offset;
@property (nonatomic, strong) Hourly *hourly;
@property (nonatomic, assign) double longitude;
@property (nonatomic, strong) Daily *daily;
@property (nonatomic, strong) NSString *timezone;
@property (nonatomic, strong) Currently *currently;
@property (nonatomic, assign) double latitude;
@property (nonatomic, strong) Flags *flags;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
