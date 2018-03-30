//
//  AppDelegate.m
//  TimeTracker
//
//  Created by Welling Guzman on 3/26/18.
//  Copyright © 2018 Welling Guzman. All rights reserved.
//

#import "AppDelegate.h"
#import "MainWindowController.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)dealloc
{
    [_mainWindowController release];
    _mainWindowController = nil;

    [super dealloc];
}

- (void)applicationWillFinishLaunching:(NSNotification *)notification
{
    _mainWindowController = [[MainWindowController alloc] initWithWindowNibName:@"MainWindow"];
    [_mainWindowController showWindow:self];
    [_mainWindowController.window setMovableByWindowBackground:YES];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [_mainWindowController.window setLevel:NSFloatingWindowLevel];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
