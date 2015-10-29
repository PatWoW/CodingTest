
#import <Foundation/Foundation.h>



@interface Daily : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *summary;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSArray *forecastData;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
