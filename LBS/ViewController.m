//
//  ViewController.m
//  LBS
//
//  Created by Valeriy Van on 8/8/13.
//  Copyright (c) 2013 w7software.com. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "JSON.h"
#import "RadiusMKAnnotation.h"
#import "NSString+intHexValue.h"
#import <QuartzCore/QuartzCore.h>

// DummyAnnotationView http://stackoverflow.com/questions/14916974/ios-custom-mkannotation-object-resembling-mkuserlocation-animation

#pragma mark - DummyAnnotationView

@interface DummyAnnotationView : MKAnnotationView
@end
@implementation DummyAnnotationView
- (id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    imageView.animationImages = @[[UIImage imageNamed:@"Blue circle.png"]/*,[UIImage imageNamed:@"blue-circle-100.png"]*/];
    imageView.animationDuration = 5;
    [imageView startAnimating];
    [self addSubview:imageView];
    return self;
}
@end

#pragma mark - ViewController

@interface ViewController ()
-(void)alertWithTitle:(NSString*)ttl message:(NSString*)msg;
@end

@implementation ViewController

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

-(IBAction)hideKeyboard {
    [self.mcc1 resignFirstResponder];
    [self.mcc2 resignFirstResponder];
    [self.mcc3 resignFirstResponder];
    [self.mcc4 resignFirstResponder];
    [self.mnc1 resignFirstResponder];
    [self.mnc2 resignFirstResponder];
    [self.mnc3 resignFirstResponder];
    [self.mnc4 resignFirstResponder];
    [self.lac1 resignFirstResponder];
    [self.lac2 resignFirstResponder];
    [self.lac3 resignFirstResponder];
    [self.lac4 resignFirstResponder];
    [self.cid1 resignFirstResponder];
    [self.cid2 resignFirstResponder];
    [self.cid3 resignFirstResponder];
    [self.cid4 resignFirstResponder];
    [self.strength1 resignFirstResponder];
    [self.strength2 resignFirstResponder];
    [self.strength3 resignFirstResponder];
    [self.strength4 resignFirstResponder];
}

-(NSDictionary*)gsm_cellWithMcc:(NSString*)mcc mnc:(NSString*)mnc cid:(NSString*)cid lac:(NSString*)lac strength:(NSString*)strength {
    return @{
             @"countrycode": [NSNumber numberWithInt:[mcc intValueRecognizingPrefix]],
             @"operatorid": [NSNumber numberWithInt:[mnc intValueRecognizingPrefix]],
             @"cellid": [NSNumber numberWithInt:[cid intValueRecognizingPrefix]],
             @"lac": [NSNumber numberWithInt:[lac intValueRecognizingPrefix]],
             @"signal_strength": [NSNumber numberWithInt:[strength intValue]],
             @"age": @5555
            };
}

-(NSDictionary*)gsm_cell1 {
    if (![self.mcc1.text isEqualToString:@""] &&
        ![self.mnc1.text isEqualToString:@""] &&
        ![self.cid1.text isEqualToString:@""] &&
        ![self.lac1.text isEqualToString:@""] &&
        ![self.strength1.text isEqualToString:@""])
    {
        return [self gsm_cellWithMcc:self.mcc1.text mnc:self.mnc1.text cid:self.cid1.text lac:self.lac1.text strength:self.strength1.text];
    } else {
        return nil;
    }
}

-(NSDictionary*)gsm_cell2 {
    if (![self.mcc2.text isEqualToString:@""] &&
        ![self.mnc2.text isEqualToString:@""] &&
        ![self.cid2.text isEqualToString:@""] &&
        ![self.lac2.text isEqualToString:@""] &&
        ![self.strength2.text isEqualToString:@""])
    {
        return [self gsm_cellWithMcc:self.mcc2.text mnc:self.mnc2.text cid:self.cid2.text lac:self.lac2.text strength:self.strength2.text];
    } else {
        return nil;
    }
}

-(NSDictionary*)gsm_cell3 {
    if (![self.mcc3.text isEqualToString:@""] &&
        ![self.mnc3.text isEqualToString:@""] &&
        ![self.cid3.text isEqualToString:@""] &&
        ![self.lac3.text isEqualToString:@""] &&
        ![self.strength3.text isEqualToString:@""])
    {
        return [self gsm_cellWithMcc:self.mcc3.text mnc:self.mnc3.text cid:self.cid3.text lac:self.lac3.text strength:self.strength3.text];
    } else {
        return nil;
    }
}

-(NSDictionary*)gsm_cell4 {
    if (![self.mcc4.text isEqualToString:@""] &&
        ![self.mnc4.text isEqualToString:@""] &&
        ![self.cid4.text isEqualToString:@""] &&
        ![self.lac4.text isEqualToString:@""] &&
        ![self.strength4.text isEqualToString:@""])
    {
        return [self gsm_cellWithMcc:self.mcc4.text mnc:self.mnc4.text cid:self.cid4.text lac:self.lac4.text strength:self.strength4.text];
    } else {
        return nil;
    }
}

