//
//  PremisesDetailViewController.m
//  House_Map_Message
//
//  Created by 1007 on 14-1-2.
//  Copyright (c) 2014年 Ibokan. All rights reserved.
//

#import "PremisesDetailViewController.h"

#import "LoupanInfoCell.h"
#import "CustomCell.h"

@interface PremisesDetailViewController ()

@end

@implementation PremisesDetailViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [_scrollView release];
    [_pageVC release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    
}

- (void)getDetailPresInfo:(NSString *)loupanID
{
    NSDictionary *arguments = [[NSDictionary alloc] initWithObjectsAndKeys:loupanID,@"loupan_id", nil];
    NSURL *url = [NSString initURLWithString:PREMISES_DETAILE_INFO andArguments:arguments];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request startSynchronous];
    NSError *error = [request error];
    if (!error) {
        NSData *data = [request responseData];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        NSDictionary *detailInfo = [dic objectForKey:@"result"];
        
        NSLog(@"%@", detailInfo);
        
        _premisesDetailInfo = [[PremisesDetailInfo alloc] initWithPremisesDetail:detailInfo];
        
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.618)];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        int num = 0;
        int index = 0;
        
        
        for (NSDictionary *dicTemp in _premisesDetailInfo.images) {
            NSArray *imagesURLArr = [dicTemp objectForKey:@"images"];
            num += imagesURLArr.count;
            _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*num, SCREEN_WIDTH*0.618);
            for (NSString *imageUrlStr in imagesURLArr) {
                NSURL *url = [NSURL URLWithString:imageUrlStr];
                UIImageView *imageViewTemp = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*index++, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.618)];
                [imageViewTemp setImageWithURL:url placeholderImage:Nil
                                       success:^(UIImage *image, BOOL cached) {
                                           if (cached)
                                           {
                                               imageViewTemp.image = image;
                                           }
                                       }
                                       failure:^(NSError *error) {
                                           NSLog(@"%@", error);
                                       }];
                [_scrollView addSubview:imageViewTemp];
                
                [imageViewTemp release];
            }
            
        }
        
        self.tableView.tableHeaderView = _scrollView;
        
        _pageVC = [[UIPageControl alloc] initWithFrame:CGRectMake(60, 160, 200, 30)];
        _pageVC.numberOfPages = num;
        _pageVC.currentPage = 0;
        _pageVC.currentPageIndicatorTintColor = [UIColor redColor];
        _pageVC.pageIndicatorTintColor = [UIColor greenColor];
        [_pageVC addTarget:self action:@selector(numberPageChange:) forControlEvents:UIControlEventValueChanged];
        [self.tableView addSubview:_pageVC];
    }
    
    else
    {
        NSLog(@"ASIHTTPRequest 错误");
    }

    [self.tableView reloadData];

}

