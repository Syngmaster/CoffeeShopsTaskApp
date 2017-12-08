//
//  SMReviewsViewCell.m
//  CoffeeShopsTaskApp
//
//  Created by Syngmaster on 07/12/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMReviewsViewCell.h"
#import "SMReviewModel.h"

@implementation SMReviewsViewCell

- (void)configureCellWithDetails:(SMReviewModel *)model {
    
    self.reviewUserNameLabel.text = model.reviewUserName;
    self.reviewDateLabel.text = model.reviewDate;
    self.reviewBodyLabel.text = model.reviewTextBody;
    
}

@end
