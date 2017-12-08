//
//  SMCoffeeShopModel.m
//  CoffeeShopsTaskApp
//
//  Created by Syngmaster on 08/12/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMCoffeeShopModel.h"

@implementation SMCoffeeShopModel

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    
    self = [super init];
    if (self) {
        
        self.shopID = [dict valueForKey:@"id"];
        self.shopName = [dict valueForKey:@"name"];
        
        //*** creating the address string from addressArray components
        
        NSArray *addressArray = [[dict valueForKey:@"location"] valueForKey:@"formattedAddress"];
        self.shopAddress = [addressArray componentsJoinedByString:@" "];
    }
    
    return self;
}

@end
