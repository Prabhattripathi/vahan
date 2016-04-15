//
//  ByPriceFinalViewController.m
//  VahanIndia
//
//  Created by geniemac4 on 03/04/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import "ByPriceFinalViewController.h"
#import "BaseTableView.h"
#import "MBProgressHUD.h"
#import "DemoAppDelegate.h"
#import "ByPriceFinalColorCollViewCell.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
#import "ByPriceFinalNewsTableViewCell.h"
#import "ByPriceFinalNewsDetailedViewController.h"
#import "ByPriceFinalNewsDetailedTableViewCell.h"
#import "JSON.h"
#import "SDWebImageCompat.h"
#import "SDWebImageManager.h"
#import "UIImageView+WebCache.h"
#import "collectioncell.h"



@interface ByPriceFinalViewController ()

{
    MBProgressHUD*HUD;
    UIImage * image;
    BaseTableView *basetab;
    NSMutableArray *sample1;
    NSArray *images;
    UIImageView *backimgview;
    NSMutableArray *ViewsArray;
    
    NSString *globstr;
    
    
    NSString *title;
    NSString *shrtdescr;
    NSString *longdescr;
    NSString *STARTDATE;
    NSString *IMAGES;
    NSString *USERNAME;
    NSString*photos;
    
    
    NSMutableArray * array1;
    NSMutableArray * array2;
    NSMutableArray * array3;
    NSMutableArray * array4;
    
    NSMutableArray * arrayreview1;
    NSMutableArray * arrayreview2;

     NSMutableArray * arrayoverview1;
     NSMutableArray * arrayoverview2;
    
    
    
    DemoAppDelegate *app;
    NSString*tag1;
    
    
    //..color chnge lbels..
    UILabel *flbl;
    UITextField *tmpimg;
    NSMutableArray *temparr;
    
    NSMutableArray * namearray;

    NSString *temp_overview_str,*temp_short_str;
    
    
    //news tab array..
    
    NSMutableArray * newsarray1;
    NSMutableArray * newsarray2;
    NSMutableArray * newsarray3;
    NSMutableArray * newsarray4;
    NSMutableArray * newsarray5;
    NSMutableArray * newsarray6;
    NSMutableArray * newsarray7;
    NSMutableArray * newsarray8;
    NSMutableArray * newsarray9;
    NSMutableArray * newsarray10;
    NSMutableArray * newsarray11;
    NSMutableArray * newsarray12;
    NSMutableArray * newsarray13;
    NSMutableArray * newsarray14;
    NSMutableArray * newsarray15;
    NSMutableArray * newsarray16;
    
    
    NSMutableArray * dataarray;
    //for the Date Sub-arrays..
    
    NSMutableArray *DATE_daynamearr;
    NSMutableArray *DATE_monthshrtarr;
    NSMutableArray *DATE_dayarr;
    NSMutableArray *DATE_yeararr;
    
    NSString*temp_reviewstr ,*temp_rev_des;
    //custom label fr long description in news detail...
    UILabel * lbl_Overview_longdescrr;
    UILabel * lbl_Review_descrr;
   
       UIImageView*imageview;
    NSMutableArray*photosarray;

    
}


@end

