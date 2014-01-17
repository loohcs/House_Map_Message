//
//  MapViewController.m
//  House_Map_Message
//
//  Created by 1007 on 13-12-27.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "MapViewController.h"

@interface RouteAnnotation : BMKPointAnnotation
{
	int _type; ///<0:起点 1：终点 2：公交 3：地铁 4:驾乘 5:途经点
	int _degree;
}

@property (nonatomic) int type;
@property (nonatomic) int degree;
@end

@implementation RouteAnnotation

@synthesize type = _type;
@synthesize degree = _degree;
@end

@interface UIImage(InternalMethod)

- (UIImage*)imageRotatedByDegrees:(CGFloat)degrees;

@end

@implementation UIImage(InternalMethod)

- (UIImage*)imageRotatedByDegrees:(CGFloat)degrees
{
    
    CGFloat width = CGImageGetWidth(self.CGImage);
    CGFloat height = CGImageGetHeight(self.CGImage);
    
	CGSize rotatedSize;
    
    rotatedSize.width = width;
    rotatedSize.height = height;
    
	UIGraphicsBeginImageContext(rotatedSize);
	CGContextRef bitmap = UIGraphicsGetCurrentContext();
	CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
	CGContextRotateCTM(bitmap, degrees * M_PI / 180);
	CGContextRotateCTM(bitmap, M_PI);
	CGContextScaleCTM(bitmap, -1.0, 1.0);
	CGContextDrawImage(bitmap, CGRectMake(-rotatedSize.width/2, -rotatedSize.height/2, rotatedSize.width, rotatedSize.height), self.CGImage);
	UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return newImage;
}

@end


@interface MapViewController ()

@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(leftBarAction)];
    self.navigationItem.leftBarButtonItem = leftBar;
    
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(rightBarAction)];
    self.navigationItem.rightBarButtonItem = rightBar;
    
    _mapView = [[BMKMapView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, SCREEN_HEIGHT-44)];
    _mapView.rotation = 90;
    _mapView.overlooking = -30;
    
    //打开实时路况图层
    //[_mapView setMapType:BMKMapTypeTrafficOn];
    
    
    _mapView.showMapScaleBar = true;
    _mapView.mapScaleBarPosition = CGPointMake(240,280);
    
    self.view = _mapView;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//普通态
-(IBAction)startLocation:(id)sender
{
    NSLog(@"进入普通定位态");
    _mapView.showsUserLocation = NO;//先关闭显示的定位图层
    _mapView.userTrackingMode = BMKUserTrackingModeNone;//设置定位的状态
    _mapView.showsUserLocation = YES;//显示定位图层
}
//罗盘态
-(IBAction)startFollowHeading:(id)sender
{
    NSLog(@"进入罗盘态");
    _mapView.showsUserLocation = NO;
    _mapView.userTrackingMode = BMKUserTrackingModeFollowWithHeading;
    _mapView.showsUserLocation = YES;
    
}
//跟随态
-(IBAction)startFollowing:(id)sender
{
    NSLog(@"进入跟随态");
    _mapView.showsUserLocation = NO;
    _mapView.userTrackingMode = BMKUserTrackingModeFollow;
    _mapView.showsUserLocation = YES;
    
}
//停止定位
-(IBAction)stopLocation:(id)sender
{
    _mapView.userTrackingMode = BMKUserTrackingModeNone;
    _mapView.showsUserLocation = NO;
}

/**
 *在地图View将要启动定位时，会调用此函数
 *@param mapView 地图View
 */
- (void)mapViewWillStartLocatingUser:(BMKMapView *)mapView
{
	NSLog(@"start locate");
}

/**
 *用户位置更新后，会调用此函数
 *@param mapView 地图View
 *@param userLocation 新的用户位置
 */

- (void)mapView:(BMKMapView *)mapView didUpdateUserLocation:(BMKUserLocation *)userLocation
{
	if (userLocation != nil) {
		NSLog(@"%f %f", userLocation.location.coordinate.latitude, userLocation.location.coordinate.longitude);
	}
	
}
/**
 *在地图View停止定位后，会调用此函数
 *@param mapView 地图View
 */
- (void)mapViewDidStopLocatingUser:(BMKMapView *)mapView
{
    NSLog(@"stop locate");
}

