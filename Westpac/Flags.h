
#import <Foundation/Foundation.h>



@interface Flags : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *sources;
@property (nonatomic, strong) NSString *units;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
