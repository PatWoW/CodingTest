
#import <Foundation/Foundation.h>



@interface ForecastData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double windSpeed;
@property (nonatomic, assign) double apparentTemperature;
@property (nonatomic, assign) double precipIntensity;
@property (nonatomic, assign) double time;
@property (nonatomic, assign) double pressure;
@property (nonatomic, strong) NSString *summary;
@property (nonatomic, assign) double temperature;
@property (nonatomic, assign) double sunsetTime;
@property (nonatomic, assign) double apparentTemperatureMaxTime;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, assign) double moonPhase;
@property (nonatomic, assign) double sunriseTime;
@property (nonatomic, assign) double temperatureMin;
@property (nonatomic, assign) double apparentTemperatureMinTime;
@property (nonatomic, assign) double temperatureMinTime;
@property (nonatomic, assign) double apparentTemperatureMin;
@property (nonatomic, assign) double precipIntensityMax;
@property (nonatomic, assign) double humidity;
@property (nonatomic, assign) double dewPoint;
@property (nonatomic, assign) double windBearing;
@property (nonatomic, strong) NSString *precipType;
@property (nonatomic, assign) double precipIntensityMaxTime;
@property (nonatomic, assign) double cloudCover;
@property (nonatomic, assign) double ozone;
@property (nonatomic, assign) double precipProbability;
@property (nonatomic, assign) double temperatureMax;
@property (nonatomic, assign) double temperatureMaxTime;
@property (nonatomic, assign) double apparentTemperatureMax;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
