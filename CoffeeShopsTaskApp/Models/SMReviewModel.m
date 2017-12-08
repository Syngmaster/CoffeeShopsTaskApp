//
//  SMReviewModel.m
//  CoffeeShopsTaskApp
//
//  Created by Syngmaster on 08/12/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMReviewModel.h"

@implementation SMReviewModel

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    
    self = [super init];
    if (self) {
        
        NSDictionary *userDictionary = [dict valueForKey:@"user"];
        self.reviewUserName = [NSString stringWithFormat:@"%@ %@",
                               [userDictionary valueForKey:@"firstName"] ? [userDictionary valueForKey:@"firstName"] : @"",
                               [userDictionary valueForKey:@"lastName"] ? [userDictionary valueForKey:@"lastName"] : @""];
        
        self.reviewTextBody = [dict valueForKey:@"text"];
        
        //*** formatting the date received from JSON into readable format
        
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:[[dict valueForKey:@"createdAt"] doubleValue]];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        self.reviewDate = [formatter stringFromDate:date];

    }
    
    return self;
}

@end
