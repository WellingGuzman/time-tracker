//
//  DateTimeView.h
//  TimeTracker
//
//  Created by Welling Guzman on 3/31/18.
//  Copyright © 2018 Welling Guzman. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <CoreLocation/CoreLocation.h>

@interface DateTimeViewController : NSViewController <CLLocationManagerDelegate>
{
    NSTimer *_timer;
    NSDateFormatter *_dateFormatter;
    CLLocationManager *_locationManager;
}

- (void) updateTime:(NSTimer *)timer;

@end
