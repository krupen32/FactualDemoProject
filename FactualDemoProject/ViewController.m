//
//  ViewController.m
//  FactualDemoProject
//
//  Created by Krupen on 3/13/16.
//  Copyright © 2016 Krupen. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

#define row_height 133.0

static NSString *identifier = @"CellID";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
        
    // Register NIB
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:Nil] forCellReuseIdentifier:identifier];
}

#pragma mark - Send Request for Factual API

-(void)sendRequest:(NSString *)searchedCity
{
    NSDictionary *dict = @{
                           @"q" : searchedCity
                           } ;
    
    _activeRequest = [[AppDelegate getAPIObject] get:@"t/restaurants-us" params:dict withDelegate:self] ;
}


#pragma mark - Factual API Request Delegate

-(void)requestComplete:(FactualAPIRequest *)request receivedRawResult:(NSDictionary *)result
{
    NSLog(@"result : %@" , result) ;
    
    // get response from API 
    
    responseDictionary = result ;
    
    // reload Table
    
    self.tableView.delegate = self ;
    self.tableView.dataSource = self ;
    
    [self.tableView reloadData] ;
}

-(void) requestComplete:(FactualAPIRequest *)request failedWithError:(NSError *)error
{
    if (_activeRequest == request)
    {
        NSLog(@"Active request failed with Error:%@", [error localizedDescription]);
    }
}

#pragma mark - UITableView Delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int count = [[[responseDictionary valueForKey:@"response"] valueForKey:@"data"] count] ;
    return count ;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomTableViewCell *cell = (CustomTableViewCell *) [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil)
    {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    RestaurantModel *infoModel = [[RestaurantModel alloc] initWithInfoModel:responseDictionary indexOf:indexPath.row] ;
    
    cell.restaurantName.text = infoModel.restaurantName ;
    cell.restaurantAddress.text = infoModel.restaurantAddress ;
    cell.restaurantType.text = infoModel.restaurantType ;
    cell.restaurantRating.text = infoModel.restaurantRating ;
    
    return cell ;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return row_height ;
}

#pragma mark - Searchbar controller Delegate

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self sendRequest:searchBar.text] ;
    [searchBar resignFirstResponder] ;
}




@end
