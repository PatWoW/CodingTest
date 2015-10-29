

#import <Foundation/Foundation.h>



@interface Hourly : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *summary;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSArray *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
