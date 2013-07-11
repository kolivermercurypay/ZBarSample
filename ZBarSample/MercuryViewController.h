//
//  MercuryViewController.h
//  ZBarSample
//
//  Created by Kevin Oliver on 7/10/13.
//  Copyright (c) 2013 Kevin Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"

@interface MercuryViewController : UIViewController <ZBarReaderDelegate>

- (IBAction)ScanQRCodeButton_TouchUpInside:(id)sender;

@end
