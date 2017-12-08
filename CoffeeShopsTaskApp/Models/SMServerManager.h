//
//  SMServerManager.h
//  CoffeeShopsTaskApp
//
//  Created by Syngmaster on 08/12/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SMCoffeeShopDetailsModel;

@interface SMServerManager : NSObject

+ (SMServerManager *)sharedManager;

- (void)getListOfCoffeeShopsOnComplete:(void(^)(NSArray *resultArray))completionHandler;
- (void)getDetailsOfCoffeeShop:(NSString *)shopID onCompletion:(void (^)(SMCoffeeShopDetailsModel *shopDetails))completionHandler;

@end
