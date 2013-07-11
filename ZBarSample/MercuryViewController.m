//
//  MercuryViewController.m
//  ZBarSample
//
//  Created by Kevin Oliver on 7/10/13.
//  Copyright (c) 2013 Kevin Oliver. All rights reserved.
//

#import "MercuryViewController.h"

@interface MercuryViewController ()

@end

@implementation MercuryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [super dealloc];
}

- (IBAction)ScanQRCodeButton_TouchUpInside:(id)sender {
    
    // Present a barcode reader that scans from the camera feed
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
    reader.supportedOrientationsMask = ZBarOrientationMaskAll;
    
    // Disable rarely used I2/5 to improve performance
    ZBarImageScanner *scanner = reader.scanner;
    [scanner setSymbology: ZBAR_I25 config: ZBAR_CFG_ENABLE to: 0];
    
    // Present and release the controller
    [self presentModalViewController: reader animated: YES];
    [reader release];
    
}

- (void) imagePickerController: (UIImagePickerController*) reader didFinishPickingMediaWithInfo: (NSDictionary*) info {
    
    id<NSFastEnumeration> results = [info objectForKey: ZBarReaderControllerResults];
    
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        // Just grab the first barcode
        break;
    
    // Dismiss the controller
    [reader dismissModalViewControllerAnimated: YES];
    
    // Display data for Demo purposes
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle: @"QR Code Data"
                          message: symbol.data // Here is string value of the QR Code
                          delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles: nil];
    
    [alert show];
    [alert release];
}


@end
