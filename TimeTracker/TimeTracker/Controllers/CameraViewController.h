//
//  CameraViewController.h
//  TimeTracker
//
//  Created by Welling Guzman on 4/15/18.
//  Copyright © 2018 Welling Guzman. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AVFoundation/AVFoundation.h>

@interface CameraViewController : NSViewController
{
    AVCaptureSession *_session;
    AVCaptureVideoPreviewLayer *_previewLayer;
}

@end
