

#import "WeatherForecast.h"
#import "Hourly.h"
#import "Daily.h"
#import "Currently.h"
#import "Flags.h"


NSString *const kBaseClassOffset = @"offset";
NSString *const kBaseClassHourly = @"hourly";
NSString *const kBaseClassLongitude = @"longitude";
NSString *const kBaseClassDaily = @"daily";
NSString *const kBaseClassTimezone = @"timezone";
NSString *const kBaseClassCurrently = @"currently";
NSString *const kBaseClassLatitude = @"latitude";
NSString *const kBaseClassFlags = @"flags";


@interface WeatherForecast ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherForecast



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
            self.offset = [[self objectOrNilForKey:kBaseClassOffset fromDictionary:dict] doubleValue];
            self.hourly = [Hourly modelObjectWithDictionary:[dict objectForKey:kBaseClassHourly]];
            self.longitude = [[self objectOrNilForKey:kBaseClassLongitude fromDictionary:dict] doubleValue];
            self.daily = [Daily modelObjectWithDictionary:[dict objectForKey:kBaseClassDaily]];
            self.timezone = [self objectOrNilForKey:kBaseClassTimezone fromDictionary:dict];
            self.currently = [Currently modelObjectWithDictionary:[dict objectForKey:kBaseClassCurrently]];
            self.latitude = [[self objectOrNilForKey:kBaseClassLatitude fromDictionary:dict] doubleValue];
            self.flags = [Flags modelObjectWithDictionary:[dict objectForKey:kBaseClassFlags]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.offset] forKey:kBaseClassOffset];
    [mutableDict setValue:[self.hourly dictionaryRepresentation] forKey:kBaseClassHourly];
    [mutableDict setValue:[NSNumber numberWithDouble:self.longitude] forKey:kBaseClassLongitude];
    [mutableDict setValue:[self.daily dictionaryRepresentation] forKey:kBaseClassDaily];
    [mutableDict setValue:self.timezone forKey:kBaseClassTimezone];
    [mutableDict setValue:[self.currently dictionaryRepresentation] forKey:kBaseClassCurrently];
    [mutableDict setValue:[NSNumber numberWithDouble:self.latitude] forKey:kBaseClassLatitude];
    [mutableDict setValue:[self.flags dictionaryRepresentation] forKey:kBaseClassFlags];

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

    self.offset = [aDecoder decodeDoubleForKey:kBaseClassOffset];
    self.hourly = [aDecoder decodeObjectForKey:kBaseClassHourly];
    self.longitude = [aDecoder decodeDoubleForKey:kBaseClassLongitude];
    self.daily = [aDecoder decodeObjectForKey:kBaseClassDaily];
    self.timezone = [aDecoder decodeObjectForKey:kBaseClassTimezone];
    self.currently = [aDecoder decodeObjectForKey:kBaseClassCurrently];
    self.latitude = [aDecoder decodeDoubleForKey:kBaseClassLatitude];
    self.flags = [aDecoder decodeObjectForKey:kBaseClassFlags];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_offset forKey:kBaseClassOffset];
    [aCoder encodeObject:_hourly forKey:kBaseClassHourly];
    [aCoder encodeDouble:_longitude forKey:kBaseClassLongitude];
    [aCoder encodeObject:_daily forKey:kBaseClassDaily];
    [aCoder encodeObject:_timezone forKey:kBaseClassTimezone];
    [aCoder encodeObject:_currently forKey:kBaseClassCurrently];
    [aCoder encodeDouble:_latitude forKey:kBaseClassLatitude];
    [aCoder encodeObject:_flags forKey:kBaseClassFlags];
}

- (id)copyWithZone:(NSZone *)zone
{
    WeatherForecast *copy = [[WeatherForecast alloc] init];
    
    if (copy) {

        copy.offset = self.offset;
        copy.hourly = [self.hourly copyWithZone:zone];
        copy.longitude = self.longitude;
        copy.daily = [self.daily copyWithZone:zone];
        copy.timezone = [self.timezone copyWithZone:zone];
        copy.currently = [self.currently copyWithZone:zone];
        copy.latitude = self.latitude;
        copy.flags = [self.flags copyWithZone:zone];
    }
    
    return copy;
}


@end