/**
 *定位失败后，会调用此函数
 *@param mapView 地图View
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)mapView:(BMKMapView *)mapView didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"location error");
}


- (void)leftBarAction
{
    //开启卫星地图
//    [_mapView setMapType:BMKMapTypeSatellite];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBarAction
{
    //切换为普通地图
    //[_mapView setMapType:BMKMapTypeStandard];
}

- (void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate = self;
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil;
}

#pragma mark 底图手势开关

- (IBAction)zoomSwitchAction:(UISwitch *)sender {
    UISwitch *tempSwitch = (UISwitch *)sender;
    _mapView.zoomEnabled = [tempSwitch isOn];
}

- (IBAction)moveSwitchAction:(UISwitch *)sender {
    UISwitch *tempSwitch = (UISwitch *)sender;
    _mapView.scrollEnabled = [tempSwitch isOn];
}

- (IBAction)scaleSwitchAction:(UISwitch *)sender {
    UISwitch *tempSwitch = (UISwitch *)sender;
    _mapView.showMapScaleBar = [tempSwitch isOn];
    //自定义比例尺的位置
    _mapView.mapScaleBarPosition = CGPointMake(240,280);
}
#pragma mark 指南针位置
- (IBAction)compassSegAction:(UISegmentedControl *)sender {
    UISegmentedControl *tempSeg = (UISegmentedControl *)sender;
    CGPoint pt;
    if(tempSeg.selectedSegmentIndex==0)
    {
        pt = CGPointMake(10,10);
    }
    else
    {
        pt = CGPointMake(273,10);
    }
    [_mapView setCompassPosition:pt];
    
}

bool isGeoSearch;

#pragma mark -- 单击地图上某点调用的方法
/**
 *点中底图标注后会回调此接口
 *@param mapview 地图View
 *@param mapPoi 标注点信息
 */
- (void)mapView:(BMKMapView *)mapView onClickedMapPoi:(BMKMapPoi*)mapPoi
{
    NSLog(@"%@",mapPoi.text);
    [self getAnnotationLocation:mapPoi.pt andText:mapPoi.text];
}


//搜索地址后返回调用此方法
- (void)onGetAddrResult:(BMKAddrInfo*)result errorCode:(int)error
{
#warning mark -- 在移除annotations的时候，数组中得元素是每次只能移除一个，然后该方法会多次执行，最终将所有的annotations移除，因此如果直接调用该方法会导致提示栏，alertView多次显示。同理overlays的移除也是需要多次执行。
    NSArray* array = [NSArray arrayWithArray:_mapView.annotations];
	[_mapView removeAnnotations:array];
	array = [NSArray arrayWithArray:_mapView.overlays];
	[_mapView removeOverlays:array];
	if (error == 0) {
		BMKPointAnnotation* item = [[BMKPointAnnotation alloc]init];
		item.coordinate = result.geoPt;
		item.title = result.strAddr;
		[_mapView addAnnotation:item];
        _mapView.centerCoordinate = result.geoPt;
        NSString* titleStr;
        NSString* showmeg;
        
        if(isGeoSearch)
        {
            titleStr = @"正向地理编码";
            showmeg = [NSString stringWithFormat:@"经度:%f,纬度:%f",item.coordinate.latitude,item.coordinate.longitude];
            
        }
        else
        {
            titleStr = @"反向地理编码";
            showmeg = [NSString stringWithFormat:@"%@",item.title];
        }
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:titleStr message:showmeg delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定",nil];
        [myAlertView show];
        [myAlertView release];
		[item release];
	}
}


#pragma mark -
#pragma mark implement BMKSearchDelegate

- (void)onGetPoiResult:(NSArray*)poiResultList searchType:(int)type errorCode:(int)error
{
    // 清楚屏幕中所有的annotation
    NSArray* array = [NSArray arrayWithArray:_mapView.annotations];
	[_mapView removeAnnotations:array];
    
    if (error == BMKErrorOk) {
		BMKPoiResult* result = [poiResultList objectAtIndex:0];
		for (int i = 0; i < result.poiInfoList.count; i++) {
            BMKPoiInfo* poi = [result.poiInfoList objectAtIndex:i];
            BMKPointAnnotation* item = [[BMKPointAnnotation alloc]init];
            item.coordinate = poi.pt;
            item.title = poi.name;
            [_mapView addAnnotation:item];
            if(i == 0)
            {
                //将第一个点的坐标移到屏幕中央
                _mapView.centerCoordinate = poi.pt;
            }
            [item release];
		}
	} else if (error == BMKErrorRouteAddr){
        NSLog(@"起始点有歧义");
    } else {
        // 各种情况的判断。。。
    }
}


