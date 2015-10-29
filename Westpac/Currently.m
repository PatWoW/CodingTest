

#import "Currently.h"


NSString *const kCurrentlyTemperature = @"temperature";
NSString *const kCurrentlyWindSpeed = @"windSpeed";
NSString *const kCurrentlyHumidity = @"humidity";
NSString *const kCurrentlyWindBearing = @"windBearing";
NSString *const kCurrentlyCloudCover = @"cloudCover";
NSString *const kCurrentlyTime = @"time";
NSString *const kCurrentlyDewPoint = @"dewPoint";
NSString *const kCurrentlySummary = @"summary";
NSString *const kCurrentlyPrecipIntensity = @"precipIntensity";
NSString *const kCurrentlyIcon = @"icon";
NSString *const kCurrentlyOzone = @"ozone";
NSString *const kCurrentlyApparentTemperature = @"apparentTemperature";
NSString *const kCurrentlyPressure = @"pressure";
NSString *const kCurrentlyPrecipProbability = @"precipProbability";


@interface Currently ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Currently


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
            self.temperature = [[self objectOrNilForKey:kCurrentlyTemperature fromDictionary:dict] doubleValue];
            self.windSpeed = [[self objectOrNilForKey:kCurrentlyWindSpeed fromDictionary:dict] doubleValue];
            self.humidity = [[self objectOrNilForKey:kCurrentlyHumidity fromDictionary:dict] doubleValue];
            self.windBearing = [[self objectOrNilForKey:kCurrentlyWindBearing fromDictionary:dict] doubleValue];
            self.cloudCover = [[self objectOrNilForKey:kCurrentlyCloudCover fromDictionary:dict] doubleValue];
            self.time = [[self objectOrNilForKey:kCurrentlyTime fromDictionary:dict] doubleValue];
            self.dewPoint = [[self objectOrNilForKey:kCurrentlyDewPoint fromDictionary:dict] doubleValue];
            self.summary = [self objectOrNilForKey:kCurrentlySummary fromDictionary:dict];
            self.precipIntensity = [[self objectOrNilForKey:kCurrentlyPrecipIntensity fromDictionary:dict] doubleValue];
            self.icon = [self objectOrNilForKey:kCurrentlyIcon fromDictionary:dict];
            self.ozone = [[self objectOrNilForKey:kCurrentlyOzone fromDictionary:dict] doubleValue];
            self.apparentTemperature = [[self objectOrNilForKey:kCurrentlyApparentTemperature fromDictionary:dict] doubleValue];
            self.pressure = [[self objectOrNilForKey:kCurrentlyPressure fromDictionary:dict] doubleValue];
            self.precipProbability = [[self objectOrNilForKey:kCurrentlyPrecipProbability fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.temperature] forKey:kCurrentlyTemperature];
    [mutableDict setValue:[NSNumber numberWithDouble:self.windSpeed] forKey:kCurrentlyWindSpeed];
    [mutableDict setValue:[NSNumber numberWithDouble:self.humidity] forKey:kCurrentlyHumidity];
    [mutableDict setValue:[NSNumber numberWithDouble:self.windBearing] forKey:kCurrentlyWindBearing];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cloudCover] forKey:kCurrentlyCloudCover];
    [mutableDict setValue:[NSNumber numberWithDouble:self.time] forKey:kCurrentlyTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dewPoint] forKey:kCurrentlyDewPoint];
    [mutableDict setValue:self.summary forKey:kCurrentlySummary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.precipIntensity] forKey:kCurrentlyPrecipIntensity];
    [mutableDict setValue:self.icon forKey:kCurrentlyIcon];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ozone] forKey:kCurrentlyOzone];
    [mutableDict setValue:[NSNumber numberWithDouble:self.apparentTemperature] forKey:kCurrentlyApparentTemperature];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pressure] forKey:kCurrentlyPressure];
    [mutableDict setValue:[NSNumber numberWithDouble:self.precipProbability] forKey:kCurrentlyPrecipProbability];

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

    self.temperature = [aDecoder decodeDoubleForKey:kCurrentlyTemperature];
    self.windSpeed = [aDecoder decodeDoubleForKey:kCurrentlyWindSpeed];
    self.humidity = [aDecoder decodeDoubleForKey:kCurrentlyHumidity];
    self.windBearing = [aDecoder decodeDoubleForKey:kCurrentlyWindBearing];
    self.cloudCover = [aDecoder decodeDoubleForKey:kCurrentlyCloudCover];
    self.time = [aDecoder decodeDoubleForKey:kCurrentlyTime];
    self.dewPoint = [aDecoder decodeDoubleForKey:kCurrentlyDewPoint];
    self.summary = [aDecoder decodeObjectForKey:kCurrentlySummary];
    self.precipIntensity = [aDecoder decodeDoubleForKey:kCurrentlyPrecipIntensity];
    self.icon = [aDecoder decodeObjectForKey:kCurrentlyIcon];
    self.ozone = [aDecoder decodeDoubleForKey:kCurrentlyOzone];
    self.apparentTemperature = [aDecoder decodeDoubleForKey:kCurrentlyApparentTemperature];
    self.pressure = [aDecoder decodeDoubleForKey:kCurrentlyPressure];
    self.precipProbability = [aDecoder decodeDoubleForKey:kCurrentlyPrecipProbability];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_temperature forKey:kCurrentlyTemperature];
    [aCoder encodeDouble:_windSpeed forKey:kCurrentlyWindSpeed];
    [aCoder encodeDouble:_humidity forKey:kCurrentlyHumidity];
    [aCoder encodeDouble:_windBearing forKey:kCurrentlyWindBearing];
    [aCoder encodeDouble:_cloudCover forKey:kCurrentlyCloudCover];
    [aCoder encodeDouble:_time forKey:kCurrentlyTime];
    [aCoder encodeDouble:_dewPoint forKey:kCurrentlyDewPoint];
    [aCoder encodeObject:_summary forKey:kCurrentlySummary];
    [aCoder encodeDouble:_precipIntensity forKey:kCurrentlyPrecipIntensity];
    [aCoder encodeObject:_icon forKey:kCurrentlyIcon];
    [aCoder encodeDouble:_ozone forKey:kCurrentlyOzone];
    [aCoder encodeDouble:_apparentTemperature forKey:kCurrentlyApparentTemperature];
    [aCoder encodeDouble:_pressure forKey:kCurrentlyPressure];
    [aCoder encodeDouble:_precipProbability forKey:kCurrentlyPrecipProbability];
}

- (id)copyWithZone:(NSZone *)zone
{
    Currently *copy = [[Currently alloc] init];
    
    if (copy) {

        copy.temperature = self.temperature;
        copy.windSpeed = self.windSpeed;
        copy.humidity = self.humidity;
        copy.windBearing = self.windBearing;
        copy.cloudCover = self.cloudCover;
        copy.time = self.time;
        copy.dewPoint = self.dewPoint;
        copy.summary = [self.summary copyWithZone:zone];
        copy.precipIntensity = self.precipIntensity;
        copy.icon = [self.icon copyWithZone:zone];
        copy.ozone = self.ozone;
        copy.apparentTemperature = self.apparentTemperature;
        copy.pressure = self.pressure;
        copy.precipProbability = self.precipProbability;
    }
    
    return copy;
}


@end
