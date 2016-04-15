//
//  BaseTableView.m
//  Faida
//
//  Created by Santosh  on 10/02/14.
//  Copyright (c) 2014 geniemac5. All rights reserved.
//

#import "BaseTableView.h"
#import "Reachability.h"
#import "DemoAppDelegate.h"
#import "HomeViewController.h"
#import "NewCarViewController.h"
#import "UsedCarViewController.h"
#import "SellCarViewController.h"
#import "FinanceViewController.h"
//#import "genreViewController.h"
#import "AboutUsViewController.h"
#import "DemoViewController.h"
//#import <FacebookSDK/FacebookSDK.h>
#import "DemoAppDelegate.h"
#import "NewsReviewsViewController.h"
#import "InsuranceViewController.h"
#import "CompareCarViewController.h"


@implementation BaseTableView
@synthesize menuTableView;

/*,bystore,bydate,bylocation,addbtn,locationButton;*/

#define isiPhone5  ([[UIScreen mainScreen] bounds].size.height == 568)?TRUE:FALSE


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        if(isiPhone5)
        {
            menuTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0,self.frame.size.width,self.frame.size.height) style:UITableViewStyleGrouped];

        }
        else
        {
            menuTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,-10,self.frame.size.width,self.frame.size.height) style:UITableViewStyleGrouped];

        }
        
        menuTableView.backgroundColor = [UIColor clearColor];
        menuTableView.dataSource      = self;
        menuTableView.delegate        = self;
        //[menuTableView setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back"]]];
        menuTableView.showsVerticalScrollIndicator=NO;
        menuTableView.bounces=NO;
        menuTableView.backgroundColor=[UIColor whiteColor];
        menuTableView.scrollEnabled =YES;
        HUD = [[MBProgressHUD alloc] initWithFrame:CGRectMake(0.0, 0.0, 330.0, 550.0)];
        [self addSubview:HUD];
        HUD.delegate = self;
        HUD.labelText = @"Loading...";
        HUD.labelFont = [UIFont fontWithName:@"HelveticaNeueLTStd-Md" size:20.0f];
        HUD.userInteractionEnabled = NO;
        [self gettabledata];
        [self addSubview:menuTableView];
        
       
    }
    return self;
}
-(void)gettabledata
{
    app=(DemoAppDelegate *)[[UIApplication sharedApplication]delegate];
    
    catnamearray=[[NSMutableArray alloc]init];
    
    [catnamearray addObject:@"Dashboard"];
    [catnamearray addObject:@"New Car"];
    [catnamearray addObject:@"Used Car"];
    [catnamearray addObject:@"Sell Car"];
    [catnamearray addObject:@"Compare Car"];
    [catnamearray addObject:@"Insurance"];
    [catnamearray addObject:@"Finance"];
    [catnamearray addObject:@"News & Reviews"];
    [catnamearray addObject:@"About Us"];
    
    
    
    // FOR THE SIDEBAR'S SMAL ROUND IMAGES.....
    catnamearrayImages=[[NSMutableArray alloc]init];
    
    [catnamearrayImages addObject:@"dash-icon.png"];
    [catnamearrayImages addObject:@"new-icon.png"];
    [catnamearrayImages addObject:@"usedcar-icon.png"];
    [catnamearrayImages addObject:@"seller-icon.png"];
    [catnamearrayImages addObject:@"compare-icon.png"];
    [catnamearrayImages addObject:@"insurance-iconN.png"];
    [catnamearrayImages addObject:@"car-finace-icon.png"];
    [catnamearrayImages addObject:@"news-icon.png"];
    [catnamearrayImages addObject:@"about_us.png"];
    
    
    // FOR THE SIDEBAR'S RIGHT ARROW IMAGES.....
    catnamearrayRtArrowImages=[[NSMutableArray alloc]init];
    
    [catnamearrayRtArrowImages addObject:@"arrowright.png"];
    [catnamearrayRtArrowImages addObject:@"arrowright.png"];
    [catnamearrayRtArrowImages addObject:@"arrowright.png"];
    [catnamearrayRtArrowImages addObject:@"arrowright.png"];
    [catnamearrayRtArrowImages addObject:@"arrowright.png"];
    [catnamearrayRtArrowImages addObject:@"arrowright.png"];
    [catnamearrayRtArrowImages addObject:@"arrowright.png"];
    [catnamearrayRtArrowImages addObject:@"arrowright.png"];
    [catnamearrayRtArrowImages addObject:@"arrowright.png"];


    
    [menuTableView reloadData];
    
}



