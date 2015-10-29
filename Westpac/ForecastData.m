

#import "ForecastData.h"


NSString *const kDataWindSpeed = @"windSpeed";
NSString *const kDataApparentTemperature = @"apparentTemperature";
NSString *const kDataPrecipIntensity = @"precipIntensity";
NSString *const kDataTime = @"time";
NSString *const kDataPressure = @"pressure";
NSString *const kDataSummary = @"summary";
NSString *const kDataTemperature = @"temperature";
NSString *const kDataSunsetTime = @"sunsetTime";
NSString *const kDataApparentTemperatureMaxTime = @"apparentTemperatureMaxTime";
NSString *const kDataIcon = @"icon";
NSString *const kDataMoonPhase = @"moonPhase";
NSString *const kDataSunriseTime = @"sunriseTime";
NSString *const kDataTemperatureMin = @"temperatureMin";
NSString *const kDataApparentTemperatureMinTime = @"apparentTemperatureMinTime";
NSString *const kDataTemperatureMinTime = @"temperatureMinTime";
NSString *const kDataApparentTemperatureMin = @"apparentTemperatureMin";
NSString *const kDataPrecipIntensityMax = @"precipIntensityMax";
NSString *const kDataHumidity = @"humidity";
NSString *const kDataDewPoint = @"dewPoint";
NSString *const kDataWindBearing = @"windBearing";
NSString *const kDataPrecipType = @"precipType";
NSString *const kDataPrecipIntensityMaxTime = @"precipIntensityMaxTime";
NSString *const kDataCloudCover = @"cloudCover";
NSString *const kDataOzone = @"ozone";
NSString *const kDataPrecipProbability = @"precipProbability";
NSString *const kDataTemperatureMax = @"temperatureMax";
NSString *const kDataTemperatureMaxTime = @"temperatureMaxTime";
NSString *const kDataApparentTemperatureMax = @"apparentTemperatureMax";


@interface ForecastData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ForecastData

