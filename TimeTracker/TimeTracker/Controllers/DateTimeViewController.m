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
@property (nonatomic, assign) IBOutlet NSImageView *weatherIcon;
@property (nonatomic, assign) IBOutlet NSTextField *weatherTemp;

@end

@implementation DateTimeViewController

- (void) dealloc
{
    [_dateFormatter release];
    _dateFormatter = nil;

    [_timer release];
    _timer = nil;

    [_locationManager release];
    _locationManager = nil;

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

    // Get location
    _locationManager = [[CLLocationManager alloc] init];
    [_locationManager setDelegate:self];
    [_locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [_locationManager startUpdatingLocation];

    // Default weather icon
    _weatherIcon.image = [NSImage imageNamed:@"unknown"];
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

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSString *url = [NSString stringWithFormat:@"http://api.wunderground.com/api/%@/conditions/q/%g,%g.json", @"<api-key>", newLocation.coordinate.latitude, newLocation.coordinate.longitude];

    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *weatherURL = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:weatherURL];

    NSURLSessionDataTask *requestTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *connectionError) {
        NSDictionary *dir = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];

        if (connectionError != nil) return;
        if ([dir count] == 0) return;

        [_dateFormatter setDateFormat:@"HH.mm"];

        NSString *night = @"";
        NSInteger currentTime = [[_dateFormatter stringFromDate:[NSDate date]] integerValue];

        if (currentTime > 18 || currentTime < 6) {
            night = @"nt_";
        }

        NSString *imageName = [NSString stringWithFormat:@"%@%@", night, dir[@"current_observation"][@"icon"]];
        NSString *numberString = [NSString stringWithFormat:@"%g°C", round([dir[@"current_observation"][@"temp_c"] doubleValue])];

        dispatch_async(dispatch_get_main_queue(), ^{
            _weatherIcon.image = [NSImage imageNamed:imageName];
            [_weatherTemp setStringValue:numberString];
        });
    }];

    [requestTask resume];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"error!");
}


@end
