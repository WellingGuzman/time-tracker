//
//  AppDelegate.h
//  TimeTracker
//
//  Created by Welling Guzman on 3/26/18.
//  Copyright © 2018 Welling Guzman. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class MainWindowController;

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    MainWindowController *_mainWindowController;
}

@end