@synthesize windSpeed = _windSpeed;
@synthesize apparentTemperature = _apparentTemperature;
@synthesize precipIntensity = _precipIntensity;
@synthesize time = _time;
@synthesize pressure = _pressure;
@synthesize summary = _summary;
@synthesize temperature = _temperature;
@synthesize sunsetTime = _sunsetTime;
@synthesize apparentTemperatureMaxTime = _apparentTemperatureMaxTime;
@synthesize icon = _icon;
@synthesize moonPhase = _moonPhase;
@synthesize sunriseTime = _sunriseTime;
@synthesize temperatureMin = _temperatureMin;
@synthesize apparentTemperatureMinTime = _apparentTemperatureMinTime;
@synthesize temperatureMinTime = _temperatureMinTime;
@synthesize apparentTemperatureMin = _apparentTemperatureMin;
@synthesize precipIntensityMax = _precipIntensityMax;
@synthesize humidity = _humidity;
@synthesize dewPoint = _dewPoint;
@synthesize windBearing = _windBearing;
@synthesize precipType = _precipType;
@synthesize precipIntensityMaxTime = _precipIntensityMaxTime;
@synthesize cloudCover = _cloudCover;
@synthesize ozone = _ozone;
@synthesize precipProbability = _precipProbability;
@synthesize temperatureMax = _temperatureMax;
@synthesize temperatureMaxTime = _temperatureMaxTime;
@synthesize apparentTemperatureMax = _apparentTemperatureMax;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.windSpeed = [[self objectOrNilForKey:kDataWindSpeed fromDictionary:dict] doubleValue];
            self.apparentTemperature = [[self objectOrNilForKey:kDataApparentTemperature fromDictionary:dict] doubleValue];
            self.precipIntensity = [[self objectOrNilForKey:kDataPrecipIntensity fromDictionary:dict] doubleValue];
            self.time = [[self objectOrNilForKey:kDataTime fromDictionary:dict] doubleValue];
            self.pressure = [[self objectOrNilForKey:kDataPressure fromDictionary:dict] doubleValue];
            self.summary = [self objectOrNilForKey:kDataSummary fromDictionary:dict];
            self.temperature = [[self objectOrNilForKey:kDataTemperature fromDictionary:dict] doubleValue];
            self.sunsetTime = [[self objectOrNilForKey:kDataSunsetTime fromDictionary:dict] doubleValue];
            self.apparentTemperatureMaxTime = [[self objectOrNilForKey:kDataApparentTemperatureMaxTime fromDictionary:dict] doubleValue];
            self.icon = [self objectOrNilForKey:kDataIcon fromDictionary:dict];
            self.moonPhase = [[self objectOrNilForKey:kDataMoonPhase fromDictionary:dict] doubleValue];
            self.sunriseTime = [[self objectOrNilForKey:kDataSunriseTime fromDictionary:dict] doubleValue];
            self.temperatureMin = [[self objectOrNilForKey:kDataTemperatureMin fromDictionary:dict] doubleValue];
            self.apparentTemperatureMinTime = [[self objectOrNilForKey:kDataApparentTemperatureMinTime fromDictionary:dict] doubleValue];
            self.temperatureMinTime = [[self objectOrNilForKey:kDataTemperatureMinTime fromDictionary:dict] doubleValue];
            self.apparentTemperatureMin = [[self objectOrNilForKey:kDataApparentTemperatureMin fromDictionary:dict] doubleValue];
            self.precipIntensityMax = [[self objectOrNilForKey:kDataPrecipIntensityMax fromDictionary:dict] doubleValue];
            self.humidity = [[self objectOrNilForKey:kDataHumidity fromDictionary:dict] doubleValue];
            self.dewPoint = [[self objectOrNilForKey:kDataDewPoint fromDictionary:dict] doubleValue];
            self.windBearing = [[self objectOrNilForKey:kDataWindBearing fromDictionary:dict] doubleValue];
            self.precipType = [self objectOrNilForKey:kDataPrecipType fromDictionary:dict];
            self.precipIntensityMaxTime = [[self objectOrNilForKey:kDataPrecipIntensityMaxTime fromDictionary:dict] doubleValue];
            self.cloudCover = [[self objectOrNilForKey:kDataCloudCover fromDictionary:dict] doubleValue];
            self.ozone = [[self objectOrNilForKey:kDataOzone fromDictionary:dict] doubleValue];
            self.precipProbability = [[self objectOrNilForKey:kDataPrecipProbability fromDictionary:dict] doubleValue];
            self.temperatureMax = [[self objectOrNilForKey:kDataTemperatureMax fromDictionary:dict] doubleValue];
            self.temperatureMaxTime = [[self objectOrNilForKey:kDataTemperatureMaxTime fromDictionary:dict] doubleValue];
            self.apparentTemperatureMax = [[self objectOrNilForKey:kDataApparentTemperatureMax fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.windSpeed] forKey:kDataWindSpeed];
    [mutableDict setValue:[NSNumber numberWithDouble:self.apparentTemperature] forKey:kDataApparentTemperature];
    [mutableDict setValue:[NSNumber numberWithDouble:self.precipIntensity] forKey:kDataPrecipIntensity];
    [mutableDict setValue:[NSNumber numberWithDouble:self.time] forKey:kDataTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pressure] forKey:kDataPressure];
    [mutableDict setValue:self.summary forKey:kDataSummary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.temperature] forKey:kDataTemperature];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sunsetTime] forKey:kDataSunsetTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.apparentTemperatureMaxTime] forKey:kDataApparentTemperatureMaxTime];
    [mutableDict setValue:self.icon forKey:kDataIcon];
    [mutableDict setValue:[NSNumber numberWithDouble:self.moonPhase] forKey:kDataMoonPhase];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sunriseTime] forKey:kDataSunriseTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.temperatureMin] forKey:kDataTemperatureMin];
    [mutableDict setValue:[NSNumber numberWithDouble:self.apparentTemperatureMinTime] forKey:kDataApparentTemperatureMinTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.temperatureMinTime] forKey:kDataTemperatureMinTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.apparentTemperatureMin] forKey:kDataApparentTemperatureMin];
    [mutableDict setValue:[NSNumber numberWithDouble:self.precipIntensityMax] forKey:kDataPrecipIntensityMax];
    [mutableDict setValue:[NSNumber numberWithDouble:self.humidity] forKey:kDataHumidity];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dewPoint] forKey:kDataDewPoint];
    [mutableDict setValue:[NSNumber numberWithDouble:self.windBearing] forKey:kDataWindBearing];
    [mutableDict setValue:self.precipType forKey:kDataPrecipType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.precipIntensityMaxTime] forKey:kDataPrecipIntensityMaxTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cloudCover] forKey:kDataCloudCover];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ozone] forKey:kDataOzone];
    [mutableDict setValue:[NSNumber numberWithDouble:self.precipProbability] forKey:kDataPrecipProbability];
    [mutableDict setValue:[NSNumber numberWithDouble:self.temperatureMax] forKey:kDataTemperatureMax];
    [mutableDict setValue:[NSNumber numberWithDouble:self.temperatureMaxTime] forKey:kDataTemperatureMaxTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.apparentTemperatureMax] forKey:kDataApparentTemperatureMax];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.windSpeed = [aDecoder decodeDoubleForKey:kDataWindSpeed];
    self.apparentTemperature = [aDecoder decodeDoubleForKey:kDataApparentTemperature];
    self.precipIntensity = [aDecoder decodeDoubleForKey:kDataPrecipIntensity];
    self.time = [aDecoder decodeDoubleForKey:kDataTime];
    self.pressure = [aDecoder decodeDoubleForKey:kDataPressure];
    self.summary = [aDecoder decodeObjectForKey:kDataSummary];
    self.temperature = [aDecoder decodeDoubleForKey:kDataTemperature];
    self.sunsetTime = [aDecoder decodeDoubleForKey:kDataSunsetTime];
    self.apparentTemperatureMaxTime = [aDecoder decodeDoubleForKey:kDataApparentTemperatureMaxTime];
    self.icon = [aDecoder decodeObjectForKey:kDataIcon];
    self.moonPhase = [aDecoder decodeDoubleForKey:kDataMoonPhase];
    self.sunriseTime = [aDecoder decodeDoubleForKey:kDataSunriseTime];
    self.temperatureMin = [aDecoder decodeDoubleForKey:kDataTemperatureMin];
    self.apparentTemperatureMinTime = [aDecoder decodeDoubleForKey:kDataApparentTemperatureMinTime];
    self.temperatureMinTime = [aDecoder decodeDoubleForKey:kDataTemperatureMinTime];
    self.apparentTemperatureMin = [aDecoder decodeDoubleForKey:kDataApparentTemperatureMin];
    self.precipIntensityMax = [aDecoder decodeDoubleForKey:kDataPrecipIntensityMax];
    self.humidity = [aDecoder decodeDoubleForKey:kDataHumidity];
    self.dewPoint = [aDecoder decodeDoubleForKey:kDataDewPoint];
    self.windBearing = [aDecoder decodeDoubleForKey:kDataWindBearing];
    self.precipType = [aDecoder decodeObjectForKey:kDataPrecipType];
    self.precipIntensityMaxTime = [aDecoder decodeDoubleForKey:kDataPrecipIntensityMaxTime];
    self.cloudCover = [aDecoder decodeDoubleForKey:kDataCloudCover];
    self.ozone = [aDecoder decodeDoubleForKey:kDataOzone];
    self.precipProbability = [aDecoder decodeDoubleForKey:kDataPrecipProbability];
    self.temperatureMax = [aDecoder decodeDoubleForKey:kDataTemperatureMax];
    self.temperatureMaxTime = [aDecoder decodeDoubleForKey:kDataTemperatureMaxTime];
    self.apparentTemperatureMax = [aDecoder decodeDoubleForKey:kDataApparentTemperatureMax];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_windSpeed forKey:kDataWindSpeed];
    [aCoder encodeDouble:_apparentTemperature forKey:kDataApparentTemperature];
    [aCoder encodeDouble:_precipIntensity forKey:kDataPrecipIntensity];
    [aCoder encodeDouble:_time forKey:kDataTime];
    [aCoder encodeDouble:_pressure forKey:kDataPressure];
    [aCoder encodeObject:_summary forKey:kDataSummary];
    [aCoder encodeDouble:_temperature forKey:kDataTemperature];
    [aCoder encodeDouble:_sunsetTime forKey:kDataSunsetTime];
    [aCoder encodeDouble:_apparentTemperatureMaxTime forKey:kDataApparentTemperatureMaxTime];
    [aCoder encodeObject:_icon forKey:kDataIcon];
    [aCoder encodeDouble:_moonPhase forKey:kDataMoonPhase];
    [aCoder encodeDouble:_sunriseTime forKey:kDataSunriseTime];
    [aCoder encodeDouble:_temperatureMin forKey:kDataTemperatureMin];
    [aCoder encodeDouble:_apparentTemperatureMinTime forKey:kDataApparentTemperatureMinTime];
    [aCoder encodeDouble:_temperatureMinTime forKey:kDataTemperatureMinTime];
    [aCoder encodeDouble:_apparentTemperatureMin forKey:kDataApparentTemperatureMin];
    [aCoder encodeDouble:_precipIntensityMax forKey:kDataPrecipIntensityMax];
    [aCoder encodeDouble:_humidity forKey:kDataHumidity];
    [aCoder encodeDouble:_dewPoint forKey:kDataDewPoint];
    [aCoder encodeDouble:_windBearing forKey:kDataWindBearing];
    [aCoder encodeObject:_precipType forKey:kDataPrecipType];
    [aCoder encodeDouble:_precipIntensityMaxTime forKey:kDataPrecipIntensityMaxTime];
    [aCoder encodeDouble:_cloudCover forKey:kDataCloudCover];
    [aCoder encodeDouble:_ozone forKey:kDataOzone];
    [aCoder encodeDouble:_precipProbability forKey:kDataPrecipProbability];
    [aCoder encodeDouble:_temperatureMax forKey:kDataTemperatureMax];
    [aCoder encodeDouble:_temperatureMaxTime forKey:kDataTemperatureMaxTime];
    [aCoder encodeDouble:_apparentTemperatureMax forKey:kDataApparentTemperatureMax];
}

