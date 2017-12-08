//
//  SMReviewModel.h
//  CoffeeShopsTaskApp
//
//  Created by Syngmaster on 08/12/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMReviewModel : NSObject

@property (strong, nonatomic) NSString *reviewUserName;
@property (strong, nonatomic) NSString *reviewDate;
@property (strong, nonatomic) NSString *reviewTextBody;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