/**
 *点中底图空白处会回调此接口
 *@param mapview 地图View
 *@param coordinate 空白处坐标点的经纬度
 */
- (void)mapView:(BMKMapView *)mapView onClickedMapBlank:(CLLocationCoordinate2D)coordinate
{
    NSLog(@"onClickedMapBlank-latitude==%f,longitude==%f",coordinate.latitude,coordinate.longitude);
    NSString* showmeg = [NSString stringWithFormat:@"您点击了地图空白处(blank click).\r\n当前经度:%f,当前纬度:%f,\r\nZoomLevel=%d;RotateAngle=%d;OverlookAngle=%d", coordinate.longitude,coordinate.latitude,
                         (int)_mapView.zoomLevel,_mapView.rotation,_mapView.overlooking];
    NSLog(@"%@", showmeg);
    
    [self getAnnotationLocation:coordinate andText:nil];
    
}

/**
 *长按地图时会回调此接口
 *@param mapview 地图View
 *@param coordinate 返回长按事件坐标点的经纬度
 */
- (void)mapview:(BMKMapView *)mapView onLongClick:(CLLocationCoordinate2D)coordinate
{
    NSLog(@"onLongClick-latitude==%f,longitude==%f",coordinate.latitude,coordinate.longitude);
    NSString* showmeg = [NSString stringWithFormat:@"您长按了地图(long pressed).\r\n当前经度:%f,当前纬度:%f,\r\nZoomLevel=%d;RotateAngle=%d;OverlookAngle=%d", coordinate.longitude,coordinate.latitude,
                         (int)_mapView.zoomLevel,_mapView.rotation,_mapView.overlooking];
    NSLog(@"%@", showmeg);
    
    
    [self getAnnotationLocation:coordinate andText:nil];
}


- (void)mapView:(BMKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    NSString* showmeg = [NSString stringWithFormat:@"地图区域发生了变化(x=%d,y=%d,\r\nwidth=%d,height=%d).\r\nZoomLevel=%d;RotateAngle=%d;OverlookAngle=%d",(int)_mapView.visibleMapRect.origin.x,(int)_mapView.visibleMapRect.origin.y,(int)_mapView.visibleMapRect.size.width,(int)_mapView.visibleMapRect.size.height,(int)_mapView.zoomLevel,_mapView.rotation,_mapView.overlooking];
    
    NSLog(@"%@", showmeg);
    
}


//截图
-(void)snapshot
{
    //    _hiddenView.hidden = false;
    //    [self.view bringSubviewToFront:_hiddenView];
    //    //获得地图当前可视区域截图
    //    _imgView.image = [_mapView takeSnapshot];
    //    [_imgView sizeToFit];
    //    if([self isIphone5])
    //    {
    //        _closeButton.frame=CGRectMake(115, 420, _closeButton.frame.size.width, _closeButton.frame.size.height);
    //    }
    //    else
    //    {
    //        _closeButton.frame=CGRectMake(115, 340, _closeButton.frame.size.width, _closeButton.frame.size.height);
    //    }
    //    [_hiddenView bringSubviewToFront:_closeButton];
    //    self.navigationItem.rightBarButtonItem.enabled = false;
    
}

//截图页面的关闭按钮
- (IBAction)closeButtonClicked:(id)sender;
{
    
    
}

BMKPlanNode* start;
BMKPlanNode* end;

