//
//  VLBusinessman.m
//  NotificationsTest
//
//  Created by Viktor Lukashevich on 25.02.16.
//  Copyright © 2016 Viktar Lukashevich. All rights reserved.
//

#import "VLBusinessman.h"
#import "VLGovernment.h"

@implementation VLBusinessman

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self) {

        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(taxLevelChangedNotification:)
                   name:VLGovernmentTaxLevelDidChangeNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(averagePriceChangedNotification:)
                   name:VLGovernmentAveragePriceDidChangeNotification
                 object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notification

- (void)taxLevelChangedNotification:(NSNotification *)notification {
    
    NSNumber *value = [notification.userInfo objectForKey:VLGovernmentSalaryUserInfoKey];
    CGFloat taxLevel = [value floatValue];
    
    CGFloat profit1 = self.salary - self.salary * self.taxLevel;
    
    self.taxLevel = taxLevel;
    
    CGFloat profit2 = self.salary - self.salary * self.taxLevel;
    
    _profitChange = (profit1 / profit2 - 1) * 100;
}

- (void)averagePriceChangedNotification:(NSNotification *)notification {
    
    NSNumber *value = [notification.userInfo objectForKey:VLGovernmentAveragePriceUserInfoKey];
    CGFloat averagePrice = [value floatValue];
    
    _inflationRate = (averagePrice / _averagePrice - 1) * 100;
    
    self.averagePrice = averagePrice;
    
    
    [self areYouHappy];
}

- (void)areYouHappy {
    
    NSLog(@"Бизнесмен: Прибыль изменилась на %3.0f процентов, а инфляция на %3.0f процентов", _profitChange, _inflationRate);
    
    if (_profitChange > _inflationRate) {
        NSLog(@"Бизнесмен: В этой стране можно делать бизнес, здесь есть будущее!");
    }
    else {
        NSLog(@"Бизнесмен: Перспектив - ноль, пора сворачивать производство и валить!");
    }
}


@end