#pragma mark -- UITableView Data source & Delegate methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"ount:%lu",(unsigned long)[catnamearray count]);
    return catnamearray.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell  *cell  = [tableView dequeueReusableCellWithIdentifier:nil];
    if(!cell)
        cell  = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];

    self.menuTableView.contentInset = UIEdgeInsetsMake(-35, 0, -35, 0);
    [menuTableView setSeparatorColor:[UIColor clearColor]];

   // cell.accessoryType = UITableViewCellAccessoryNone;
    
    cell.selectedBackgroundView = [UIView new];
    NSString *str=[NSString stringWithFormat:@"%ld",(long)indexPath.row];
    if([str isEqualToString:[[NSUserDefaults standardUserDefaults]valueForKey:@"whichview"]])
    {
        cell.backgroundColor = [UIColor colorWithRed:248/255.0 green:194/255.0 blue:3/255.0 alpha:1.0];
    }
    else
    {
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    UILabel *textlabel = [[UILabel alloc]init];
    textlabel.frame = CGRectMake(40, 15, 200, 20);
    textlabel.font=[UIFont fontWithName:@"ProximaNova-Regular" size:14];
    textlabel.textColor = [UIColor blackColor];
    textlabel.text = [catnamearray objectAtIndex:indexPath.row];
    [cell.contentView addSubview:textlabel];
    
    //.. for images....
    
//    UIImage *IMAGES = [[UIImage alloc]init];
//    IMAGES=[UIImage imageNamed:catnamearrayImages[indexPath.row]];
    
    
    
    //...for small rounded images of Sidebar...
    UIImageView *IMAGES=[[UIImageView alloc]initWithFrame:CGRectMake(6, 13, 25, 25)];
    
    IMAGES.image=[UIImage imageNamed:[catnamearrayImages objectAtIndex:indexPath.row]];
    [cell.contentView addSubview:IMAGES];
    
    
    //...for right arrow images of Sidebar...
    UIImageView *IMAGESs=[[UIImageView alloc]initWithFrame:CGRectMake(250, 13, 25, 25)];
    
    IMAGESs.image=[UIImage imageNamed:[catnamearrayRtArrowImages objectAtIndex:indexPath.row]];
    [cell.contentView addSubview:IMAGESs];


    
    
    
    UILabel *diveder = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 0.6)];
    diveder.backgroundColor=[UIColor colorWithRed:11/255. green:47/255. blue:63/255. alpha:1.0f];
    [cell.contentView addSubview:diveder];
  //  cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
    
    //cell color when selected...
    
    UIView *myBackView = [[UIView alloc] initWithFrame:cell.frame];
    myBackView.backgroundColor=[UIColor colorWithRed:42/255.0 green:66/255.0 blue:125/255.0 alpha:1.0];
    cell.selectedBackgroundView = myBackView;
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 50;
}



