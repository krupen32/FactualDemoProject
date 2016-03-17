//
//  CustomTableViewCell.h
//  FactualDemoProject
//
//  Created by Krupen on 3/13/16.
//  Copyright © 2016 Krupen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *restaurantName;
@property (strong, nonatomic) IBOutlet UILabel *restaurantAddress;
@property (strong, nonatomic) IBOutlet UILabel *restaurantType;
@property (strong, nonatomic) IBOutlet UILabel *restaurantRating;

@end
