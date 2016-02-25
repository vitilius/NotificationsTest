//
//  VLPensioner.h
//  NotificationsTest
//
//  Created by Viktor Lukashevich on 25.02.16.
//  Copyright © 2016 Viktar Lukashevich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface VLPensioner : NSObject

@property (assign, nonatomic) CGFloat pension;
@property (assign, nonatomic) CGFloat averagePrice;
@property (assign, nonatomic) CGFloat inflationRate;
@property (assign, nonatomic) CGFloat pensionChange;


@end
