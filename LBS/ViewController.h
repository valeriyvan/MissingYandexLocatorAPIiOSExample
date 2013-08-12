//
//  ViewController.h
//  LBS
//
//  Created by Valeriy Van on 8/8/13.
//  Copyright (c) 2013 w7software.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate, MKMapViewDelegate>

@property (nonatomic, weak) IBOutlet UITextField *mcc1;
@property (nonatomic, weak) IBOutlet UITextField *mcc2;
@property (nonatomic, weak) IBOutlet UITextField *mcc3;
@property (nonatomic, weak) IBOutlet UITextField *mcc4;
@property (nonatomic, weak) IBOutlet UITextField *mnc1;
@property (nonatomic, weak) IBOutlet UITextField *mnc2;
@property (nonatomic, weak) IBOutlet UITextField *mnc3;
@property (nonatomic, weak) IBOutlet UITextField *mnc4;
@property (nonatomic, weak) IBOutlet UITextField *lac1;
@property (nonatomic, weak) IBOutlet UITextField *lac2;
@property (nonatomic, weak) IBOutlet UITextField *lac3;
@property (nonatomic, weak) IBOutlet UITextField *lac4;
@property (nonatomic, weak) IBOutlet UITextField *cid1;
@property (nonatomic, weak) IBOutlet UITextField *cid2;
@property (nonatomic, weak) IBOutlet UITextField *cid3;
@property (nonatomic, weak) IBOutlet UITextField *cid4;
@property (nonatomic, weak) IBOutlet UITextField *strength1;
@property (nonatomic, weak) IBOutlet UITextField *strength2;
@property (nonatomic, weak) IBOutlet UITextField *strength3;
@property (nonatomic, weak) IBOutlet UITextField *strength4;
@property (nonatomic, weak) IBOutlet MKMapView *mapView;

-(IBAction)hideKeyboard;
-(IBAction)show:(id)sender;
-(IBAction)clear:(id)sender;

@end
