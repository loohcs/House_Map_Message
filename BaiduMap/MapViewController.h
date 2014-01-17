//
//  MapViewController.h
//  House_Map_Message
//
//  Created by 1007 on 13-12-27.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapViewController : UIViewController<BMKMapViewDelegate, BMKSearchDelegate, UIAlertViewDelegate>
{
    BMKPolyline *polyline;
    BMKPointAnnotation *_annotation;
}


@property (nonatomic, strong)BMKMapView *mapView;
@property (nonatomic, assign)CLLocationCoordinate2D coorOne;
@property (nonatomic, assign)CLLocationCoordinate2D coorTwo;

@end