@implementation ByPriceFinalViewController

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
    
 //    [self.gadgetcollctview registerNib:[UINib nibWithNibName:@"DashboardCell" bundle:nil] forCellWithReuseIdentifier:@"DashboardCell"];
    
    app=(DemoAppDelegate *)[[UIApplication sharedApplication]delegate];
    //dayarr=[[NSMutableArray alloc]init];
    
    //==== For Activity Indicator ..using HUD..=======
    
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    HUD.delegate = self;
    HUD.labelText = @"Please Wait...";
    //HUD.mode = MBProgressHUDModeAnnularDeterminate;
    [self.view addSubview:HUD];
    
    
    newsarray1=[[NSMutableArray alloc]init];
    newsarray2=[[NSMutableArray alloc]init];
    newsarray3=[[NSMutableArray alloc]init];
    newsarray4=[[NSMutableArray alloc]init];
    newsarray5=[[NSMutableArray alloc]init];
    newsarray6=[[NSMutableArray alloc]init];
    newsarray7=[[NSMutableArray alloc]init];
    newsarray8=[[NSMutableArray alloc]init];
    newsarray9=[[NSMutableArray alloc]init];
    newsarray10=[[NSMutableArray alloc]init];
    newsarray11=[[NSMutableArray alloc]init];
    newsarray12=[[NSMutableArray alloc]init];
    newsarray13=[[NSMutableArray alloc]init];
    newsarray14=[[NSMutableArray alloc]init];
    newsarray15=[[NSMutableArray alloc]init];
    newsarray16=[[NSMutableArray alloc]init];
    
    //for particular Car's Name...
    
    self.lbl_CARname.text=app.CarName;
    // cell1.lbl_babaname.text=app.munjisName;

    
    //for particular Car's Image...
    
    [self.img_CAR setImageWithURL:[NSURL URLWithString:app.CarImage] placeholderImage:[UIImage imageNamed:@"app-iconVI.png"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    //[cell1.img_babaname setImageWithURL:[NSURL URLWithString:app.munjisImage] placeholderImage:[UIImage imageNamed:@"logo.png"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    
    //Carprice for finalcarVC in general tab..
    self.lbl_priceGEN.text=app.CarPrice;
    //@property (strong, nonatomic) NSString *CarPrice;
    
    //CarKMPL for finalcarVC in general tab..
    self.lbl_kmplGEN.text=app.CarKMPL;
    //@property (strong, nonatomic) NSString *CarKMPL;
    
    
    
    namearray=[[NSMutableArray alloc]init];
    [namearray addObject:@"General"];
     [namearray addObject:@"Overview"];
     [namearray addObject:@"Photos"];
     [namearray addObject:@"Review"];
     [namearray addObject:@"Colors"];
     [namearray addObject:@"News"];
    
    
    
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
    
    
    //imp step....
   // self.table_view.backgroundColor=[UIColor clearColor];
    
//    [self GetPrizeDetailedData];
    
    self.view_overview.hidden=YES;
    self.view_photos.hidden=YES;
    self.view_review.hidden=YES;
    self.view_colors.hidden=YES;
    self.view_news.hidden=YES;
    self.view_general.hidden=NO;
    
    temparr=[[NSMutableArray alloc]init];
    
    
    //for scrollers..
    
    
    [self.SCROLL_HORIZONTAL setScrollEnabled:YES];
   // [self.SCROLL_HORIZONTAL setContentSize:CGSizeMake(0, 1262)];
        
    
    [self.SCROLL_VERTICAL setScrollEnabled:YES];
    
    
    
    
    //for horzntl scroll...
    
    for(int i=0; i<6; i++)
    {
        CGRect frame;
       // frame.origin.x = (((self.SCROLL_HORIZONTAL.frame.size.width)-210) * i)+5;
        frame.origin.x = (((self.SCROLL_HORIZONTAL.frame.size.width)-205) * i)+5;
       
        frame.origin.y = 5;
        frame.size.width = 95;
        frame.size.height = 90;
        
        
        
        /*UIButton *bnt1=[[UIButton alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width,(self.SCROLL_HORIZONTAL.frame.size.height)-10)];
        
        [bnt1 setTitle:[namearray objectAtIndex:i] forState:UIControlStateNormal];
        
        [bnt1 setTag:i];
        [bnt1 addTarget:self action:@selector(btn1pressed:) forControlEvents:UIControlEventTouchUpInside];
        
      //  bnt1.backgroundColor=[UIColor blueColor];
       bnt1.backgroundColor=[UIColor colorWithRed:136.0/255.0f green:27.0/255.0f blue:24.0/255.0f alpha:1.0];
        

        headingLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x, 45, frame.size.width,5)];
      
        headingLabel.tag=i;
        
        headingLabel.backgroundColor=[UIColor greenColor];
        
        [self.SCROLL_HORIZONTAL addSubview:headingLabel];
        
         
        [self.SCROLL_HORIZONTAL addSubview:bnt1];*/
        
        
        UIButton *bnt1=[[UIButton alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width,(self.SCROLL_HORIZONTAL.frame.size.height)-10)];
        [bnt1 setTag:i];
        [bnt1 addTarget:self action:@selector(btn1pressed:) forControlEvents:UIControlEventTouchUpInside];
        flbl=[[UILabel alloc]initWithFrame:CGRectMake(0, 0,  frame.size.width, 35)];
        flbl.text=[namearray objectAtIndex:i];
        flbl.textAlignment=NSTextAlignmentCenter;
        flbl.backgroundColor=[UIColor colorWithRed:232.0/255.0f green:94.0/255.0f blue:99.0/255.0f alpha:1.0];
        [bnt1 addSubview:flbl];
        
        tmpimg=[[UITextField alloc]initWithFrame:CGRectMake(0, 35,  frame.size.width, 5)];
        tmpimg.tag=i;
        
      //  tmpimg.backgroundColor=[UIColor greenColor];
        tmpimg.userInteractionEnabled=NO;
        [bnt1 addSubview:tmpimg];
        
        [temparr addObject:tmpimg];
        
        [self.SCROLL_HORIZONTAL addSubview:bnt1];
        
        
        self.SCROLL_HORIZONTAL.contentSize = CGSizeMake(((bnt1.frame.size.width)+7) * 6, 0);
        
        
        
    }

    [HUD showAnimated:YES whileExecutingBlock:^{
        
        [self GetOverviewsData];
      
        
       
        
    } completionBlock:^{
        
        self.lbl_ovrview_brandname.text=[NSString stringWithFormat:@"%@",temp_short_str];
        
        CGSize size1 = [temp_overview_str sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(300, 3000) lineBreakMode:NSLineBreakByWordWrapping];
        
        lbl_Overview_longdescrr =[[UILabel alloc]initWithFrame:CGRectMake(2,40, size1.width, size1.height)];
        lbl_Overview_longdescrr.numberOfLines = 0;
        lbl_Overview_longdescrr.lineBreakMode = NSLineBreakByWordWrapping;
        
        
        [temp_overview_str stringByAddingPercentEscapesUsingEncoding:
         NSUTF8StringEncoding];
        
        NSLog(@"ajjjkl%@",temp_overview_str);
        lbl_Overview_longdescrr.text=[NSString stringWithFormat:@"%@",temp_overview_str];
        lbl_Overview_longdescrr.font=[UIFont systemFontOfSize:15];
        
        [self.view_overview addSubview:lbl_Overview_longdescrr];
        self.lbl_review_brndname.text =[NSString stringWithFormat:@"%@",temp_reviewstr];
        lbl_Review_descrr.text=[NSString stringWithFormat:@"%@",temp_rev_des];
        lbl_Review_descrr.font=[UIFont systemFontOfSize:15];

        [self.table_news_view reloadData];
        [self.collection_view reloadData];
        
    }];
    
   
    // coll...2 tag
    
}


-(void)btn1pressed:(UIButton *)sender
{
    
    
    if(sender.tag==0)
    {
        self.view_general.hidden=NO;
        self.view_overview.hidden=YES;
        self.view_photos.hidden=YES;
        self.view_review.hidden=YES;
        self.view_colors.hidden=YES;
        self.view_news.hidden=YES;
        
        //
        [[temparr objectAtIndex:0] setBackgroundColor:[UIColor colorWithRed:65.0/255.0f green:75.0/255.0f blue:150.0/255.0f alpha:1.0]];
        
        
        [[temparr objectAtIndex:1] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        
        [[temparr objectAtIndex:2] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        [[temparr objectAtIndex:3] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        [[temparr objectAtIndex:4] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        [[temparr objectAtIndex:5] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        
         [self.SCROLL_VERTICAL setContentSize:CGSizeMake(0, 300)];

    }
    else if (sender.tag==1)
    {
        self.view_overview.hidden=NO;
        self.view_general.hidden=YES;
        self.view_photos.hidden=YES;
        self.view_review.hidden=YES;
        self.view_colors.hidden=YES;
        self.view_news.hidden=YES;
        
        [[temparr objectAtIndex:0] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        
        //
        [[temparr objectAtIndex:1] setBackgroundColor:[UIColor colorWithRed:65.0/255.0f green:75.0/255.0f blue:150.0/255.0f alpha:1.0]];
        [[temparr objectAtIndex:2] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        [[temparr objectAtIndex:3] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        [[temparr objectAtIndex:4] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        [[temparr objectAtIndex:5] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        
        [self.SCROLL_VERTICAL setContentSize:CGSizeMake(0, 740)];
        
        [self.SCROLL_VERTICAL setContentSize:CGSizeMake(0, lbl_Overview_longdescrr.frame.size.height +290)];
        
        self.view_overview.frame=CGRectMake(8, 236, lbl_Overview_longdescrr.frame.size.width, lbl_Overview_longdescrr.frame.size.height+290);



        
         
    }
    
    else if (sender.tag==2)
    {
       
        [HUD showAnimated:YES whileExecutingBlock:^{
            [self GetPhotosData];

            
            
        } completionBlock:^{
            self.view_photos.frame=CGRectMake(8, 236,300, 900);
            
            
            
            [self.photos_view reloadData];
            
            // self.view_photos.frame=CGRectMake(8, 236, lbl_Review_descrr.frame.size.width, lbl_Review_descrr.frame.size.height+290);
            
            [self.SCROLL_VERTICAL setContentSize:CGSizeMake(0, 900)];
            
        }];
        

        tag1=[NSString stringWithFormat:@"%ld",(long)sender.tag];
        NSLog(@"tag: %@",tag1);
       

       
        self.view_photos.hidden=NO;
        self.view_general.hidden=YES;
        self.view_overview.hidden=YES;
        self.view_review.hidden=YES;
        self.view_colors.hidden=YES;
        self.view_news.hidden=YES;
        
        
        [[temparr objectAtIndex:0] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        [[temparr objectAtIndex:1] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        
        //
        [[temparr objectAtIndex:2] setBackgroundColor:[UIColor colorWithRed:65.0/255.0f green:75.0/255.0f blue:150.0/255.0f alpha:1.0]];
        [[temparr objectAtIndex:3] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        [[temparr objectAtIndex:4] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        [[temparr objectAtIndex:5] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        
        
       
        
    }
    else if (sender.tag==3)
    {
        self.view_review.hidden=NO;
        self.view_general.hidden=YES;
        self.view_overview.hidden=YES;
        self.view_photos.hidden=YES;
        self.view_colors.hidden=YES;
        self.view_news.hidden=YES;
        [[temparr objectAtIndex:0] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        [[temparr objectAtIndex:1] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        [[temparr objectAtIndex:2] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        
        //
        [[temparr objectAtIndex:3] setBackgroundColor:[UIColor colorWithRed:65.0/255.0f green:75.0/255.0f blue:150.0/255.0f alpha:1.0]];

        [[temparr objectAtIndex:4] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        [[temparr objectAtIndex:5] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        
        
        // [self.SCROLL_VERTICAL setContentSize:CGSizeMake(0, 300)];
        
        [self.SCROLL_VERTICAL setContentSize:CGSizeMake(0, 740)];
        
        [self.SCROLL_VERTICAL setContentSize:CGSizeMake(0, lbl_Review_descrr.frame.size.height +290)];
        
    self.view_review.frame=CGRectMake(8, 236, lbl_Review_descrr.frame.size.width, lbl_Review_descrr.frame.size.height+290);
        

        
  
        
    }
    else if (sender.tag==4)
    {
        tag1=[NSString stringWithFormat:@"%ld",(long)sender.tag];
        [self.collection_view reloadData];
        self.view_colors.hidden=NO;
        self.view_general.hidden=YES;
        self.view_overview.hidden=YES;
        self.view_photos.hidden=YES;
        self.view_review.hidden=YES;
        self.view_news.hidden=YES;
        [[temparr objectAtIndex:0] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        [[temparr objectAtIndex:1] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        [[temparr objectAtIndex:2] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        [[temparr objectAtIndex:3] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        
        //
        [[temparr objectAtIndex:4] setBackgroundColor:[UIColor colorWithRed:65.0/255.0f green:75.0/255.0f blue:150.0/255.0f alpha:1.0]];

        [[temparr objectAtIndex:5] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        
        
        [self.SCROLL_VERTICAL setContentSize:CGSizeMake(0, 700)];
        
     //hexcode colortab1..
//    [self.view_colortab1 setBackgroundColor: [self colorWithHexString:@"414B96"]];
//        
//        //hexcode colortab2..
//        [self.view_colortab2 setBackgroundColor: [self colorWithHexString:@"414B96"]];
                
    }
    
    else if (sender.tag==5)
    {
        
        self.view_news.hidden=NO;
        self.view_general.hidden=YES;
        self.view_overview.hidden=YES;
        self.view_photos.hidden=YES;
        self.view_review.hidden=YES;
        self.view_colors.hidden=YES;
        
        [[temparr objectAtIndex:0] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        [[temparr objectAtIndex:1] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        [[temparr objectAtIndex:2] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        [[temparr objectAtIndex:3] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        [[temparr objectAtIndex:4] setBackgroundColor:[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0]];
        
        //
        [[temparr objectAtIndex:5] setBackgroundColor:[UIColor colorWithRed:65.0/255.0f green:75.0/255.0f blue:150.0/255.0f alpha:1.0]];
        
        
        [self.SCROLL_VERTICAL setContentSize:CGSizeMake(0, (140*[newsarray3 count])+239)];
    }
     [self.photos_view reloadData];
    
 
}


-(UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}


-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer
{
    // backimgview.hidden=YES;
    //self.homebtn.userInteractionEnabled=YES;
    //  _tabview.userInteractionEnabled=YES;
    self.btn_mennu_outlet.userInteractionEnabled=YES;
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
    self.btn_mennu_outlet.userInteractionEnabled=NO;
    
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
    self.btn_mennu_outlet.userInteractionEnabled=YES;
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
    self.btn_mennu_outlet.userInteractionEnabled=NO;
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




-(void)GetPhotosData

{
    

    NSMutableDictionary *tempdict=[[NSMutableDictionary alloc]init];
    
    
    NSString *str5=[NSString stringWithFormat:@"%@",app.priceDetailed_id];
    
    NSLog(@"str5:%@",str5);
    
    [tempdict setValue:str5 forKey:@"model_id"];

   // [tempdict setValue:str5 forKey:@"model_id"];
    
    NSDictionary *jsonpayLoad  = nil;
    jsonpayLoad = [[NSDictionary alloc]initWithDictionary:tempdict];
    
    NSString *json = [jsonpayLoad JSONRepresentation];
    
    NSString *urlString =[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/detail_newcar_photo?data=%@",json];

    NSLog(@"Json string :%@ ",urlString);
    
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSLog(@"url :%@ ",url);
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy
                                         timeoutInterval:100.0];
    
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *string=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSDictionary *dict = [string JSONValue];
    NSLog(@"Response Edit Contact any :%@ ",dict);
    
    NSString *response1=[dict objectForKey:@"response"];
    if ([response1 isEqualToString:@"success"])
    {
        
       
        photosarray=[[NSMutableArray alloc]init];
        photosarray = [dict objectForKey:@"text"];
        
         [[NSUserDefaults standardUserDefaults] setValue:photosarray forKey:@"imagekey"];
        

        
//        NSArray *temparr1=[resparray componentsSeparatedByString:@","];
//        str=[temparr1 objectAtIndex:0];
//        
//        str=[str stringByReplacingOccurrencesOfString:@"(" withString:@""];
//        
//        str=[str stringByReplacingOccurrencesOfString:@")" withString:@""];
//        
//        
//        str=[str stringByReplacingOccurrencesOfString:@"\"" withString:@""];
//        str=[str stringByReplacingOccurrencesOfString:@"" withString:@""];
//
//        NSLog(@"%@",str);
//        globstr=str;
//        globstr=[globstr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
//        globstr=[globstr stringByReplacingOccurrencesOfString:@" " withString:@""];
//        globstr=[globstr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//        NSLog(@"globstr:%@",globstr);
        
       
        
      // [self.imgs_photosTAB setImageWithURL:[NSURL URLWithString:globstr] placeholderImage:[UIImage imageNamed:@"splash-screen.png"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        

        
//        [[self.imgs_photosTAB setImageWithURL:[NSURL URLWithString:str]];

        
    }
    else
    {
        self.imgs_photosTAB.image=[UIImage imageNamed:@"splash-screen.png"];
    }
    
    

//    NSString *str5=[NSString stringWithFormat:@"%@",app.priceDetailed_id];
//    
//    NSLog(@"Output :%@",app.priceDetailed_id);
//    
//    
//    NSString *urlString =[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/detail_newcar_photo?data={\"model_id\":\"%@\"}",str5];
//    
//    //http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/detail_newcar_photo?data={%22model_id%22:%2223%22}
//    
//    NSURL *URL = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
//    
//    NSData * jsondata= [NSData dataWithContentsOfURL:URL];
//    
//    
//    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
//                      jsondata options:NSJSONReadingMutableContainers error:nil];
//    
//    NSLog(@"des :%@",jsonObjects);
//    
//  NSString * STR=  [jsonObjects valueForKey:@"text"];
//    
//    NSLog(@"STR :%@",STR);
    
  //  self.lbl_ovrview_brandname.text = [jsonObjects valueForKey:@"text"];
    
    //self.imgs_photosTAB.image = [jsonObjects valueForKey:@"text"];

//    [self.imgs_photosTAB setImageWithURL:[NSURL URLWithString:[jsonObjects valueForKey:@"text"]] placeholderImage:[UIImage imageNamed:@"app-iconVI.png"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//
//    
//    // for images
//    
//    NSLog(@"img:%@",array4[indexPath.row]);
//    
//    NSData *data=[NSData dataWithContentsOfURL:[NSURL URLWithString:array4[indexPath.row]]];
//    
//    cell1.img_view.image=[UIImage imageWithData:data];
    
    //
    
//    [cell1.img_view setImageWithURL:[NSURL URLWithString:array2[indexPath.row]] placeholderImage:[UIImage imageNamed:@"logo.png"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];

    
    
    
    
    
    
  //  NSMutableDictionary * respdic = [[NSMutableDictionary alloc]init];
    
   // respdic = [jsonObjects valueForKey:@"text"];
    
//    // NSLog(@"des:%@",respdic);
//    
//    
//    // for labels..
//    self.lbl_ovrview_descr.text = [respdic valueForKey:@"long_description"];
//    
//    self.lbl_ovrview_brandname.text = [respdic valueForKey:@"brand_name"];
    
    
}

// kiran news..

//-(void)getnewsapi
//{
//   // error1=0;
//    
//    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"INTERNET_CONNECTION"])
//    {
//        
//        @try
//        {
//            // NSString *urlstring=[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/litomania/index.php/api/getnewsdata?data={\"userid\":\"%@\"}",uid];
//            
//            // live URL //  http://litomania.com/admin
//            
//            //http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/detail_newcar_news?data={%22model_id%22:%2217%22}
//            
//            NSString *str4=[NSString stringWithFormat:@"%@",app.priceDetailed_id];
//            
//            NSLog(@"Output :%@",app.priceDetailed_id);
//
//            NSString *urlstring=[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/detail_newcar_news?data={\"model_id\":\"%@\"}",str4];
//            
//          //  NSLog(@"urlstring:%@",urlstring);
//            
//            NSURL *addurl = [[NSURL alloc]initWithString:[urlstring stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
//            NSData *jsonData = [NSData dataWithContentsOfURL:addurl];
//            NSError *error = nil;
//            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
//            if(error)
//            {
//               // error1=1;
//                NSLog(@"error id:%@",error);
//                
//            }
//            else
//            {
//                NSLog(@"Response Edit Contact any :%@ ",dict);
//                NSString *response=[dict objectForKey:@"response"];
//                NSMutableArray *dataarray=[[NSMutableArray alloc]init];
//                dataarray=[dict valueForKey:@"text"];
//                
//                if([response isEqualToString:@"success"])
//                {
//                   // error1=2;
//                    
//                    app.news_bannar_arr=[[NSMutableArray alloc]init];
//                    
//                    app.news_id=[[NSMutableArray alloc]init];
//                    app.news_title=[[NSMutableArray alloc]init];
//                    app.news_writer_name=[[NSMutableArray alloc]init];
//                    app.news_profile_photo=[[NSMutableArray alloc]init];
//                    app.news_desc=[[NSMutableArray alloc]init];
//                    app.news_genre=[[NSMutableArray alloc]init];
//                    app.news_no_of_likes=[[NSMutableArray alloc]init];
//                    app.news_no_of_comments=[[NSMutableArray alloc]init];
//                    app.news_added_date=[[NSMutableArray alloc]init];
//                    
//                    app.news_like_status=[[NSMutableArray alloc]init];
//                    
//                    
//                    for(int i=0;i<[dataarray count];i++)
//                    {
//                        
//                    NSString *  newsstr=[[dataarray objectAtIndex:i]valueForKey:@"news_id"];
//                        
//                    NSString * imgstrr=[[dataarray objectAtIndex:i]valueForKey:@"image"];
//                        
//                    NSString * newstitlestrr=[[dataarray objectAtIndex:i]valueForKey:@"news_title"];
//                        
//                    NSString * longdescrstr=[[dataarray objectAtIndex:i]valueForKey:@"long_description"];
//                        
//                    NSString * shrtdescrstr=[[dataarray objectAtIndex:i]valueForKey:@"short_description"];
//                        
//                    NSString * newsslugstr=[[dataarray objectAtIndex:i]valueForKey:@"news_slug"];
//                        
//                    NSString * modelidstr=[[dataarray objectAtIndex:i]valueForKey:@"model_id"];
//                        
//                    NSString * brandidstr=[[dataarray objectAtIndex:i]valueForKey:@"brand_id"];
//
//                        
//                    NSString * Dateestr=[[dataarray objectAtIndex:i]valueForKey:@"date"];
//
//                        
//                    NSString * usernamestr=[[dataarray objectAtIndex:i]valueForKey:@"username"];
//
//                        
//                    NSString * source_namestr=[[dataarray objectAtIndex:i]valueForKey:@"source_name"];
//
//                        
//                    NSString * source_linkstr=[[dataarray objectAtIndex:i]valueForKey:@"source_link"];
//
//                        
//                        
//                       
//                       
//                       // bannarimg =[bannarimg stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//                        
//                      //  NSString *likestatus=[NSString stringWithFormat:@"%@",[[dataarray objectAtIndex:i]valueForKey:@"like_status"]];
//                        
//                        [app.news_bannar_arr addObject:bannarimg];
//                        [app.news_id addObject:newidstr];
//                        [app.news_title addObject:newtitlestr];
//                        [app.news_desc addObject:newdescriptiostr];
//                        [app.news_writer_name addObject:newauthorstr];
//                        [app.news_profile_photo addObject:newimagstr];
//                        [app.news_genre addObject:newgenrestr];
//                        [app.news_no_of_likes addObject:newlikestr];
//                        [app.news_no_of_comments addObject:newcomentstr];
//                        [app.news_added_date addObject:newdatestr];
//                        [app.news_like_status addObject:likestatus];
//                        
//                        
//                    }
//                    
//                    
//                }
//                else
//                {
//                    error1=3;
//                }
//                
//            }
//        }
//        @catch (NSException *exception)
//        {
//            error1=5;
//        }
//        
//        
//    }
//    else
//    {
//        error1=4;
//    }
//    
//}



//


//-(void)GetNewsData
//
//{
//    
//    NSString *str4=[NSString stringWithFormat:@"%@",app.priceDetailed_id];
//    
//    NSLog(@"Output :%@",app.priceDetailed_id);
//    
//    
//    NSString *urlString =[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/detail_newcar_news?data={\"model_id\":\"%@\"}",str4];
//    
//    //http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/detail_newcar_news?data={%22model_id%22:%2223%22}
//    
//  
//    
//    NSURL *URL = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
//    
//    NSData * jsondata= [NSData dataWithContentsOfURL:URL];
//    
//    
//    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
//                      jsondata options:NSJSONReadingMutableContainers error:nil];
//    
//    NSLog(@"des :%@",jsonObjects);
//    
//    
//    NSMutableDictionary * respdic = [[NSMutableDictionary alloc]init];
//    
//    respdic = [jsonObjects valueForKey:@"text"];
//    
//    // NSLog(@"des:%@",respdic);
//    
//    
//    
//       // for labels..
//
//    
////    NSString * str=[respdic objectForKey:@"news_title"];
////[newsarray2 addObject:[NSString stringWithFormat:@"%@",str]];
//    
//newsarray1 = [respdic valueForKey:@"news_id"];
////newsarray2 = [respdic valueForKey:@"image"];
//    
//    
//IMAGES= [respdic valueForKey:@"image"];
//    
//title = [respdic valueForKey:@"news_title"];
//shrtdescr= [respdic valueForKey:@"short_description"];
//STARTDATE= [respdic valueForKey:@"start_date"];
//longdescr= [respdic valueForKey:@"long_description"];
//USERNAME= [respdic valueForKey:@"username"];
//    
//    
////newsarray4 = [respdic valueForKey:@"long_description"];
////newsarray5 = [respdic valueForKey:@"short_description"];
////newsarray6 = [respdic valueForKey:@"start_date"];
//newsarray7 = [respdic valueForKey:@"end_date"];
//newsarray8 = [respdic valueForKey:@"updated_at"];
//newsarray9 = [respdic valueForKey:@"created_at"];
//newsarray10 = [respdic valueForKey:@"news_slug"];
//newsarray11 = [respdic valueForKey:@"model_id"];
//newsarray12 = [respdic valueForKey:@"brand_id"];
////newsarray13 = [respdic valueForKey:@"username"];
//newsarray14 = [respdic valueForKey:@"source_name"];
//newsarray15 = [respdic valueForKey:@"source_link"];
//    
//    
//    [newsarray3 addObject:[NSString stringWithFormat:@"%@",title]];
//    [newsarray5 addObject:[NSString stringWithFormat:@"%@",shrtdescr]];
//    [newsarray4 addObject:[NSString stringWithFormat:@"%@",longdescr]];
//    [newsarray6 addObject:[NSString stringWithFormat:@"%@",STARTDATE]];
//    [newsarray2 addObject:[NSString stringWithFormat:@"%@",IMAGES]];
//    [newsarray13 addObject:[NSString stringWithFormat:@"%@",USERNAME]];
//    
////newsarray16 = [respdic objectForKey:@"date"];
//    
//   
////        NSString *day_shortstr=[[newsarray23 objectAtIndex:i] valueForKey:@"day_short"];
////        NSString *suffixstr=[[newsarray23 objectAtIndex:i] valueForKey:@"suffix"];
////        NSString *monthstr=[[newsarray23 objectAtIndex:i] valueForKey:@"month"];
//        
////    
////    [DATE_daynamearr valueForKey:@"day_name"];
////    [DATE_monthshrtarr valueForKey:@"month_short"];
////    [DATE_dayarr valueForKey:@"day"];
////    [DATE_yeararr valueForKey:@"year"];
////        
//    
// self.table_news_view.frame=CGRectMake(0, 0, 303, 140*[newsarray3 count]);
//    NSLog(@"cnt:%ld",[newsarray3 count]);
//
//    
//}




-(void)GetNewsData

{
    
    
        NSString *str4=[NSString stringWithFormat:@"%@",app.priceDetailed_id];
    
        NSLog(@"Output :%@",app.priceDetailed_id);
    
    
        NSString *urlString =[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/detail_newcar_news?data={\"model_id\":\"%@\"}",str4];
    
    
    NSURL *URL = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSData * jsondata= [NSData dataWithContentsOfURL:URL];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                      jsondata options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"Output :%@",jsonObjects);
    
    NSMutableDictionary * respdic = [[NSMutableDictionary alloc]init];
    
    respdic = [jsonObjects valueForKey:@"text"];
    
    // for labels..
    newsarray1 = [respdic valueForKey:@"news_id"];
    newsarray2 = [respdic valueForKey:@"image"];
    newsarray3 = [respdic valueForKey:@"news_title"];
    newsarray4 = [respdic valueForKey:@"long_description"];
    newsarray5 = [respdic valueForKey:@"short_description"];
    newsarray6 = [respdic valueForKey:@"news_slug"];
    newsarray7 = [respdic valueForKey:@"model_id"];
    newsarray8 = [respdic valueForKey:@"brand_id"];
    newsarray9 = [respdic valueForKey:@"date"];
    newsarray10 = [respdic valueForKey:@"username"];
    newsarray11 = [respdic valueForKey:@"source_name"];
    newsarray12 = [respdic valueForKey:@"source_link"];
    

    self.table_news_view.frame=CGRectMake(0, 0, 303, 140*[newsarray3 count]);

    
}







- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
        return [newsarray3 count];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"ByPriceFinalNewsTableViewCell";
    
    ByPriceFinalNewsTableViewCell *cell1 = (ByPriceFinalNewsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell1 == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ByPriceFinalNewsTableViewCell" owner:self options:nil];
        cell1 = [nib objectAtIndex:0];
    }
    
    
   // cell1.Viewbg.layer.cornerRadius=10;
    //  cell1.ViewBg.layer.borderColor=[UIColor blackColor].CGColor;
    //cell1.ViewBg.layer.borderWidth=1;
    
    
    // for labels...
    
    NSLog(@"kiran:%@",[newsarray3 objectAtIndex:indexPath.row]);
    
    cell1.lbl_news_heading.text=[newsarray3 objectAtIndex:indexPath.row];
    cell1.lbl_news_shrtdescr.text=[newsarray5 objectAtIndex:indexPath.row];
    cell1.lbl_news_startdate.text=[newsarray9 objectAtIndex:indexPath.row];
    
    //cell1.lbl_news_heading.text=[NSString stringWithFormat:@"%@",[newsarray2 objectAtIndex:indexPath.row]];
    
    
    
    //cell1.lbl_news_startdate.text=[newsarray23 objectAtIndex:indexPath.row];
    
    //for date...
    
//    NSString *day_namestr=[DATE_daynamearr objectAtIndex:indexPath.row];
//    NSString *month_shortstr=[DATE_monthshrtarr objectAtIndex:indexPath.row];
//    NSString *daystr=[DATE_dayarr objectAtIndex:indexPath.row];
//    NSString *yearstr=[DATE_yeararr objectAtIndex:indexPath.row];
//    
//    
//    cell1.lbl_news_startdate.text= [NSString stringWithFormat:@"%@ %@ %@ %@",day_namestr,month_shortstr,daystr,yearstr];
    
    
    cell1.selectionStyle=UITableViewCellSelectionStyleNone;

    
    return cell1;
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//  NSString *day_namestr=[DATE_daynamearr objectAtIndex:indexPath.row];
//  NSString *month_shortstr=[DATE_monthshrtarr objectAtIndex:indexPath.row];
//  NSString *daystr=[DATE_dayarr objectAtIndex:indexPath.row];
//  NSString *yearstr=[DATE_yeararr objectAtIndex:indexPath.row];
//    
//    
//    app.NewsDetailSTARTDATE = [NSString stringWithFormat:@"%@ %@ %@ %@",day_namestr,month_shortstr,daystr,yearstr];
   
    
    
    app.NewsDetailTITLE=newsarray3[indexPath.row];
    app.NewsDetailSTARTDATE=newsarray9[indexPath.row];
    
    app.NewsDetailIMAGE=newsarray2[indexPath.row];
    app.NewsDetailLONGDESCRP=newsarray4[indexPath.row];
    app.NewsDetailUSERNAME=newsarray10[indexPath.row];
    
    
    ByPriceFinalNewsDetailedViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"ByPriceFinalNewsDetailedViewController"];
    [self.navigationController pushViewController:hvc animated:YES];





}



-(void)GetOverviewsData

{
    
    NSString *str3=[NSString stringWithFormat:@"%@",app.priceDetailed_id];
    
    NSLog(@"Output :%@",app.priceDetailed_id);
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/detail_newcar_overview?data={\"model_id\":\"%@\"}",str3];
    
    //http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/detail_newcar_overview?data={%22model_id%22:%2222%22}
    
    NSURL *URL = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSData * jsondata= [NSData dataWithContentsOfURL:URL];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                      jsondata options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"des :%@",jsonObjects);
    
    
    NSMutableDictionary * respdic = [[NSMutableDictionary alloc]init];
    
    respdic = [jsonObjects valueForKey:@"text"];
    
      // for labels..
    temp_short_str=[NSString stringWithFormat:@"%@",[respdic valueForKey:@"brand_name"]];
    
    //custom label....
    
    //DYNAMIC CREATION OF "DESCRIPTION" LABEL...
    
    NSString *Descrstr=[NSString stringWithFormat:@"%@",[respdic valueForKey:@"long_description"]];
    
    NSLog(@"app.munjisDescription:%@",[respdic valueForKey:@"long_description"]);
    temp_overview_str=[NSString stringWithFormat:@"%@",[respdic valueForKey:@"long_description"]];
    
        [self GetReviewsData];
    
}




-(void)GetReviewsData

{
    
    NSString *str2=[NSString stringWithFormat:@"%@",app.priceDetailed_id];
    
    NSLog(@"Output :%@",app.priceDetailed_id);
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/detail_newcar_review?data={\"model_id\":\"%@\"}",str2];
    
    
    NSURL *URL = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSData * jsondata= [NSData dataWithContentsOfURL:URL];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                      jsondata options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"des :%@",jsonObjects);
    
    
    NSMutableDictionary * respdic = [[NSMutableDictionary alloc]init];
    
    respdic = [jsonObjects valueForKey:@"text"];
    
      // for labels..
    temp_reviewstr=[NSString stringWithFormat:@"%@",[respdic valueForKey:@"brand_name"]];
    
    
    
    //custom label....
    
    
    
    //DYNAMIC CREATION OF "DESCRIPTION" LABEL...
    
    NSString *Descrstr=[NSString stringWithFormat:@"%@",[respdic valueForKey:@"review_description"]];
    
    NSLog(@"app.munjisDescription:%@",[respdic valueForKey:@"review_description"]);
    
       CGSize size1 = [[respdic valueForKey:@"review_description"] sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(300, 3000) lineBreakMode:NSLineBreakByWordWrapping];
    
    lbl_Review_descrr =[[UILabel alloc]initWithFrame:CGRectMake(2,40, size1.width, size1.height)];
    lbl_Review_descrr.numberOfLines = 0;
    lbl_Review_descrr.lineBreakMode = NSLineBreakByWordWrapping;
    
    
    
    [[respdic valueForKey:@"review_description"] stringByAddingPercentEscapesUsingEncoding:
     NSUTF8StringEncoding];
    temp_rev_des=[NSString stringWithFormat:@"%@",[respdic valueForKey:@"review_description"]];
   
    
    
    
    [self.view_review addSubview:lbl_Review_descrr];
 [self GetColorsData];
    
}



-(void)GetColorsData

{
    
    NSString *str1=[NSString stringWithFormat:@"%@",app.priceDetailed_id];
    
    NSLog(@"Output :%@",app.priceDetailed_id);
    
   // NSString *urlString =[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/detail_newcar_color?data={\"model_id\":\"23\"}"];
    
    NSString *urlString =[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/detail_newcar_color?data={\"model_id\":\"%@\"}",str1];

    
       
    NSURL *URL = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSData * jsondata= [NSData dataWithContentsOfURL:URL];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                      jsondata options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"Output :%@",jsonObjects);
    
    
    NSMutableDictionary * respdic = [[NSMutableDictionary alloc]init];
    
    respdic = [jsonObjects valueForKey:@"text"];
    
    // for labels..
    array1 = [respdic valueForKey:@"color_name"];
    array2 = [respdic valueForKey:@"color_hex_code"];
    
    
  self.collection_view.frame=CGRectMake(0, 0, 303, 145*[array2 count]);
    [self GetNewsData];
}



-(NSInteger)numberOfSectionsInCollectionView:
(UICollectionView *)collectionView

{
    return 1;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section
{
    if ([tag1 isEqualToString:@"2"])
    {
        return [photosarray count];
    }
    if ([tag1 isEqualToString:@"4"])
    {
        return [array1 count];
    }
    return 0;
    
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath

{
    

    if ([tag1 isEqualToString:@"4"])
    {
    
    ByPriceFinalColorCollViewCell *cell1 = [self.collection_view
   dequeueReusableCellWithReuseIdentifier:@"ByPriceFinalColorCollViewCell"
  forIndexPath:indexPath];
    
    
    if (cell1 == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ByPriceFinalColorCollViewCell" owner:self options:nil];
        cell1 = [nib objectAtIndex:0];
    }
    
    // for labels...
    cell1.lbl_colorname.text=[array1 objectAtIndex:indexPath.row];
    
    
    NSString *str=[array2 objectAtIndex:indexPath.row];
    str =[str stringByReplacingOccurrencesOfString:@"#" withString:@""];
    
    [cell1.view_colorss setBackgroundColor:[self colorWithHexString:str]];
        return cell1;
    
    NSLog(@"array2 :%@",[array2 objectAtIndex:indexPath.row]);
    }
   if ([tag1 isEqualToString:@"2"])
   {
       
       collectioncell *cell2 = [self.photos_view
                                                dequeueReusableCellWithReuseIdentifier:@"collectionidentifier"
                                                forIndexPath:indexPath];

       
       
        if (cell2 == nil)
       {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"collectionidentifier" owner:self options:nil];
            cell2 = [nib objectAtIndex:0];
        }

        imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 140, 110)];
       
       
       
      // NSData*data=[NSData dataWithContentsOfURL:[NSURL URLWithString:newString]];
           /*  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
           //set your image on main thread.
           dispatch_async(dispatch_get_main_queue(), ^{
               imageview.image=[UIImage imageWithData:data];
               [cell2.contentView addSubview:imageview];
           });
       });
*/
       
       NSString *imstr=[[[NSUserDefaults standardUserDefaults] valueForKey:@"imagekey"] objectAtIndex:indexPath.row];
       NSLog(@"imstr:%@",imstr);
       NSString *newString =[imstr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
       NSLog(@"newString:%@",newString);
       
      // NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:newString]];
       [imageview setImageWithURL:[NSURL URLWithString:newString] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
       [cell2.contentView addSubview:imageview];

       
       
        return cell2;
       
    }

    
   // cell1.view_colorss.text=[array2 objectAtIndex:indexPath.row];
   // cell1.lbl_price.text=[array3 objectAtIndex:indexPath.row];
    
    
   // cell1.backgroundColor=[UIColor clearColor];
    return nil;

    
}








- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (IBAction)btn_general:(id)sender
//{
//    self.view_general.hidden=NO;
//    self.view_overview.hidden=YES;
//    self.view_photos.hidden=YES;
//    self.view_review.hidden=YES;
//    self.view_colors.hidden=YES;
//    self.view_news.hidden=YES;
//}
//
//- (IBAction)btn_overview:(id)sender
//{
//    self.view_overview.hidden=NO;
//    self.view_general.hidden=YES;
//    self.view_photos.hidden=YES;
//    self.view_review.hidden=YES;
//    self.view_colors.hidden=YES;
//    self.view_news.hidden=YES;
//
//}
//
//
//- (IBAction)btn_photos:(id)sender
//{
//    self.view_photos.hidden=NO;
//    self.view_general.hidden=YES;
//    self.view_overview.hidden=YES;
//    self.view_review.hidden=YES;
//    self.view_colors.hidden=YES;
//    self.view_news.hidden=YES;
//
//}
//
//- (IBAction)btn_review:(id)sender
//{
//    self.view_review.hidden=NO;
//    self.view_general.hidden=YES;
//    self.view_overview.hidden=YES;
//    self.view_photos.hidden=YES;
//    self.view_colors.hidden=YES;
//    self.view_news.hidden=YES;
//
//}
//
//- (IBAction)btn_colors:(id)sender
//{
//    self.view_colors.hidden=NO;
//    self.view_general.hidden=YES;
//    self.view_overview.hidden=YES;
//    self.view_photos.hidden=YES;
//    self.view_review.hidden=YES;
//    self.view_news.hidden=YES;
//
//}
//
//- (IBAction)btn_news:(id)sender
//{
//    
//    self.view_news.hidden=NO;
//    self.view_general.hidden=YES;
//    self.view_overview.hidden=YES;
//    self.view_photos.hidden=YES;
//    self.view_review.hidden=YES;
//    self.view_colors.hidden=YES;
//    
//
//}


@end
