//
//  RestaurantModel.h
//  FactualDemoProject
//
//  Created by Krupen on 3/13/16.
//  Copyright © 2016 Krupen. All rights reserved.
//

#import "RestaurantModel.h"

@implementation RestaurantModel

// ----------------- Get Information  -------------------- //

- (id)initWithInfoModel:(NSDictionary *)dictionary indexOf:(NSInteger)index
{
    self = [super init];
    if (self)
    {
        // Any custom setup work goes here
        
        self.restaurantDictionary = dictionary ;
        [self setModelWithIndex:index] ;
    }
    return self;
}

-(void)setModelWithIndex:(NSInteger)index
{
    // Get Information
    
    _dataArray = [[_restaurantDictionary valueForKey:@"response"] valueForKey:@"data"] ;
    
    self.restaurantName = [[_dataArray objectAtIndex:index] valueForKey:@"name"] ;
    self.restaurantAddress = [[_dataArray objectAtIndex:index] valueForKey:@"address"] ;
    
    NSString *restaurantType = [NSString stringWithFormat:@"%@" , [[[[_dataArray objectAtIndex:index] valueForKey:@"category_labels"] objectAtIndex:0] lastObject]] ;
    
    self.restaurantType =  restaurantType ;
    
    NSString *restaurantRating = [NSString stringWithFormat:@"%@" , [[_dataArray objectAtIndex:index] valueForKey:@"rating"]] ;
    
    self.restaurantRating = restaurantRating ;
   
}


@end