//添加气球图标位置以及底图名称
- (void)getAnnotationLocation:(CLLocationCoordinate2D)coordinate andText:(NSString *)text
{
#warning 在城市中查找
    BMKSearch *search = [[BMKSearch alloc] init];
    search.delegate = self;
    //可以创建一个tableView来选择城市，当然也可以搜索得到，然后关键字则通过搜索栏得到
    //    BOOL flag = [search poiSearchInCity:@"北京" withKey:@"水立方" pageIndex:0];
    //	if (flag) {
    //		NSLog(@"search success.");
    //        isGeoSearch = YES;
    //	}
    //    else{
    //        NSLog(@"search failed!");
    //    }
    //[search release];
    
    //	BOOL flag = [search geocode:@"故宫博物院" withCity:@"北京"];
    //	if (flag) {
    //        isGeoSearch = true;
    //		NSLog(@"Geocode search success.");
    //	}
    //    else{
    //        NSLog(@"Geocode search failed!");
    //    }
    
    //    BOOL reslut = [search reverseGeocode:coordinate];
    //    if (reslut) {
    //		NSLog(@"search success.");
    //        isGeoSearch = false;
    //	}
    //    else{
    //        NSLog(@"search failed!");
    //    }
    //    [search release];
    
    
    switch (_mapView.annotations.count) {
        case 0:
            _coorOne = coordinate;
            start = [[BMKPlanNode alloc]init];
            start.name = text;
            break;
        case 1:
        {
            CLLocationCoordinate2D coors[2] = {0};
            _coorTwo = coordinate;
            coors[0] = _coorOne;
            coors[1] = _coorTwo;
            polyline = [BMKPolyline polylineWithCoordinates:coors count:2];
            [_mapView addOverlay:polyline];
            
            end = [[BMKPlanNode alloc]init];
            end.name = text;
            
            BOOL flag = [search transitSearch:@"北京" startNode:start endNode:end];
            if (flag) {
                NSLog(@"search success.");
            }
            else{
                NSLog(@"search failed!");
            }
            
            break;
        }
        case 2:
            if (polyline != nil) {
                [_mapView removeOverlay:polyline];
                polyline = nil;
            }
            
            [_mapView removeAnnotation:[_mapView.annotations objectAtIndex:0]];
            [_mapView removeAnnotation:_annotation];
            _annotation = nil;
            
            _coorOne = coordinate;
            
            break;
        default:
            break;
    }
    
    BMKPointAnnotation* annotationTest = [[BMKPointAnnotation alloc]init];
    annotationTest.coordinate = coordinate;
    annotationTest.title = text;
    _annotation = annotationTest;
    [_mapView addAnnotation:_annotation];
    
    [annotationTest release];
}

