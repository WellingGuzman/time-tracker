//
//  CameraViewController.m
//  TimeTracker
//
//  Created by Welling Guzman on 4/15/18.
//  Copyright © 2018 Welling Guzman. All rights reserved.
//

#import "CameraViewController.h"

@interface CameraViewController ()

@property (nonatomic, assign) IBOutlet CameraView *cameraView;

@end

@implementation CameraViewController

- (NSNibName)nibName
{
    return @"CameraView";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    AVCaptureDeviceInput *input;
    
    _camerView = [[CameraView alloc] initWithFrame:[self.view bounds]];
    
    [[self view] setWantsLayer: YES];
    [[self view] addSubview:_camerView];
    
    _session = [[AVCaptureSession alloc] init];
    if ([_session canSetSessionPreset:AVCaptureSessionPresetHigh]) {
        [_session setSessionPreset:AVCaptureSessionPresetHigh];
    }

    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for (AVCaptureDevice *device in devices) {
        NSLog(@"%@", device);
    }
    
    input = [[AVCaptureDeviceInput alloc] initWithDevice:devices[0] error:nil];

    if ([_session canAddInput:input]) {
        [_session addInput:input];
    }

    _previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_session];
    [_previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [_previewLayer setBounds:[self.view bounds]];
    [self.view.layer addSublayer:_previewLayer];
    
    
    [_session startRunning];
}

@end
