//
//  SMCoffeeShopDetailsModel.h
//  CoffeeShopsTaskApp
//
//  Created by Syngmaster on 08/12/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMCoffeeShopDetailsModel : NSObject

@property (assign, nonatomic) double shopRating;
@property (strong, nonatomic) NSString *shopPhoneNumber;
@property (strong, nonatomic) NSString *shopWebsite;
@property (strong, nonatomic) NSString *shopAddress;
@property (strong, nonatomic) NSString *shopPhotoURL;
@property (strong, nonatomic) NSString *shopOpenTime;
@property (strong, nonatomic) NSArray *reviewsArray;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
