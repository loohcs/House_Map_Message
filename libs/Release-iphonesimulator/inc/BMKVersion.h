//
//  BMKVersion.h
//  BMapKit
//
//  Copyright 2011 Baidu Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


/*****������־��*****
 V0.1.0�� ���԰�
 ֧�ֵ�ͼ�������������
 ֧��POI����
 ֧��·������
 ֧�ֵ�����빦��
 --------------------
 V1.0.0����ʽ������
 ��ͼ�������������㴥��������
 ��ע��������
 POI��·������
 ������롢���������
 ��λͼ��
 --------------------
 V1.1.0��
 ���ߵ�ͼ֧��
 --------------------
 V1.1.1��
 ����suggestionSearch�ӿ�
 ���Զ�̬����annotation title
 fixС�ڴ�й¶����
 --------------------
 V1.2.1��
 ����busLineSearch�ӿ�
 �޸���λȦ��Χ�ڲ����϶���ͼ��bug
 
 --------------------
 V2.0.0
 
 ������
 ȫ�µ�3Dʸ����ͼ��Ⱦ
 BMKMapView�趨��ͼ��ת���ӽǶȣ�rotation��overlooking
 BMKMapView�趨ָ������ʾλ�ã�compassPosition
 BMKMapView�����������ڣ�viewWillAppear��viewWillDisappear
 ��ͼ��ע�ɵ㣬BMKMapViewDelegate�����ӿڻص��ӿ�onClickedMapPoi
 BMKAnnotationView����annotation�Ƿ�����3Dģʽ��enabled3D
 overlay���Ʒ�ʽ�ı䣬����opengl���ƣ�
 BMKOverlayViewʹ��opengl��Ⱦ�ӿڣ�glRender�������ش˺���ʵ��gl����
 ����opengl�߻��ƣ�renderLinesWithPoints
 ����opengl����ƣ�renderRegionWithPointsl
 ȫ�µ�ʸ�����ߵ�ͼ���ݣ�
 BMKOfflineMap�������ߵ�ͼ��start
 BMKOfflineMap�������ߵ�ͼ��update
 BMKOfflineMap��ͣ���ػ���£�pasue
 ����ȵ�����б�getHotCityList
 ���֧���������ݵĳ��У�getOfflineCityList
 ���ݳ�������ѯ������Ϣ��searchCity
 ���£�
 BMKMapView�����ż���zoomLevel����Ϊfloat�ͣ�ʵ���޼�����
 ���µ�ͼ����ö�٣�
 enum {   BMKMapTypeStandard  = 1,              ///< ��׼��ͼ
 BMKMapTypeTrafficOn = 2,              ///< ʵʱ·��
 BMKMapTypeSatellite = 4,              ///< ���ǵ�ͼ
 BMKMapTypeTrafficAndSatellite = 8,    ///< ͬʱ��ʵʱ·�������ǵ�ͼ
 };
 
 
 --------------------
 v2.0.1
 ������
 ��	MapView�����¼�����
 BMKMapviewDelegate��- mapView: onClickedMapBlank:����������ͼ�����¼�
 BMKMapviewDelegate��- mapView: onDoubleClick:����������ͼ˫���¼�
 BMKMapviewDelegate��- mapView: onLongClick:����������ͼ�����¼�
 ��	��ͼ��ͼ����
 BMKmapview�� -(UIImage*) takeSnapshot;
 ��	·���滮����;����
 BMKSearch��- (BOOL)drivingSearch: startNode: endCity: endNode: throughWayPoints:
 ��	suggestion����֧�ְ���������
 �Ż���
 ��	ȫ��֧��iPad
 ��	�Ż���Ӻ���annotation�߼�
 ��	BMKOfflineMap�У�
 - (BOOL)pasue:(int)cityID;
 ��Ϊ
 - (BOOL)pause:(int)cityID
 ��	BMKMapview�У�
 @property (nonatomic) CGPoint compassPositon;
 ��Ϊ
 @property (nonatomic) CGPoint compassPosition;
 ��	BMKRouteAddrResult�ṹ������ԣ�
 @synthesize wayPointPoiList;
 @synthesize wayPointCityList;
 ��	BMKPlanNode��������ԣ�
 @synthesize cityName; ��ӳ�������
 ��	BMKSuggestionresult�ṹ������ԣ�
 @synthesize districtList; ���������б�
 �޸���
 ��	�޸������������ͻ������
 �޸���gzip��Reachability��png��jpeg��json��xml��sqlite�ȵ���������ͻ����
 
 
 --------------------
 v2.0.2
 ������
 1.ȫ�µ�key��֤��ϵ
 
 2.���Ӷ̴�����ӿ�
 1����BMKType���������ݽṹ��BMK_SHARE_URL_TYPE�������������ͣ�
 2����BMKSearch�������ӿ�-(BOOL)poiDetailShareUrl:(NSString*) uid; ����poi�̴�����
 3����BMKSearch�������ӿ�-(BOOL)reverseGeoShareUrl:(CLLocationCoordinate2D)coor
                              poiName:(NSString*)name
                              poiAddress:(NSString*)address; ����geo�̴�����
 4����BMKSearchDelegate�������ӿ�-(void)onGetShareUrl:(NSString*) url
                                      withType:(BMK_SHARE_URL_TYPE) urlType
                                      errorCode:(int)error; ���ض̴�����url
 3.�����߿ؼ�
 1����BMKMapview����������@property (nonatomic) BOOL showMapScaleBar;�������Ƿ���ʾ
 2����BMKMapview����������@property (nonatomic) CGPoint mapScaleBarPosition;��������ʾλ��
 
 4.��λ����Ч��
 1����BMKMapview���������ݽṹ��BMKUserTrackingMode����λģʽ��
 2����BMKMapview����������@property (nonattomic) BMKUserTrackingMode userTrackingMode; �趨��λģʽ
 
 5.�ݳ�����ӵ�²���
 1����BMKSearch�������ݳ��������Գ���BMKCarTrafficFIRST = 60,///<�ݳ��������Գ��������ӵ��
 
 6.·����ѯ����ʱ�䡢�򳵷��ý��
 1����BMKSearch�������ࣺBMKTime���������һ��ʱ��Σ�ÿ�����Զ���һ��ʱ��Ρ���
 2����BMKTransitRoutePlan����������@property (nonatomic) float price; ����򳵹��ۣ���λ(Ԫ)
 3����BMKTransitRoutePlan����������@property (nonatomic, retain) BMKTime* time; ��������ʱ��
 4����BMKRoutePlan����������@property (nonatomic, retain) BMKTime* time; ����Ԥ�Ƶ���ʻʱ��
  
 �Ż���
 1������BMKMapview�еĽӿ�- (void)removeAnnotations:(NSArray *)annotations;���Ƴ�һ���ע���������Ż�
 
 �޸���
 1���޸����ߵ�ͼ����֧�����߰��ĳ����б���ʡ�������ӳ��е�����
 2���޸�ǰ̨���������������̨opengl������Ⱦ��Ӧ��Crash������
 
 --------------------
 v2.1.0
 ������
 1.ȫ�����LBS.��V2.0��ȫ�濪��LBS.�Ƽ�������
 1)��BMKCloudSearchInfo��������BMKBaseCloudSearchInfo��BMKCloudSearchInfo��BMKCloudLocalSearchInfo��BMKCloudNearbySearchInfo��BMKCloudBoundSearchInfo��BMKCloudDetailSearchInfo���洢�Ƽ�������
 2)��BMKCloudPOIList��������BMKCloudPOIList���洢�Ƽ������
 3)��BMKCloudSearch���������ݽṹ��BMKCloudSearchType���Ƽ������ͣ�
 4)��BMKCloudSearch�������ӿ�- (BOOL)localSearchWithSearchInfo:;���𱾵��Ƽ���
 5)��BMKCloudSearch�������ӿ�- (BOOL) nearbySearchWithSearchInfo:;�����ܱ��Ƽ���
 6)��BMKCloudSearch�������ӿ�- (BOOL) boundSearchWithSearchInfo:;��������Ƽ���
 7)��BMKCloudSearch�������ӿ�- (BOOL) detailSearchWithSearchInfo:;���������Ƽ���
 8)��BMKCloudSearch�������ӿ�- (void)onGetCloudPoiResult: searchType: errorCode:;�����Ƽ����б���
 9)��BMKCloudSearch�������ӿ�- (void) onGetCloudPoiDetailResult: searchType: errorCode:;�����Ƽ���������
 2.����ͼƬͼ��BMKGroundOverlay��BMKGroundOverlayView
 1)��BMKGroundOverlay����������@property (nonatomic,assign) CLLocationCoordinate2D pt;���ֻ���GroundOverlay�ķ�ʽ֮һ�����Ƶ�λ�õ������꣬��anchor���ʹ��
 2)��BMKGroundOverlay����������@property (nonatomic,assign) CGPoint anchor;��λ�û���ʱͼƬ��ê�㣬ͼƬ���Ͻ�Ϊ(0.0f,0.0f),��������Ϊ��
 3)��BMKGroundOverlay����������@property (nonatomic,assign) BMKCoordinateBounds bound;���ֻ���GroundOverlay�ķ�ʽ֮�������Ƶĵ�������Χ��ͼƬ�ڴ������ں�������
 4)��BMKGroundOverlay����������@property(nonatomic, strong) UIImage *icon;����ͼƬ
 5)��BMKGroundOverlay�������ӿ�+(BMKGroundOverlay*)groundOverlayWithPosition:zoomLevel:anchor:icon:;����ָ����γ����������һ��groundOverlay
 6)��BMKGroundOverlay�������ӿ�+(BMKGroundOverlay*) groundOverlayWithBounds:icon:;����ָ����������һ��groundOverlay
 3.�����Զ�������
 1)��BMKActionPaopaoView�������ӿ�- (id)initWithCustomView:(UIView*)customView;������ʾView�Զ���
 4.���ӵ�ͼ���ĵ�ӳ����Ļ��
 1)��BMKMapView�������ӿ�- (void)setMapCenterToScreenPt:;���õ�ͼ���ĵ��ڵ�ͼ�е���Ļ����λ��
 5.���������ƴ���������Ϊ��׼��ת���ŵ�ͼ���ܺͿ��ƿ���
 1)��BMKMapView����������@property(nonatomic, getter=isChangeWithTouchPointCenterEnabled) BOOL ChangeWithTouchPointCenterEnabled;�趨��ͼView�ܷ�֧�����������ĵ�Ϊ�������ת�����ţ�Ĭ������Ļ���ĵ�Ϊ��ת���������ģ�
 6.����ͬʱ�ı��ͼ���ǣ���ת�Ƕȣ����ű��������ĵ�ӿ�
 1)������BMKMapStatus����ʾ��ͼ״̬����
 2)��BMKMapView�������ӿ�- (void)setMapStatus:;���õ�ͼ״̬
 3)��BMKMapView�������ӿ�- (void)setMapStatus: withAnimation:;���õ�ͼ״̬��ָ���Ƿ���Ҫ����Ч����
 4)��BMKMapView�������ӿ�- (void)setMapStatus: withAnimation: withAnimationTime:;���õ�ͼ״̬��ָ���Ƿ���Ҫ����Ч����ָ������ʱ�䣩
 5)��BMKMapView�������ӿ�- (BMKMapStatus*)getMapStatus;��ȡ��ͼ״̬
 7.���ӵ�ͼ״̬�ı�ʵʱ֪ͨ
 1)��BMKMapView�������ӿ�- (void)mapStatusDidChanged:;��ͼ״̬�ı���ɺ����ô˽ӿ�
 
 �Ż���
 1.���Annotation�ö�
 1)��BMKMapView����������@property (nonatomic, assign) BOOL isSelectedAnnotationViewFront;�趨�Ƿ�����ѡ�е�annotaion������ǰ��
 2.��λ����MapView
 1)��BMKUserLocation�������ӿ�-(void)startUserLocationService;�򿪶�λ����
 2)��BMKUserLocation�������ӿ�-(void)stopUserLocationService;�رն�λ����
 3)��BMKUserLocation�������ӿ�- (void)viewDidGetLocatingUser:;������λ�󣬻��Զ����ô˽ӿڷ��ص�ǰλ�õľ�γ��
 3.��λͼ����ʽ�Զ���������Ż�
 1)������BMKLocationViewDisplayParam���洢��λͼ���Զ������
 2)��BMKMapView�������ӿ�- (void)updateLocationViewWithParam:;��̬���ƶ�λͼ����ʽ
 
 �޸���
 1)�޸����annotation�ص����������ӿ�- (void)mapview: onLongClick:������
 2)�޸�TransitRoutePlan��Content����Ϊ�յ�����
 3)�޸����ŵ�ͼ���ӿ�- (void)mapView: regionDidChangeAnimated:���ص�������
 4)�޸�������ҳ�淵��ԭҳ�����ݱ�ѹ�ǵ�����
 5)���WiFi�������ź�ʱ�״μ��ؿ���������
  --------------------
 v2.1.1
 ������
 1.���������ٶȵ�ͼ�����Ľӿڣ��ٶȵ�ͼ������Web�˵�����
 ��BMKNavigation��������ö�����͵����ݽṹNAVI_TYPE��������𵼺����������ͣ�NAVI_TYPE_NATIVE(����ͻ��˵���)��NAVI_TYPE_WEB(����web����)
 ��BMKNavigation��������NaviPara��������𵼺�ʱ����Ĳ���
 ����NaviPara����������@property (nonatomic, retain) BMKPlanNode* startPoint;���嵼�������
 ����NaviPara����������@property (nonatomic, retain) BMKPlanNode* endPoint;���嵼�����յ�
 ����NaviPara����������@property (nonatomic, assign) NAVI_TYPE naviType;���嵼��������
 ����NaviPara����������@property (nonatomic, retain) NSString* appScheme;����Ӧ�÷���scheme
 ����NaviPara����������@property (nonatomic, retain) NSString* appName;����Ӧ������
 ��BMKNavigation�������ӿ�+ (void)openBaiduMapNavigation:;���ݴ���Ĳ�����������
 
 2.����ͼ�λ����У����ӻ��߻��Ʒ���
 ��BMKArcline�������ӿ�+ (BMKArcline *)arclineWithPoints:;����ָ�����������һ��Բ��
 ��BMKArcline�������ӿ�+ (BMKArcline *)arclineWithCoordinates:;����ָ����γ������һ��Բ��
 ����BMKArclineView����������@property (nonatomic, readonly) BMKArcline *arcline;�������View��Ӧ��Բ�����ݶ���
 ��BMKArclineView�������ӿ�- (id)initWithArcline:;����ָ���Ļ�������һ��Բ��View
 
 3.����ͼ�λ����У�����������λ�������
 
 4.����Key��֤����ֵ
 ��BMKMapManager������ö����������EN_PERMISSION_STATUS��������key��֤������
 ����˾��巵�صĴ�������μ�http://developer.baidu.com/map/lbs-appendix.htm#.appendix2
 
 5.�����������˲�ѯ�еĽ���ֶ�
 ����BMKLine����������@property (nonatomic) int zonePrice;����·�μ۸�
 ����BMKLine����������@property (nonatomic) int totalPrice;������·�ܼ۸�
 ����BMKLine����������@property (nonatomic) int time;������·��ʱ����λ����
 ����BMKRoute����������@property (nonatomic) int time;�����·�ε�����ʱ�䣬��λ����
 
 �Ż���
 �Ż�Key��Ȩ��֤����
 �Ż�����ͼ�λ����У����߶λ���ĩ��Բ��
 ������ӡ�ɾ������ͼ�θ������Ч��
 
 �޸���
 �޸�iOS7ϵͳ�£���λͼ����ͼʱ���ٵ�bug
 �޸�POI��������У����ҳ����ʼ��Ϊ0��bug
 �޸��ݳ���·�滮�У����һ���ڵ���ʾ��Ϣ�����bug
 *********************/


/**
 *��ȡ��ǰ��ͼAPI�İ汾��
 *return  ���ص�ǰAPI�İ汾��
 */
UIKIT_STATIC_INLINE NSString* BMKGetMapApiVersion()
{
	return @"2.1.1";
}