#pragma --
#pragma mark 查询公交路线时调用的方法
- (void)onGetTransitRouteResult:(BMKPlanResult*)result errorCode:(int)error
{
    NSArray* array = [NSArray arrayWithArray:_mapView.annotations];
	[_mapView removeAnnotations:array];
	array = [NSArray arrayWithArray:_mapView.overlays];
	[_mapView removeOverlays:array];
    if (error == BMKErrorOk) {
		BMKTransitRoutePlan* plan = (BMKTransitRoutePlan*)[result.plans objectAtIndex:0];
		RouteAnnotation* item = [[RouteAnnotation alloc]init];
		item.coordinate = plan.startPt;
		item.title = @"起点";
		item.type = 0;
		[_mapView addAnnotation:item]; // 添加起点标注
		[item release];
        
		item = [[RouteAnnotation alloc]init];
		item.coordinate = plan.endPt;
		item.type = 1;
		item.title = @"终点";
		[_mapView addAnnotation:item]; // 终点标注
		[item release];
		
        // 计算路线方案中的点数
		int size = [plan.lines count];
		int planPointCounts = 0;
		for (int i = 0; i < size; i++) {
			BMKRoute* route = [plan.routes objectAtIndex:i];
			for (int j = 0; j < route.pointsCount; j++) {
				int len = [route getPointsNum:j];
				planPointCounts += len;
			}
			BMKLine* line = [plan.lines objectAtIndex:i];
			planPointCounts += line.pointsCount;
			if (i == size - 1) {
				i++;
				route = [plan.routes objectAtIndex:i];
				for (int j = 0; j < route.pointsCount; j++) {
					int len = [route getPointsNum:j];
					planPointCounts += len;
				}
				break;
			}
		}
		
        // 构造方案中点的数组，用户构建BMKPolyline
		BMKMapPoint* points = new BMKMapPoint[planPointCounts];
        
		planPointCounts = 0;
		
        // 查询队列中的元素，构建points数组，并添加公交标注
		for (int i = 0; i < size; i++) {
			BMKRoute* route = [plan.routes objectAtIndex:i];
			for (int j = 0; j < route.pointsCount; j++) {
				int len = [route getPointsNum:j];
				BMKMapPoint* pointArray = (BMKMapPoint*)[route getPoints:j];
				memcpy(points + planPointCounts, pointArray, len * sizeof(BMKMapPoint));
				planPointCounts += len;
			}
			BMKLine* line = [plan.lines objectAtIndex:i];
			memcpy(points + planPointCounts, line.points, line.pointsCount * sizeof(BMKMapPoint));
			planPointCounts += line.pointsCount;
			
			item = [[RouteAnnotation alloc]init];
			item.coordinate = line.getOnStopPoiInfo.pt;
			item.title = line.tip;
			if (line.type == 0) {
				item.type = 2;
			} else {
				item.type = 3;
			}
			
			[_mapView addAnnotation:item]; // 上车标注
			[item release];
			route = [plan.routes objectAtIndex:i+1];
			item = [[RouteAnnotation alloc]init];
			item.coordinate = line.getOffStopPoiInfo.pt;
			item.title = route.tip;
			if (line.type == 0) {
				item.type = 2;
			} else {
				item.type = 3;
			}
			[_mapView addAnnotation:item]; // 下车标注
			[item release];
			if (i == size - 1) {
				i++;
				route = [plan.routes objectAtIndex:i];
				for (int j = 0; j < route.pointsCount; j++) {
					int len = [route getPointsNum:j];
					BMKMapPoint* pointArray = (BMKMapPoint*)[route getPoints:j];
					memcpy(points + planPointCounts, pointArray, len * sizeof(BMKMapPoint));
					planPointCounts += len;
				}
				break;
			}
		}
        
        // 通过points构建BMKPolyline
		BMKPolyline* polyLine = [BMKPolyline polylineWithPoints:points count:planPointCounts];
		[_mapView addOverlay:polyLine]; // 添加路线overlay
		delete []points;
        
        [_mapView setCenterCoordinate:result.startNode.pt animated:YES];
	}
}

