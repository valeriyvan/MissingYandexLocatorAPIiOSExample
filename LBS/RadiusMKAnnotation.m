//
//  RadiusMKAnnotation.m
//  LBS
//
//  Created by Valeriy Van on 13.08.13.
//  Copyright (c) 2013 w7software.com. All rights reserved.
//

#import "RadiusMKAnnotation.h"

@implementation RadiusMKAnnotation

-(id)initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString*)title subtitle:(NSString*)subtitle radius:(double)radius {
    if ((self = [super init])) {
        _coordinate = coordinate;
        if (title)
            _title = [title copy];
        if (subtitle)
            _subtitle = [subtitle copy];
        self.radiusInMeters = radius;
    }
	return self;
}

-(id)initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString*)title subtitle:(NSString*)subtitle {
    return [self initWithCoordinate:coordinate title:title subtitle:subtitle radius:0];
}

// TODO: autorelease здесь нужно?
+(RadiusMKAnnotation*)simpleAnnotationWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString*)title subtitle:(NSString*)subtitle {
    return [[[RadiusMKAnnotation alloc] initWithCoordinate:coordinate title:title subtitle:subtitle] autorelease];
}

// TODO: autorelease здесь нужно?
+(RadiusMKAnnotation*)simpleAnnotationWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString*)title subtitle:(NSString*)subtitle radius:(double)radius {
    return [[[RadiusMKAnnotation alloc] initWithCoordinate:coordinate title:title subtitle:subtitle radius:radius] autorelease];
}

-(CLLocationCoordinate2D)coordinate {
    return _coordinate;
}

// TODO: интересно, в объявлении протокола MKAnnotation title и subtitle уже объявлены copy.
// Правильная у меня реализация?

-(NSString*)title {
    return [_title copy];
}

-(NSString*)subtitle {
    return [_subtitle copy];
}

- (void)dealloc {
    [_title release];
    [_subtitle release];
    [super dealloc];
}

@end