- (id)copyWithZone:(NSZone *)zone
{
    ForecastData *copy = [[ForecastData alloc] init];
    
    if (copy) {

        copy.windSpeed = self.windSpeed;
        copy.apparentTemperature = self.apparentTemperature;
        copy.precipIntensity = self.precipIntensity;
        copy.time = self.time;
        copy.pressure = self.pressure;
        copy.summary = [self.summary copyWithZone:zone];
        copy.temperature = self.temperature;
        copy.sunsetTime = self.sunsetTime;
        copy.apparentTemperatureMaxTime = self.apparentTemperatureMaxTime;
        copy.icon = [self.icon copyWithZone:zone];
        copy.moonPhase = self.moonPhase;
        copy.sunriseTime = self.sunriseTime;
        copy.temperatureMin = self.temperatureMin;
        copy.apparentTemperatureMinTime = self.apparentTemperatureMinTime;
        copy.temperatureMinTime = self.temperatureMinTime;
        copy.apparentTemperatureMin = self.apparentTemperatureMin;
        copy.precipIntensityMax = self.precipIntensityMax;
        copy.humidity = self.humidity;
        copy.dewPoint = self.dewPoint;
        copy.windBearing = self.windBearing;
        copy.precipType = [self.precipType copyWithZone:zone];
        copy.precipIntensityMaxTime = self.precipIntensityMaxTime;
        copy.cloudCover = self.cloudCover;
        copy.ozone = self.ozone;
        copy.precipProbability = self.precipProbability;
        copy.temperatureMax = self.temperatureMax;
        copy.temperatureMaxTime = self.temperatureMaxTime;
        copy.apparentTemperatureMax = self.apparentTemperatureMax;
    }
    
    return copy;
}


@end