- (void)numberPageChange:(id)sender
{
    int num = _pageVC.currentPage;
    _scrollView.contentOffset = CGPointMake(SCREEN_WIDTH * num, 0);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int num = scrollView.contentOffset.x/SCREEN_WIDTH;
    _pageVC.currentPage = num;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSInteger num = 0;
    switch (section) {
        case 0:
            num = 4;
            break;
        case 1:
            num = 3;
            break;
        case 2:
            num = 3;
            break;
        case 3:
            num = 1;
            break;
        case 4:
            num = 2;
            break;
        default:
            break;
    }
    
    return num;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat num = 30;
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 3)
            {
                num = 80;
            }
            break;
        case 1:
            
            break;
        case 2:
            num = 80;
            break;
        case 3:
        {
            CGSize gaishuSize = [_premisesDetailInfo.gaishu sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(SCREEN_WIDTH - 10, 1000)];
            num = gaishuSize.height;
            NSLog(@"%g", num);
            break;
        }
        case 4:
        {
            
            break;
        }
        default:
            break;
    }
    
    return num;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    label.backgroundColor = [UIColor cyanColor];
    label.font = [UIFont systemFontOfSize:15];
    switch (section) {
        case 0:
            break;
        case 1:
            label.text = @"楼盘动态";
            break;
        case 2:
            label.text = @"户型";
            break;
        case 3:
            label.text = @"楼盘概述以及优缺点";
            break;
        case 4:
            label.text = @"地理位置及周边配套";
            break;
        default:
            break;
    }

    return label;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
   
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    
    if (self.premisesDetailInfo != nil) {
        switch (indexPath.section) {
            case 0:
            {
                switch (indexPath.row) {
                    case 0:
                    {
                        cell.textLabel.text = [NSString stringWithFormat:@"售价：%@元/平", _premisesDetailInfo.price];
                        break;
                    }
                    case 1:
                    {
                        NSArray *arr = [_premisesDetailInfo.tuangou allKeys];
                        if (arr.count == 0) {
                            cell.textLabel.text = @"团购：暂无团购信息!";
                        }
                        else cell.textLabel.text = [NSString stringWithFormat:@"团购：%@", _premisesDetailInfo.tuangou];
                        
                        break;
                    }
                    case 2:
                    {
                        cell.textLabel.text = [NSString stringWithFormat:@"售价：%@元/平", _premisesDetailInfo.price];
                        break;
                    }
                    case 3:
                    {
                        static NSString *loupanCell = @"LoupanInfoCell";
                        LoupanInfoCell *cellTest = [tableView dequeueReusableCellWithIdentifier:loupanCell];
                        cellTest = [[LoupanInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:loupanCell];
                        
                        cellTest.loupanNewDate.text = [NSString stringWithFormat:@"开盘：%@",_premisesDetailInfo.kaipan_new_date];
                        cellTest.loupanFitmtype.text = [NSString stringWithFormat:@"装修：%@", _premisesDetailInfo.fitment_type];
                        cellTest.buildType.text = [NSString stringWithFormat:@"建筑：%@", _premisesDetailInfo.build_type];
                        cellTest.address.text = [NSString stringWithFormat:@"地址：%@", _premisesDetailInfo.address];
                        cellTest.company.text = [NSString stringWithFormat:@"开发商：%@", _premisesDetailInfo.company];
                        return cellTest;
                        break;
                    }
                    default:
                        break;
                }
                
                break;
            }
            case 1:
            {
                switch (indexPath.row) {
                    case 0:
                    {
                        NSDictionary *dic = [_premisesDetailInfo.dongtai objectAtIndex:0];
                        
                        cell.textLabel.text = [dic objectForKey:@"title"];
                        break;
                    }
                    case 1:
                    {
                        NSDictionary *dic = [_premisesDetailInfo.dongtai objectAtIndex:1];
                        
                        cell.textLabel.text = [dic objectForKey:@"title"];
                        break;
                    }
                    case 2:
                    {
                        NSDictionary *dic = [_premisesDetailInfo.dongtai objectAtIndex:2];
                        
                        cell.textLabel.text = [dic objectForKey:@"title"];
                        break;
                    }
                    default:
                        break;
                }
                break;
            }
            case 2:
            {
                static NSString *houseType = @"HouseTypeCell";
                CustomCell *houseTypeCell = [tableView dequeueReusableCellWithIdentifier:houseType];
                
                if (houseTypeCell == nil)
                {
                    houseTypeCell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:houseType];
                }
                
                switch (indexPath.row) {
                    case 0:
                    {
                        NSDictionary *houseTypeDic = [_premisesDetailInfo.house_types objectAtIndex:0];
                        NSURL *url = [NSURL URLWithString:[houseTypeDic objectForKey:@"default_image"]];
                        [houseTypeCell.imageV setImageWithURL:url];
                        houseTypeCell.alias.text = [houseTypeDic objectForKey:@"alias"];
                        houseTypeCell.area.text = [NSString stringWithFormat:@"%@平方", [houseTypeDic objectForKey:@"area"]];
                        houseTypeCell.name.text = [houseTypeDic objectForKey:@"name"];
                        houseTypeCell.description.text = [houseTypeDic objectForKey:@"description"];
                        return houseTypeCell;
                        break;
                    }
                    case 1:
                    {
                        NSDictionary *houseTypeDic = [_premisesDetailInfo.house_types objectAtIndex:1];
                        NSURL *url = [NSURL URLWithString:[houseTypeDic objectForKey:@"default_image"]];
                        [houseTypeCell.imageV setImageWithURL:url];
                        houseTypeCell.alias.text = [houseTypeDic objectForKey:@"alias"];
                        houseTypeCell.area.text = [NSString stringWithFormat:@"%@平方", [houseTypeDic objectForKey:@"area"]];
                        houseTypeCell.name.text = [houseTypeDic objectForKey:@"name"];
                        houseTypeCell.description.text = [houseTypeDic objectForKey:@"description"];
                        return houseTypeCell;
                        break;
                    }
                    case 2:
                    {
                        NSDictionary *houseTypeDic = [_premisesDetailInfo.house_types objectAtIndex:2];
                        NSURL *url = [NSURL URLWithString:[houseTypeDic objectForKey:@"default_image"]];
                        [houseTypeCell.imageV setImageWithURL:url];
                        houseTypeCell.alias.text = [houseTypeDic objectForKey:@"alias"];
                        houseTypeCell.area.text = [NSString stringWithFormat:@"%@平方", [houseTypeDic objectForKey:@"area"]];
                        houseTypeCell.name.text = [houseTypeDic objectForKey:@"name"];
                        houseTypeCell.description.text = [houseTypeDic objectForKey:@"description"];
                        return houseTypeCell;
                        break;
                    }
                    default:
                        break;
                }
                
                break;
            }
            case 3:
            {
                cell.textLabel.text = _premisesDetailInfo.gaishu;
                cell.textLabel.font = [UIFont systemFontOfSize:14];
                cell.textLabel.numberOfLines = 0;
                break;
            }
            case 4:
            {
                switch (indexPath.row) {
                    case 0:
                    {
                        break;
                    }
                    case 1:
                    {
                        break;
                    }
                    default:
                        break;
                }
                break;
            }
            default:
                break;
        }

    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MapViewController *mapVC = [[MapViewController alloc] init];
    //UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:mapVC];
    [self.navigationController pushViewController:mapVC animated:YES];
    
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 2:
                {
                    
                    break;
                }
                default:
                    break;
            }

            break;
        }
        case 1:
        {
            break;
        }
        case 2:
        {
            break;
        }
        case 3:
        {
            break;
        }
        case 4:
        {
            break;
        }
        default:
            break;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

*/

@end
