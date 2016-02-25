//
//  VLGovernment.m
//  NotificationsTest
//
//  Created by Viktor Lukashevich on 25.02.16.
//  Copyright © 2016 Viktar Lukashevich. All rights reserved.
//

#import "VLGovernment.h"

NSString* const VLGovernmentTaxLevelDidChangeNotification = @"VLGovernmentTaxLevelDidChangeNotification";
NSString* const VLGovernmentSalaryDidChangeNotification = @"VLGovernmentSalaryDidChangeNotification";
NSString* const VLGovernmentPensionDidChangeNotification = @"VLGovernmentPensionDidChangeNotification";
NSString* const VLGovernmentAveragePriceDidChangeNotification = @"VLGovernmentAveragePriceDidChangeNotification";

NSString* const VLGovernmentTaxLevelUserInfoKey = @"VLGovernmentTaxLevelUserInfoKey";
NSString* const VLGovernmentSalaryUserInfoKey = @"VLGovernmentSalaryUserInfoKey";
NSString* const VLGovernmentPensionUserInfoKey = @"VLGovernmentPensionUserInfoKey";
NSString* const VLGovernmentAveragePriceUserInfoKey = @"VLGovernmentAveragePriceUserInfoKey";

@implementation VLGovernment

- (id)init
{
    self = [super init];
    if (self) {
        _taxLevel = .10f;
        _salary = 1000;
        _pension = 500;
        _averagePrice = 10.f;
    }
    return self;
}

- (void) setTaxLevel:(CGFloat)taxLevel {
    
    _taxLevel = taxLevel;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:taxLevel] forKey:VLGovernmentTaxLevelUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:VLGovernmentTaxLevelDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

- (void) setSalary:(CGFloat)salary {
    
    _salary = salary;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:salary] forKey:VLGovernmentSalaryUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:VLGovernmentSalaryDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

- (void) setPension:(CGFloat)pension {
    
    _pension = pension;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:pension] forKey:VLGovernmentPensionUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:VLGovernmentPensionDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
    
}

- (void) setAveragePrice:(CGFloat)averagePrice {
    
    _averagePrice = averagePrice;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:averagePrice] forKey:VLGovernmentAveragePriceUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:VLGovernmentAveragePriceDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
    
}



@end
