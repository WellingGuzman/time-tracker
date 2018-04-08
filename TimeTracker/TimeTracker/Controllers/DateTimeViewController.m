//
//  DateTimeView.m
//  TimeTracker
//
//  Created by Welling Guzman on 3/31/18.
//  Copyright © 2018 Welling Guzman. All rights reserved.
//

#import "DateTimeViewController.h"

@interface DateTimeViewController ()

@property (nonatomic, assign) IBOutlet NSTextField *dayOfTheWeekLabel;
@property (nonatomic, assign) IBOutlet NSTextField *monthAnDayLabel;
@property (nonatomic, assign) IBOutlet NSTextField *yearLabel;
@property (nonatomic, assign) IBOutlet NSTextField *timeLabel;

@end

@implementation DateTimeViewController

- (void) dealloc
{
    [_dateFormatter release];
    _dateFormatter = nil;

    [_timer release];
    _timer = nil;

    [super dealloc];
}
- (NSNibName)nibName
{
    return @"DateTime";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do view setup here.
    
    [self updateTime:nil];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
}

- (void)updateTime:(NSTimer *)timer
{
    if (!_dateFormatter) {
        _dateFormatter = [[NSDateFormatter alloc] init];
    }
    
    NSDate *date = [NSDate date];
    
    // Hour
    [_dateFormatter setDateFormat:@"HH:mm:ss"];
    [_timeLabel setStringValue: [_dateFormatter stringFromDate:date]];
    
    // Year
    [_dateFormatter setDateFormat:@"yyyy"];
    [_yearLabel setStringValue:[_dateFormatter stringFromDate:date]];
    
    // Month day
    [_dateFormatter setDateFormat:@"MMMM dd"];
    [_monthAnDayLabel setStringValue:[_dateFormatter stringFromDate:date]];
    
    // Day of the week
    [_dateFormatter setDateFormat:@"EEEE"];
    [_dayOfTheWeekLabel setStringValue:[_dateFormatter stringFromDate:date]];
}

@end
