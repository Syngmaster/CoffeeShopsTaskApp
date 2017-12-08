//
//  SMServerManager.m
//  CoffeeShopsTaskApp
//
//  Created by Syngmaster on 08/12/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMServerManager.h"
#import "SMCoffeeShopModel.h"
#import "SMCoffeeShopDetailsModel.h"
#import "AFNetworking.h"

@interface SMServerManager ()

@property (strong, nonatomic) NSString *baseURL;
@property (strong, nonatomic) NSString *tailURL;
@property (strong, nonatomic) AFHTTPSessionManager *manager;

@end

@implementation SMServerManager

+ (SMServerManager *)sharedManager {
    
    static SMServerManager* manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[SMServerManager alloc] init];
    });
    
    return manager;
    
}

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        NSString *baseURL = @"https://api.foursquare.com/v2/venues/";
        NSString *tailURL = @"&client_id=N5CKNJCYXHXEDDZFDJPZFL0BH1G0HARFJ0GLQNAEAKCNISFN&client_secret=I3XIPBU0QTB4TFMOPUMVDZCCKVZY5L5R3FEUWKZC1N4SFCG4&v=20171205";
        self.manager = manager;
        self.baseURL = baseURL;
        self.tailURL = tailURL;
    }
    
    return self;
}

- (void)getListOfCoffeeShopsOnComplete:(void(^)(NSArray *resultArray))completionHandler {
    
    NSString *paramURL = @"search?near=Cork&categoryId=4bf58dd8d48988d1e0931735&limit=50";
    NSString *resultURL = [NSString stringWithFormat:@"%@%@%@",self.baseURL,paramURL,self.tailURL];
    
    [self.manager GET:resultURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *arrayOfVenues = [[responseObject valueForKey:@"response"] valueForKey:@"venues"];
        
        //*** parsing JSON response into SMCoffeeShopModel objects
        
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dict in arrayOfVenues) {
            SMCoffeeShopModel *shop = [[SMCoffeeShopModel alloc] initWithDictionary:dict];
            [array addObject:shop];
        }
        
        completionHandler(array);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        completionHandler(nil);
        
    }];
    
}

- (void)getDetailsOfCoffeeShop:(NSString *)shopID onCompletion:(void (^)(SMCoffeeShopDetailsModel *shopDetails))completionHandler {
    
    NSString *resultURL = [NSString stringWithFormat:@"%@%@?%@",self.baseURL, shopID, self.tailURL];
    [self.manager GET:resultURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *shopDictionary = [[responseObject valueForKey:@"response"] valueForKey:@"venue"];
        
        //*** parsing JSON response into SMCoffeeShopDetailsModel object
        
        SMCoffeeShopDetailsModel *shopDetails = [[SMCoffeeShopDetailsModel alloc] initWithDictionary:shopDictionary];
        
        completionHandler(shopDetails);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        completionHandler(nil);
        
    }];
    
}

@end