//- (BMKAnnotationView*)getRouteAnnotationView:(BMKMapView *)mapview viewForAnnotation:(RouteAnnotation*)routeAnnotation
//{
//	BMKAnnotationView* view = nil;
//	switch (routeAnnotation.type) {
//		case 0:
//		{
//			view = [mapview dequeueReusableAnnotationViewWithIdentifier:@"start_node"];
//			if (view == nil) {
//				view = [[[BMKAnnotationView alloc]initWithAnnotation:routeAnnotation reuseIdentifier:@"start_node"] autorelease];
//				view.image = [UIImage imageWithContentsOfFile:[self getMyBundlePath1:@"images/icon_nav_start.png"]];
//				view.centerOffset = CGPointMake(0, -(view.frame.size.height * 0.5));
//				view.canShowCallout = TRUE;
//			}
//			view.annotation = routeAnnotation;
//		}
//			break;
//		case 1:
//		{
//			view = [mapview dequeueReusableAnnotationViewWithIdentifier:@"end_node"];
//			if (view == nil) {
//				view = [[[BMKAnnotationView alloc]initWithAnnotation:routeAnnotation reuseIdentifier:@"end_node"] autorelease];
//				view.image = [UIImage imageWithContentsOfFile:[self getMyBundlePath1:@"images/icon_nav_end.png"]];
//				view.centerOffset = CGPointMake(0, -(view.frame.size.height * 0.5));
//				view.canShowCallout = TRUE;
//			}
//			view.annotation = routeAnnotation;
//		}
//			break;
//		case 2:
//		{
//			view = [mapview dequeueReusableAnnotationViewWithIdentifier:@"bus_node"];
//			if (view == nil) {
//				view = [[[BMKAnnotationView alloc]initWithAnnotation:routeAnnotation reuseIdentifier:@"bus_node"] autorelease];
//				view.image = [UIImage imageWithContentsOfFile:[self getMyBundlePath1:@"images/icon_nav_bus.png"]];
//				view.canShowCallout = TRUE;
//			}
//			view.annotation = routeAnnotation;
//		}
//			break;
//		case 3:
//		{
//			view = [mapview dequeueReusableAnnotationViewWithIdentifier:@"rail_node"];
//			if (view == nil) {
//				view = [[[BMKAnnotationView alloc]initWithAnnotation:routeAnnotation reuseIdentifier:@"rail_node"] autorelease];
//				view.image = [UIImage imageWithContentsOfFile:[self getMyBundlePath1:@"images/icon_nav_rail.png"]];
//				view.canShowCallout = TRUE;
//			}
//			view.annotation = routeAnnotation;
//		}
//			break;
//		case 4:
//		{
//			view = [mapview dequeueReusableAnnotationViewWithIdentifier:@"route_node"];
//			if (view == nil) {
//				view = [[[BMKAnnotationView alloc]initWithAnnotation:routeAnnotation reuseIdentifier:@"route_node"] autorelease];
//				view.canShowCallout = TRUE;
//			} else {
//				[view setNeedsDisplay];
//			}
//
//			UIImage* image = [UIImage imageWithContentsOfFile:[self getMyBundlePath1:@"images/icon_direction.png"]];
//			view.image = [image imageRotatedByDegrees:routeAnnotation.degree];
//			view.annotation = routeAnnotation;
//
//		}
//			break;
//        case 5:
//        {
//            view = [mapview dequeueReusableAnnotationViewWithIdentifier:@"waypoint_node"];
//			if (view == nil) {
//				view = [[[BMKAnnotationView alloc]initWithAnnotation:routeAnnotation reuseIdentifier:@"waypoint_node"] autorelease];
//				view.canShowCallout = TRUE;
//			} else {
//				[view setNeedsDisplay];
//			}
//
//			UIImage* image = [UIImage imageWithContentsOfFile:[self getMyBundlePath1:@"images/icon_nav_waypoint.png"]];
//			view.image = [image imageRotatedByDegrees:routeAnnotation.degree];
//			view.annotation = routeAnnotation;
//        }
//            break;
//		default:
//			break;
//	}
//
//	return view;
//}

//- (BMKAnnotationView *)mapView:(BMKMapView *)view viewForAnnotation:(id <BMKAnnotation>)annotation
//{
//	if ([annotation isKindOfClass:[RouteAnnotation class]]) {
//		return [self getRouteAnnotationView:view viewForAnnotation:(RouteAnnotation*)annotation];
//	}
//	return nil;
//}
//
//- (BMKOverlayView*)mapView:(BMKMapView *)map viewForOverlay:(id<BMKOverlay>)overlay
//{
//	if ([overlay isKindOfClass:[BMKPolyline class]]) {
//        BMKPolylineView* polylineView = [[[BMKPolylineView alloc] initWithOverlay:overlay] autorelease];
//        polylineView.fillColor = [[UIColor cyanColor] colorWithAlphaComponent:1];
//        polylineView.strokeColor = [[UIColor blueColor] colorWithAlphaComponent:0.7];
//        polylineView.lineWidth = 3.0;
//        return polylineView;
//    }
//	return nil;
//}


// Override
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
{
    
    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
        BMKPinAnnotationView *newAnnotationView = [[[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"] autorelease];
        newAnnotationView.pinColor = BMKPinAnnotationColorPurple;
        newAnnotationView.animatesDrop = YES;// 设置该标注点动画显示
        return newAnnotationView;
        
        //return [self getRouteAnnotationView:_mapView.view viewForAnnotation:(RouteAnnotation*)annotation];
    }
    return nil;
}

- (BMKOverlayView *)mapView:(BMKMapView *)mapView viewForOverlay:(id <BMKOverlay>)overlay{
    if ([overlay isKindOfClass:[BMKPolyline class]]){
        BMKPolylineView* polylineView = [[[BMKPolylineView alloc] initWithOverlay:overlay] autorelease];
        polylineView.fillColor = [[UIColor cyanColor] colorWithAlphaComponent:1];
        polylineView.strokeColor = [[UIColor blueColor] colorWithAlphaComponent:0.7];
        polylineView.lineWidth = 3.0;
        return polylineView;
    }
    return nil;
}


@end
