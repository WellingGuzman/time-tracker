//
//  MainWindowController.h
//  TimeTracker
//
//  Created by Welling Guzman on 3/27/18.
//  Copyright © 2018 Welling Guzman. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MainWindowController : NSWindowController
{
    IBOutlet NSButton *_button;
}

- (IBAction)takeScreenshot:(id)sender;

@end