-(IBAction)show:(id)sender {
    [self hideKeyboard];
    
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://api.lbs.yandex.net/"]];
    [httpClient setParameterEncoding:AFJSONParameterEncoding];
    
    NSMutableArray *gsm_cells = [NSMutableArray array];
    NSDictionary *c = [self gsm_cell1];
    if (c)
        [gsm_cells addObject:c];
    c = [self gsm_cell2];
    if (c)
        [gsm_cells addObject:c];
    c = [self gsm_cell3];
    if (c)
        [gsm_cells addObject:c];
    c = [self gsm_cell4];
    if (c)
        [gsm_cells addObject:c];
        
    NSDictionary *json =
        @{ @"common":
              @{ @"version" : @"1.0",
                 @"api_key" : @"ANAOBFIBAAAAyLtYVwMAI1fSeHdFvOyNceVDxrkqujcYg2YAAAAAAAAAAAAz3sBcbDqe1vaH7bRdWLJ5JfQa6A=="
               },
           @"gsm_cells":gsm_cells
         };
    NSString *json_string = [json JSONRepresentation];
    NSLog(@"JSON запроса Yandex.locator: %@\n", json_string);
    NSDictionary *parameters = @ { @"json" : json_string };
    NSURL *url = [NSURL URLWithString:@"http://api.lbs.yandex.net/"];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:url];
    NSMutableURLRequest *request = [client requestWithMethod:@"POST" path:@"geolocation" parameters:parameters];
    
    [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/xml"]];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:(NSURLRequest *)request
        success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
            NSDictionary *position = [JSON objectForKey:@"position"];
            if (position==nil || ![position isKindOfClass:[NSDictionary class]]) {
                [self alertWithTitle:@"Вероятно, левый ответ Yandex.locator" message:[JSON description]];
                return;
            }
            NSString *latitude = [position objectForKey:@"latitude"];
            NSString *longitude = [position objectForKey:@"longitude"];
            NSString *precision = [position objectForKey:@"precision"];
//            if (latitude==nil || ![latitude isKindOfClass:[NSString class]] ||
//                longitude==nil || ![longitude isKindOfClass:[NSString class]] ||
//                precision==nil || ![precision isKindOfClass:[NSString class]])
//            {
//                [self alertWithTitle:@"Вероятно, левый ответ Yandex.locator" message:[JSON description]];
//                return;
//            }
            
            // показываем кусок карты в 3 раза больше погрешности
            CLLocationCoordinate2D c = CLLocationCoordinate2DMake([latitude floatValue], [longitude floatValue]);
            double precisionInMeters = [precision doubleValue];
            self.mapView.region = MKCoordinateRegionMakeWithDistance(c, precisionInMeters*3, precisionInMeters*3);

            [self.mapView addAnnotation:[RadiusMKAnnotation simpleAnnotationWithCoordinate:c title:nil subtitle:nil radius:precisionInMeters]];

            NSLog(@"Ответ Yandex.locator: %@\n", [JSON description]);
            //[self alertWithTitle:@"Ответ Yandex.locator" message:[JSON description]];

        }
        failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ошибка" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
        }
    ];
                                         
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
}

-(IBAction)clear:(id)sender {
    self.mcc1.text = @"";
    self.mcc2.text = @"";
    self.mcc3.text = @"";
    self.mcc4.text = @"";
    self.mnc1.text = @"";
    self.mnc2.text = @"";
    self.mnc3.text = @"";
    self.mnc4.text = @"";
    self.lac1.text = @"";
    self.lac2.text = @"";
    self.lac3.text = @"";
    self.lac4.text = @"";
    self.cid1.text = @"";
    self.cid2.text = @"";
    self.cid3.text = @"";
    self.cid4.text = @"";
    self.strength1.text = @"";
    self.strength2.text = @"";
    self.strength3.text = @"";
    self.strength4.text = @"";
}

// TODO: ЛИШНЕЕ! Убрать!
- (void)textFieldDidEndEditing:(UITextField *)textField {
    [textField resignFirstResponder];
}

-(void)alertWithTitle:(NSString*)ttl message:(NSString*)msg {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:ttl message:msg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if([annotation isKindOfClass:[RadiusMKAnnotation class]]) {
        DummyAnnotationView *view = (id)[mapView dequeueReusableAnnotationViewWithIdentifier:@"animated"];
        if(view==nil)
            view =[[DummyAnnotationView alloc ] initWithAnnotation:annotation reuseIdentifier:@"animated"];

        RadiusMKAnnotation *radiusMKAnnotation = (RadiusMKAnnotation*)annotation;
        MKCoordinateRegion annotationRegion = MKCoordinateRegionMakeWithDistance(mapView.centerCoordinate, radiusMKAnnotation.radiusInMeters, radiusMKAnnotation.radiusInMeters);
        double ratioOfAnnotationView =  annotationRegion.span.latitudeDelta / mapView.region.span.latitudeDelta;
        CGFloat annotationSize = mapView.bounds.size.width * ratioOfAnnotationView; // TODO: а вообще ширина или высота???
        view.bounds = CGRectMake(0, 0, annotationSize, annotationSize);
        view.backgroundColor = [UIColor clearColor];
        
        //
        //Animate it like any UIView!
        //
        
        CABasicAnimation *theAnimation;
        
        //within the animation we will adjust the "opacity"
        //value of the layer
        theAnimation=[CABasicAnimation animationWithKeyPath:@"opacity"];
        //animation lasts 0.4 seconds
        theAnimation.duration=0.4;
        //and it repeats forever
        theAnimation.repeatCount= HUGE_VALF;
        //we want a reverse animation
        theAnimation.autoreverses=YES;
        //justify the opacity as you like (1=fully visible, 0=unvisible)
        theAnimation.fromValue=[NSNumber numberWithFloat:1.0];
        theAnimation.toValue=[NSNumber numberWithFloat:0.1];
        
        //Assign the animation to your UIImage layer and the
        //animation will start immediately
        [view.layer addAnimation:theAnimation forKey:@"animateOpacity"];
        return view;
    }
    return nil;
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    NSArray *a = [mapView annotations];
    [mapView removeAnnotations:a];
    [mapView addAnnotations:a];
}

@end
