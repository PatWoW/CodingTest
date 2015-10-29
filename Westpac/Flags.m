

#import "Flags.h"


NSString *const kFlagsSources = @"sources";
NSString *const kFlagsUnits = @"units";


@interface Flags ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Flags

@synthesize sources = _sources;
@synthesize units = _units;


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
            self.sources = [self objectOrNilForKey:kFlagsSources fromDictionary:dict];
            self.units = [self objectOrNilForKey:kFlagsUnits fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForSources = [NSMutableArray array];
    for (NSObject *subArrayObject in self.sources) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSources addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSources addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSources] forKey:kFlagsSources];
    [mutableDict setValue:self.units forKey:kFlagsUnits];

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

    self.sources = [aDecoder decodeObjectForKey:kFlagsSources];
    self.units = [aDecoder decodeObjectForKey:kFlagsUnits];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_sources forKey:kFlagsSources];
    [aCoder encodeObject:_units forKey:kFlagsUnits];
}

- (id)copyWithZone:(NSZone *)zone
{
    Flags *copy = [[Flags alloc] init];
    
    if (copy) {

        copy.sources = [self.sources copyWithZone:zone];
        copy.units = [self.units copyWithZone:zone];
    }
    
    return copy;
}


@end
