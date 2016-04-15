//
//  NewsReviewsViewController.m
//  VahanIndia
//
//  Created by geniemac4 on 02/04/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import "NewsReviewsViewController.h"
#import "MBProgressHUD.h"
#import "DemoAppDelegate.h"
#import "BaseTableView.h"
#import "NewsReviewsTableViewCell.h"
#import "NewsReviewsDetailedViewController.h"


@interface NewsReviewsViewController ()
{
    NSMutableArray *sample1;
    NSArray *images;
    BaseTableView *basetab;
    UIImageView *backimgview;
    NSMutableArray *ViewsArray;
    DemoAppDelegate *app;

    UIImage *image;
    MBProgressHUD*HUD;
    
    
    
    NSMutableArray *newsrevarray1;
    NSMutableArray *newsrevarray2;
    NSMutableArray *newsrevarray3;
    NSMutableArray *newsrevarray4;
    NSMutableArray *newsrevarray5;
    NSMutableArray *newsrevarray6;
    NSMutableArray *newsrevarray7;
    NSMutableArray *newsrevarray8;
    NSMutableArray *newsrevarray9;
    NSMutableArray *newsrevarray10;
    NSMutableArray *newsrevarray11;
    NSMutableArray *newsrevarray12;
    
    
    
}

@end

@implementation NewsReviewsViewController

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
    
    
    
    app=(DemoAppDelegate *)[[UIApplication sharedApplication]delegate];
    
    basetab=[[BaseTableView alloc]initWithFrame:CGRectMake(-280, 71, 280, self.view.frame.size.height-50)];
    [self.view addSubview:basetab];
    basetab.hidden=YES;
    
    
    /// == gesture method === ///
    
    UISwipeGestureRecognizer * swipeleft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeleft:)];
    swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeleft];
    
    UISwipeGestureRecognizer * swiperight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperight:)];
    swiperight.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swiperight];
    
    
    //for the view's background color...
    self.view.backgroundColor=[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0];
    
    
    
    //==== For Activity Indicator ..using HUD..=======
    
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    HUD.delegate = self;
    HUD.labelText = @"Please Wait...";
    //HUD.mode = MBProgressHUDModeAnnularDeterminate;
    [self.view addSubview:HUD];
    
    [HUD showAnimated:YES whileExecutingBlock:^{
        
        [self GetNewsReviewsData];
        
        
    } completionBlock:^{
        
        [self.table_view reloadData];
        
    }];
    
    
    
    
    
    //imp step....
    self.table_view.backgroundColor=[UIColor clearColor];
    
    //  [self GetPrizeDetailedData];
    

}


-(void)GetNewsReviewsData

{
    
    NSString *urlString=[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/news"];
    
    NSLog(@" urlString %@",urlString);
    
    NSURL *addurl = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSData *jsonData = [NSData dataWithContentsOfURL:addurl];
    NSError *error = nil;
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    NSLog(@"error:%@",error);
    
    NSLog(@"dataDictionary %@",dataDictionary);
    
    
   /* NSString *urlString =@"demo1.geniesoftsystem.com/vahanindia/api/index.php/api/news";
    
    NSURL *URL = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSData * jsondata= [NSData dataWithContentsOfURL:URL];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                      jsondata options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"Output :%@",jsonObjects);*/
    
    NSMutableDictionary * respdic = [[NSMutableDictionary alloc]init];
    
    respdic = [dataDictionary valueForKey:@"userdata"];
    
    // for labels..
    newsrevarray1 = [respdic valueForKey:@"news_id"];
    newsrevarray2 = [respdic valueForKey:@"image"];
    newsrevarray3 = [respdic valueForKey:@"news_title"];
    newsrevarray4 = [respdic valueForKey:@"long_description"];
    newsrevarray5 = [respdic valueForKey:@"short_description"];
    newsrevarray6 = [respdic valueForKey:@"news_slug"];
    newsrevarray7 = [respdic valueForKey:@"model_id"];
    newsrevarray8 = [respdic valueForKey:@"brand_id"];
    newsrevarray9 = [respdic valueForKey:@"date"];
    newsrevarray10 = [respdic valueForKey:@"username"];
    newsrevarray11 = [respdic valueForKey:@"source_name"];
    newsrevarray12 = [respdic valueForKey:@"source_link"];
    
    
   // self.table_news_view.frame=CGRectMake(0, 0, 303, 140*[newsarray3 count]);
    

    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return [newsrevarray3 count];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 143;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"NewsReviewsTableViewCell";
    
    NewsReviewsTableViewCell *cell1 = (NewsReviewsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell1 == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NewsReviewsTableViewCell" owner:self options:nil];
        cell1 = [nib objectAtIndex:0];
    }
    
    
     cell1.Viewbg.layer.cornerRadius=10;
    //  cell1.ViewBg.layer.borderColor=[UIColor blackColor].CGColor;
    //cell1.ViewBg.layer.borderWidth=1;
    
    
    // for labels...
    
    NSLog(@"kiran:%@",[newsrevarray3 objectAtIndex:indexPath.row]);
    
    cell1.lbl_Title.text=[newsrevarray3 objectAtIndex:indexPath.row];
    cell1.lbl_shrtdescr.text=[newsrevarray5 objectAtIndex:indexPath.row];
    cell1.lbl_news_startdate.text=[newsrevarray9 objectAtIndex:indexPath.row];
    
   
    // for images...
    
    NSLog(@"img:%@",newsrevarray2[indexPath.row]);
    
    NSData *data=[NSData dataWithContentsOfURL:[NSURL URLWithString:newsrevarray2[indexPath.row]]];
    
    cell1.img_view.image=[UIImage imageWithData:data];

     cell1.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
    
    //for date...
    
    //    NSString *day_namestr=[DATE_daynamearr objectAtIndex:indexPath.row];
    //    NSString *month_shortstr=[DATE_monthshrtarr objectAtIndex:indexPath.row];
    //    NSString *daystr=[DATE_dayarr objectAtIndex:indexPath.row];
    //    NSString *yearstr=[DATE_yeararr objectAtIndex:indexPath.row];
    //
    //
    //    cell1.lbl_news_startdate.text= [NSString stringWithFormat:@"%@ %@ %@ %@",day_namestr,month_shortstr,daystr,yearstr];
    //
    
    return cell1;
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    app.NewsReviewsDetailTITLE=newsrevarray3[indexPath.row];
    app.NewsReviewsSTARTDATE=newsrevarray9[indexPath.row];
    
    app.NewsReviewsDetailIMAGE=newsrevarray2[indexPath.row];
    app.NewsReviewsDetailLONGDESCRP=newsrevarray4[indexPath.row];
    app.NewsReviewsDetailUSERNAME=newsrevarray10[indexPath.row];
    
    
    NewsReviewsDetailedViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"NewsReviewsDetailedViewController"];
    [self.navigationController pushViewController:hvc animated:YES];
    
    
    
    
    
}