//referred litomania...
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    app.var=FALSE;
    if(indexPath.row==0)
    {
        NSLog(@"index 0");
        
        UIStoryboard *storyboard ;
        
            storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        
        HomeViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
        [(UINavigationController *)self.window.rootViewController pushViewController:vw animated:YES];
        
    }
    
    else if (indexPath.row==1)
    {
        NSLog(@"index 1");
        UIStoryboard *storyboard ;
        
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        
    NewCarViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"NewCarViewController"];
        [(UINavigationController *)self.window.rootViewController pushViewController:vw animated:YES];
        
    }
    else if (indexPath.row==2)
    {
        NSLog(@"index 2");
        
        UIStoryboard *storyboard ;
        
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        
    UsedCarViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"UsedCarViewController"];
        [(UINavigationController *)self.window.rootViewController pushViewController:vw animated:YES];


    }
    else if (indexPath.row==3)
    {
        NSLog(@"index 3");
        
        UIStoryboard *storyboard ;
        
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        
    SellCarViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"SellCarViewController"];
        [(UINavigationController *)self.window.rootViewController pushViewController:vw animated:YES];
       

    }
    
    else if (indexPath.row==4)
    {
        NSLog(@"index 4");
        
        UIStoryboard *storyboard ;
        
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        
        CompareCarViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"CompareCarViewController"];
        [(UINavigationController *)self.window.rootViewController pushViewController:vw animated:YES];
        
        
    }

    else if (indexPath.row==5)
    {
        NSLog(@"index 5");
        
        UIStoryboard *storyboard ;
        
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        
        InsuranceViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"InsuranceViewController"];
        [(UINavigationController *)self.window.rootViewController pushViewController:vw animated:YES];
        
        
    }

    else if (indexPath.row==6)
    {
        NSLog(@"index 6");
        
        UIStoryboard *storyboard ;
        
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        
        FinanceViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"FinanceViewController"];
        [(UINavigationController *)self.window.rootViewController pushViewController:vw animated:YES];
        
        
    }

    
    else if (indexPath.row==7)
    {
        NSLog(@"index 7");
        
        UIStoryboard *storyboard ;
        
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        
        NewsReviewsViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"NewsReviewsViewController"];
        [(UINavigationController *)self.window.rootViewController pushViewController:vw animated:YES];
        
        
    }

    
    else if (indexPath.row==8)
    {
        NSLog(@"index 8");
        
        UIStoryboard *storyboard ;
        
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        
        AboutUsViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"AboutUsViewController"];
        [(UINavigationController *)self.window.rootViewController pushViewController:vw animated:YES];
        
        
    }

    
    
    
//    else if(indexPath.row==4)
//    {
//        NSLog(@"index 5");
//        [[NSUserDefaults standardUserDefaults]setObject:@"0" forKey:@"Relatedbook"];
//        [[NSUserDefaults standardUserDefaults] synchronize];
//        UIStoryboard *storyboard ;
//        if([UIScreen mainScreen].bounds.size.height == 568)
//        {
//            storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];    }
//        else
//        {
//            storyboard = [UIStoryboard storyboardWithName:@"Main2" bundle:[NSBundle mainBundle]];
//        }
//        
//        MianbooksectionViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"MianbooksectionViewController"];
//        
//        [(UINavigationController *)self.window.rootViewController pushViewController:vw animated:YES];
//
//    }
//    
//    else if (indexPath.row==5)
//    {
//        
//        UIStoryboard *storyboard ;
//        if([UIScreen mainScreen].bounds.size.height == 568)
//        {
//            storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];    }
//        else
//        {
//            storyboard = [UIStoryboard storyboardWithName:@"Main2" bundle:[NSBundle mainBundle]];
//        }
//        
//        aboutlitomaniaViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"aboutlitomaniaViewController"];
//        
//        [(UINavigationController *)self.window.rootViewController pushViewController:vw animated:YES];
//
//    }
//    
//    else if (indexPath.row==6)
//    {
//        UIStoryboard *storyboard ;
//        if([UIScreen mainScreen].bounds.size.height == 568)
//        {
//            storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//        }
//        else
//        {
//            storyboard = [UIStoryboard storyboardWithName:@"Main2" bundle:[NSBundle mainBundle]];
//        }
//        
//        ProfileViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"ProfileViewController"];
//        [(UINavigationController *)self.window.rootViewController pushViewController:vw animated:YES];
//
//    }
//    else
//    {
//        if (FBSession.activeSession.state == FBSessionStateOpen
//            || FBSession.activeSession.state == FBSessionStateOpenTokenExtended)
//        {
//            [FBSession.activeSession closeAndClearTokenInformation];
//        }
//        
//        // twitter
//        
//        app.engine=nil;
//        NSUserDefaults	*defaults = [NSUserDefaults standardUserDefaults];
//        [defaults  removeObjectForKey:@"authData"];
//        [defaults synchronize];
//        
//        [[NSUserDefaults standardUserDefaults]setObject:@"0" forKey:@"loginid"];
//        [[NSUserDefaults standardUserDefaults]synchronize];
//        
//        
//        UIStoryboard *storyboard ;
//        if([UIScreen mainScreen].bounds.size.height == 568)
//        {
//            storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];    }
//        else
//        {
//            storyboard = [UIStoryboard storyboardWithName:@"Main2" bundle:[NSBundle mainBundle]];
//        }
//        
//        ViewController *vw = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
//        
//        [(UINavigationController *)self.window.rootViewController pushViewController:vw animated:YES];
//    }
}

- (void)drawRect:(CGRect)rect
{
    
}


@end
