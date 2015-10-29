//
//  Cities+CoreDataProperties.h
//  Westpac
//
//  Created by Muthu Rama on 29/10/2015.
//  Copyright © 2015 Muthu Rama. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Cities.h"

NS_ASSUME_NONNULL_BEGIN

@interface Cities (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *city;
@property (nullable, nonatomic, retain) NSString *lat;
@property (nullable, nonatomic, retain) NSString *lag;

@end

NS_ASSUME_NONNULL_END
