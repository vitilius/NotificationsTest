//
//  VLPensioner.m
//  NotificationsTest
//
//  Created by Viktor Lukashevich on 25.02.16.
//  Copyright © 2016 Viktar Lukashevich. All rights reserved.
//

#import "VLPensioner.h"
#import "VLGovernment.h"

@implementation VLPensioner

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(pensionChangedNotification:)
                   name:VLGovernmentPensionDidChangeNotification
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

- (void)pensionChangedNotification:(NSNotification *)notification {
    
    NSNumber *value = [notification.userInfo objectForKey:VLGovernmentPensionUserInfoKey];
    CGFloat pension = [value floatValue];
    
    _pensionChange = (pension / _pension - 1) * 100;
    
    self.pension = pension;
}

- (void)averagePriceChangedNotification:(NSNotification *)notification {
    
    NSNumber *value = [notification.userInfo objectForKey:VLGovernmentAveragePriceUserInfoKey];
    CGFloat averagePrice = [value floatValue];
    
    _inflationRate = (averagePrice / _averagePrice - 1) * 100;
    
    self.averagePrice = averagePrice;
    
    [self areYouHappy];
}

- (void)areYouHappy {
    
    NSLog(@"Пенсионер: Пенсия изменилась на %3.0f процентов, а инфляция на %3.0f процентов", _pensionChange, _inflationRate);
    
    if (_pensionChange > _inflationRate) {
        NSLog(@"Пенсионер: Ммм, наконец-то мои заслуги перед отечеством оценили финансово!");
    }
    else {
        NSLog(@"Пенсионер: Да за кого они меня принимают! Я за них кровь проливал во второй мировой, а сейчас нищенстовать должен?!");
    }
}



@end
