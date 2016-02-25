//
//  VLGovernment.h
//  NotificationsTest
//
//  Created by Viktor Lukashevich on 25.02.16.
//  Copyright © 2016 Viktar Lukashevich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern NSString *const VLGovernmentTaxLevelDidChangeNotification;
extern NSString *const VLGovernmentSalaryDidChangeNotification;
extern NSString *const VLGovernmentPensionDidChangeNotification;
extern NSString *const VLGovernmentAveragePriceDidChangeNotification;

extern NSString *const VLGovernmentTaxLevelUserInfoKey;
extern NSString *const VLGovernmentSalaryUserInfoKey;
extern NSString *const VLGovernmentPensionUserInfoKey;
extern NSString *const VLGovernmentAveragePriceUserInfoKey;

@interface VLGovernment : NSObject

@property (assign, nonatomic) CGFloat taxLevel;
@property (assign, nonatomic) CGFloat salary;
@property (assign, nonatomic) CGFloat pension;
@property (assign, nonatomic) CGFloat averagePrice;

@end
