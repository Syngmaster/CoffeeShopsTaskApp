//
//  SMCoffeeShopModel.h
//  CoffeeShopsTaskApp
//
//  Created by Syngmaster on 08/12/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMCoffeeShopModel : NSObject

@property (strong, nonatomic) NSString *shopID;
@property (strong, nonatomic) NSString *shopName;
@property (strong, nonatomic) NSString *shopAddress;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
