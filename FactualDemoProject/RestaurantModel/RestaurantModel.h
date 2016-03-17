//
//  RestaurantModel.h
//  FactualDemoProject
//
//  Created by Krupen on 3/13/16.
//  Copyright © 2016 Krupen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RestaurantModel : NSObject

// Restaurant Dictionary

@property (strong , nonatomic) NSDictionary *restaurantDictionary ;
@property (strong , nonatomic) NSArray *dataArray ;

@property (strong , nonatomic) NSString *restaurantName ;
@property (strong , nonatomic) NSString *restaurantAddress ;
@property (strong , nonatomic) NSString *restaurantType ;
@property (strong , nonatomic) NSString *restaurantRating ;


//

- (id)initWithInfoModel:(NSDictionary *)dictionary indexOf:(NSInteger)index ;

@end
