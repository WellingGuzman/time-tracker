//
//  MainWindowController.m
//  TimeTracker
//
//  Created by Welling Guzman on 3/27/18.
//  Copyright © 2018 Welling Guzman. All rights reserved.
//

#import "MainWindowController.h"

@interface MainWindowController ()

@property (nonatomic, assign) IBOutlet NSImageView *imageView;

@end

@implementation MainWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (IBAction)takeScreenshot:(id)sender
{
    NSLog(@"taking screenshot...");
    
    NSRect screenRect = [[NSScreen mainScreen] frame];
    CGImageRef cgImageRef = CGWindowListCreateImage(
                                                 screenRect,
                                                 kCGWindowListOptionOnScreenOnly,
                                                 kCGNullWindowID,
                                                 kCGWindowImageDefault
                                                 );
    NSBitmapImageRep *imageRep = [[NSBitmapImageRep alloc] initWithCGImage:cgImageRef];
    CGImageRelease(cgImageRef);
    NSImage *image = [[NSImage alloc] init];
    [image addRepresentation:imageRep];
    
    [self.imageView setImage: image];

    NSLog(@"Done");
}

@end
