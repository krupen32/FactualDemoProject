//
//  ViewController.h
//  FactualDemoProject
//
//  Created by Krupen on 3/13/16.
//  Copyright © 2016 Krupen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FactualSDK/FactualAPI.h>

#import "CustomTableViewCell.h"
#import "RestaurantModel.h"

@interface ViewController : UIViewController < FactualAPIDelegate , UITableViewDataSource , UITableViewDelegate , UISearchBarDelegate >
{
    NSDictionary *responseDictionary ;
}

@property (strong, nonatomic) FactualAPIRequest *activeRequest ;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