-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer
{
    // backimgview.hidden=YES;
    //self.homebtn.userInteractionEnabled=YES;
    //  _tabview.userInteractionEnabled=YES;
    self.btn_menu_outlet.userInteractionEnabled=YES;
    // self.serchbtn.userInteractionEnabled=YES;
    // self.notificationbtn.userInteractionEnabled=YES;
    // self.gobackbtn.userInteractionEnabled=YES;
    //self.sharebtn.userInteractionEnabled=YES;
    [self.view endEditing:YES];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.50];
    [UIView setAnimationBeginsFromCurrentState:YES];
    basetab.frame = CGRectMake(-280, 71, 280, self.view.frame.size.height-50);
    [UIView commitAnimations];
}

-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer
{
    // backimgview.hidden=NO;
    basetab.hidden=NO;
    //self.homebtn.userInteractionEnabled=NO;
    //_tabview.userInteractionEnabled=NO;
    self.btn_menu_outlet.userInteractionEnabled=NO;
    
    //self.serchbtn.userInteractionEnabled=NO;
    //self.notificationbtn.userInteractionEnabled=NO;
    //self.gobackbtn.userInteractionEnabled=NO;
    //self.sharebtn.userInteractionEnabled=NO;
    
    [self.view endEditing:YES];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.50];
    [UIView setAnimationBeginsFromCurrentState:YES];
    basetab.frame = CGRectMake(0, 71, 280, self.view.frame.size.height-50);
    [UIView commitAnimations];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //backimgview.hidden=YES;
    // tabview.userInteractionEnabled=YES;
    self.btn_menu_outlet.userInteractionEnabled=YES;
    //self.searchbar.userInteractionEnabled=YES;
    //self.notificationbtnoutlet.userInteractionEnabled=YES;
    
    [self.view endEditing:YES];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.50];
    [UIView setAnimationBeginsFromCurrentState:YES];
    basetab.frame = CGRectMake(-280, 71, 280, self.view.frame.size.height-50);
    [UIView commitAnimations];
}



- (IBAction)btn_menu:(id)sender
{
    
    // backimgview.hidden=NO;
    basetab.hidden=NO;
    //tabview.userInteractionEnabled=NO;
    self.btn_menu_outlet.userInteractionEnabled=NO;
    // self.searchbtnoutlet.userInteractionEnabled=NO;
    //self.notificationbtnoutlet.userInteractionEnabled=NO;
    [self.view endEditing:YES];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.50];
    [UIView setAnimationBeginsFromCurrentState:YES];
    basetab.frame = CGRectMake(0, 71, 280, self.view.frame.size.height-50);
    [UIView commitAnimations];
    
}

- (IBAction)btn_share:(id)sender
{
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/tmptmpimg.jpg"];
    [UIImageJPEGRepresentation(image, 1.0) writeToFile:path atomically:YES];
    
    documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:[NSURL fileURLWithPath:path]];
    documentInteractionController.delegate = self;
    [documentInteractionController presentOptionsMenuFromRect:CGRectZero inView:self.view animated:YES];
    
}


- (void)documentInteractionController:(UIDocumentInteractionController *)controller willBeginSendingToApplication:(NSString *)application
{
    if ([self isWhatsApplication:application])
    {
        NSString *savePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/tmptmpimg.wai"];
        [UIImageJPEGRepresentation(image, 1.0) writeToFile:savePath atomically:YES];
        controller.URL = [NSURL fileURLWithPath:savePath];
        controller.UTI = @"net.whatsapp.image";
    }
}


- (BOOL)isWhatsApplication:(NSString *)application
{
    if ([application rangeOfString:@"whats"].location == NSNotFound)
    { // unfortunately, no other way...
        return NO;
    }
    else
    {
        return YES;
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
