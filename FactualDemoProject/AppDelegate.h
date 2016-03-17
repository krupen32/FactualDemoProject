//
//  AppDelegate.h
//  FactualDemoProject
//
//  Created by Krupen on 3/13/16.
//  Copyright © 2016 Krupen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import <FactualSDK/FactualAPI.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong, nonatomic) FactualAPI *apiObject; 

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


// ---- Factual API Object Init

+(FactualAPI*) getAPIObject ;
+(AppDelegate*) getDelegate ;

@end

