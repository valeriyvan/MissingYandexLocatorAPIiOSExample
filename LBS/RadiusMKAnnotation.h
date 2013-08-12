//
//  RadiusMKAnnotation.h
//  LBS
//
//  Created by Valeriy Van on 13.08.13.
//  Copyright (c) 2013 w7software.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapKit/MapKit.h"

@interface RadiusMKAnnotation : NSObject <MKAnnotation> {
    CLLocationCoordinate2D _coordinate;
    NSString *_title;
    NSString *_subtitle;
}

+(RadiusMKAnnotation*)simpleAnnotationWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString*)title subtitle:(NSString*)subtitle;
+(RadiusMKAnnotation*)simpleAnnotationWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString*)title subtitle:(NSString*)subtitle radius:(double)radius;
-(id)initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString*)title subtitle:(NSString*)subtitle;
-(id)initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString*)title subtitle:(NSString*)subtitle radius:(double)radius;

@property (nonatomic) double radiusInMeters;

@end
