//
//  SMCoffeeShopDetailsModel.m
//  CoffeeShopsTaskApp
//
//  Created by Syngmaster on 08/12/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMCoffeeShopDetailsModel.h"
#import "SMReviewModel.h"

@implementation SMCoffeeShopDetailsModel

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    
    self = [super init];
    if (self) {
        
        self.shopRating = [[dict valueForKey:@"rating"] doubleValue];
        self.shopPhoneNumber = [[dict valueForKey:@"contact"] valueForKey:@"phone"];
        self.shopWebsite = [dict valueForKey:@"url"];
        self.shopOpenTime = [[dict valueForKey:@"hours"] valueForKey:@"status"];
        
        //*** creating the address string from addressArray components
        
        NSArray *addressArray = [[dict valueForKey:@"location"] valueForKey:@"formattedAddress"];
        self.shopAddress = [addressArray componentsJoinedByString:@" "];

        NSDictionary *photoDict = [dict valueForKey:@"bestPhoto"];
        self.shopPhotoURL = [NSString stringWithFormat:@"%@original%@",[photoDict valueForKey:@"prefix"],[photoDict valueForKey:@"suffix"]];
        
        //*** extracting reviews dictionaries from JSON response and parsing them into SMReviewModel objects
        
        NSArray *tipsGroups = [[dict valueForKey:@"tips"] valueForKey:@"groups"];
        NSArray *reviewsArray = [[tipsGroups firstObject] valueForKey:@"items"];
        
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dict in reviewsArray) {
            SMReviewModel *review = [[SMReviewModel alloc] initWithDictionary:dict];
            [array addObject:review];
        }
        self.reviewsArray = array;
        
    }
    return self;
}



@end
