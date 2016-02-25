//
//  VLDoctor.m
//  NotificationsTest
//
//  Created by Viktor Lukashevich on 25.02.16.
//  Copyright © 2016 Viktar Lukashevich. All rights reserved.
//

#import "VLDoctor.h"
#import "VLGovernment.h"

@implementation VLDoctor

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(salaryChangedNotification:)
                   name:VLGovernmentSalaryDidChangeNotification
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

- (void)salaryChangedNotification:(NSNotification *)notification {
    
    NSNumber *salaryValue = [notification.userInfo objectForKey:VLGovernmentSalaryUserInfoKey];
    CGFloat changedSalary = [salaryValue floatValue];
    
    _salaryChange = (changedSalary / _salary - 1) * 100;
    
    self.salary = changedSalary;

}

- (void)averagePriceChangedNotification:(NSNotification *)notification {
    
    NSNumber *averagePriceValue = [notification.userInfo objectForKey:VLGovernmentAveragePriceUserInfoKey];
    CGFloat averagePrice = [averagePriceValue floatValue];
    
    _inflationRate = (averagePrice / _averagePrice - 1) * 100;
    
    self.averagePrice = averagePrice;
    
    [self areYouHappy];
}

- (void)areYouHappy {
    
    NSLog(@"Доктор: Зарплата изменилась на %3.0f процентов, а инфляция на %3.0f процентов", _salaryChange, _inflationRate);
    
    if (_salaryChange > _inflationRate) {
        NSLog(@"Доктор: Ммм, моя зарплата растет быстрее инфляции, и, похоже, меня начали ценить!");
    }
    else {
        NSLog(@"Доктор: Это государство с его бездумной политикой меня доканает!!!");
    }
}


@end
