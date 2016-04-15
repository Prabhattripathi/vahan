//
//  HomeViewController.m
//  VahanIndia
//
//  Created by geniemac4 on 26/03/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import "HomeViewController.h"
#import "BaseTableView.h"
#import "MBProgressHUD.h"
#import "DemoAppDelegate.h"
#import "HomeCollectionVIewCell.h"
#import "NewCarViewController.h"
#import "UsedCarViewController.h"
#import "SellCarViewController.h"
#import "AboutUsViewController.h"
#import "FinanceViewController.h"
#import "CompareCarViewController.h"
#import "NewsReviewsViewController.h"
#import "InsuranceViewController.h"
#import "SearchViewController.h"


@interface HomeViewController ()

{
    BaseTableView *basetab;
    MBProgressHUD *HUD;
    DemoAppDelegate *app;
    
    NSMutableArray *headerarray;
    UIImageView *backimgview;
    UIScrollView *scroll;
    UIScrollView *scroll1,*scroll2;
    UIPageControl *pager,*pager1;
    NSString *uid;
    UIButton *prevbtn;
    UIButton *nextbtn;
    NSInteger page;
    NSInteger page1;
    
    
    ///  ===  latest news array === ///
    NSString *newidstr,*newimagstr,*newtitlestr,*newauthorstr,*newdatestr,*newdescriptiostr,*newlikestr,*newcomentstr,*newgenrestr,*bannarimg;
    
    int error1;
    int error2;
    int error3;
    int error4;
    
    // for dashboard's images...
    
    NSMutableArray *IMGS;
    
    UIImage *image;


}

@end

@implementation HomeViewController

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
    
  //  [self setFontFamily:@"ProximaNova-Regular" forView:self.view andSubViews:YES];
    
    //==== For Activity Indicator =======
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    HUD.delegate = self;
    HUD.labelText = @"Please Wait...";
    //HUD.mode = MBProgressHUDModeAnnularDeterminate;
    [self.view addSubview:HUD];
    
 //   uid=[[NSUserDefaults standardUserDefaults]valueForKey:@"Userid"];
    
    
    /// ===  back image ==== /////
    
    backimgview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
    backimgview.backgroundColor=[UIColor blackColor];
    backimgview.alpha=0.6;
    [self.view addSubview:backimgview];
    backimgview.hidden=YES;
    
    
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
    
    
    
    
    /// ===== notification lable making circle === ////
    
   // notificationlbl.layer.cornerRadius=(notificationlbl.frame.size.height)/2;
    
   // notificationlbl.hidden=true;
    
    /// === header name array === ///
    
    headerarray=[[NSMutableArray alloc]init];
    [headerarray addObject:@"WHATS NEW"];
    [headerarray addObject:@"LATEST NEWS"];
    [headerarray addObject:@"LITOMANIA LITFEST"];
    [headerarray addObject:@"AUTHORS"];
    [headerarray addObject:@"LITFEST SESSION VIDEOS"];
    
    //self.tabview.showsVerticalScrollIndicator=NO;
    
    
    
    
    
    
    
    // for the dashboards images...
    IMGS = [NSMutableArray arrayWithObjects:@"newcar-icon.png",@"usedcar.png",@"sellcar.png",@"compare-car-icon.png",@"insurance-icon.png",@"finance-icon.png",@"dashboard.png",@"aboputus-icon.png",nil];
    
}




-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer
{
    backimgview.hidden=YES;
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
    backimgview.hidden=NO;
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





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btn_menu:(id)sender
{
    backimgview.hidden=NO;
    basetab.hidden=NO;
    //tabview.userInteractionEnabled=NO;
    self.btn_menu_outlet.userInteractionEnabled=NO;
    self.searchbar.userInteractionEnabled=NO;
    //self.notificationbtnoutlet.userInteractionEnabled=NO;
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
    backimgview.hidden=YES;
   // tabview.userInteractionEnabled=YES;
    self.btn_menu_outlet.userInteractionEnabled=YES;
    self.searchbar.userInteractionEnabled=YES;
    //self.notificationbtnoutlet.userInteractionEnabled=YES;
    
    [self.view endEditing:YES];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.50];
    [UIView setAnimationBeginsFromCurrentState:YES];
    basetab.frame = CGRectMake(-280, 71, 280, self.view.frame.size.height-50);
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

- (IBAction)btn_hiden:(id)sender
{
    SearchViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"SearchViewController"];
    [self.navigationController pushViewController:hvc animated:YES];
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




// for the dashboards images abd animations...


-(NSInteger)numberOfSectionsInCollectionView:
(UICollectionView *)collectionView

{
    return 1;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section
{
    return IMGS.count;
    //return listImages.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    HomeCollectionVIewCell *myCell = [collectionView
                                  dequeueReusableCellWithReuseIdentifier:@"cell"
                                  forIndexPath:indexPath];
    
    
    
    myCell.img_view.image = [UIImage imageNamed:[IMGS objectAtIndex:indexPath.row]];
    
    return myCell;
    
    
    //    static NSString *identifier = @"Cell";
    //
    //    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    //
    //    UIImageView *listImageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 0, 135, 150)];
    //    listImageView.image = [UIImage imageNamed:[listImages objectAtIndex:indexPath.row]];
    //
    //    return cell;
    
    
}


-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    app.var=FALSE;
    HomeCollectionVIewCell *cell = (HomeCollectionVIewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    
    [UIView transitionWithView:cell.img_view                         duration:0.7 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^
     {
         self.view.userInteractionEnabled=false;
     }
                    completion:^(BOOL finished)
     
     {
         //after finish animation
         self.view.userInteractionEnabled=true;
         
     }];
    double delayInSeconds = 0.8;
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void)
                   {
                       
                       if (indexPath.row==0)
                       {
                           NewCarViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"NewCarViewController"];
                           [self.navigationController pushViewController:hvc animated:YES];
                           
                       }
                       else if (indexPath.row==1)
                       {
                           UsedCarViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"UsedCarViewController"];
                           [self.navigationController pushViewController:hvc animated:YES];
                       }
                       else if (indexPath.row==2)
                       {
                           SellCarViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"SellCarViewController"];
                           [self.navigationController pushViewController:hvc animated:YES];
                       }
                       
                       else if (indexPath.row==3)
                       {
                           CompareCarViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"CompareCarViewController"];
                           [self.navigationController pushViewController:hvc animated:YES];
                       }
                       
                       else if (indexPath.row==4)
                       {
                           InsuranceViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"InsuranceViewController"];
                           [self.navigationController pushViewController:hvc animated:YES];
                       }


                       
                       else if (indexPath.row==5)
                       {
                           FinanceViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"FinanceViewController"];
                           [self.navigationController pushViewController:hvc animated:YES];
                       }
                       
                       else if (indexPath.row==6)
                       {
                           NewsReviewsViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"NewsReviewsViewController"];
                           [self.navigationController pushViewController:hvc animated:YES];
                       }



                       else if (indexPath.row==7)
                       {
                           AboutUsViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"AboutUsViewController"];
                           [self.navigationController pushViewController:hvc animated:YES];
                       }
                       
//                       else
//                       {
//                           ContactUsViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"ContactUsViewController"];
//                           [self.navigationController pushViewController:hvc animated:YES];
//                       }
//
//                       else
//                       {
//                           ContactUsViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"ContactUsViewController"];
//                           [self.navigationController pushViewController:hvc animated:YES];
//                       }
//
//                       else
//                       {
//                           ContactUsViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"ContactUsViewController"];
//                           [self.navigationController pushViewController:hvc animated:YES];
//                       }

                       
                   });
    
    
}





@end
