//
//  MapViewController.h
//  SmartCamera
//
//  Created by  shihongliang on 11/5/18.
//  Copyright © 2018  shihongliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface MapViewController : UIViewController<MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITextField *searchText;
@property (retain,nonatomic) CLLocationManager* locationManager;
@property (strong, nonatomic) NSMutableArray *matchingItems;
-(IBAction)textFieldReturn:(id)sender;
@end

NS_ASSUME_NONNULL_END
