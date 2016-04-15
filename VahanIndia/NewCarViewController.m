//
//  NewCarViewController.m
//  VahanIndia
//
//  Created by geniemac4 on 26/03/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import "NewCarViewController.h"
#import "NewCarTableViewCell.h"
#import "BaseTableView.h"
#import "MBProgressHUD.h"
#import "DemoAppDelegate.h"
#import "ByPriceViewController.h"
#import "ByBrandViewController.h"
#import "ByFuelViewController.h"
#import "ByBodyTypeViewController.h"
#import "CarDealersViewController.h"
#import "CarServiceStnViewController.h"
#import "BaseTableView.h"


@interface NewCarViewController ()

{
    NSMutableArray *sample1;
    NSArray *images;
    BaseTableView *basetab;
    UIImageView *backimgview;
    NSMutableArray *ViewsArray;
  
    UIImage *image;
    
}

@end

@implementation NewCarViewController

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
    
    ViewsArray=[[NSMutableArray alloc]initWithObjects:@"ByPriceViewController", @"ByBrandViewController",@"ByFuelViewController",@"ByBodyTypeViewController",@"CarDealersViewController",@"CarServiceStnViewController",nil];
    
    self.table_view.backgroundColor=[UIColor clearColor];
    
    
    //for the view's background color...
    self.view.backgroundColor=[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0];
    
    // for table view's list..
    
    sample1 = [[NSMutableArray alloc]init];
    
    [sample1 addObject:@"BY PRICE"];
    [sample1 addObject:@"BY BRAND"];
    [sample1 addObject:@"BY FUEL"];
    [sample1 addObject:@"BY BODY TYPE"];
    [sample1 addObject:@"CAR DEALERS"];
    [sample1 addObject:@"Car Service Station"];
    
    
    images=[NSArray arrayWithObjects:@"11-set.jpeg",@"TravelAdapter.jpeg",@"BodyMist.jpeg",@"BodyMist.jpeg",@"BodyMist.jpeg",@"BodyMist.jpeg", nil];
    
    
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



    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    //return 5;
    return [sample1 count];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"NewCarTableViewCell";
    
    NewCarTableViewCell *cell1 = (NewCarTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell1 == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NewCarTableViewCell" owner:self options:nil];
        cell1 = [nib objectAtIndex:0];
    }
    
    
    cell1.ViewBg.layer.cornerRadius=10;
  //  cell1.ViewBg.layer.borderColor=[UIColor blackColor].CGColor;
    //cell1.ViewBg.layer.borderWidth=1;
    
    
    cell1.lbl_name.text =[sample1 objectAtIndex:indexPath.row];
   // cell1.lbl2.text =[sample2 objectAtIndex:indexPath.row];
    
    
    
    // for 1 image...
    // cell1.imageView.image = [UIImage imageNamed:@"Hotel1.jpeg"];
    
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 20, 100, 100)];
    imgView.image = [UIImage imageNamed:[images objectAtIndex:indexPath.row]];
    [cell1.contentView addSubview:imgView];
    
    
    // txtview.layer.borderColor = [[[UIColor blackColor] colorWithAlphaComponent:0.5] CGColor];
    //  txtview.layer.borderWidth = 1.5;
    // txtview.layer.cornerRadius = 6;
    imgView.layer.cornerRadius = 50;
    imgView.clipsToBounds = YES;
    
    cell1.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
    cell1.backgroundColor=[UIColor clearColor];
        return cell1;
    
}


//ds method is fr animations..

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    //1. Setup the CATransform3D structure
    CATransform3D rotation;
    rotation = CATransform3DMakeRotation( (-90*M_PI)/90, 0.0, 3.7, 3.4);
    rotation.m34 = 1.0/ -600;
    
    
    //2. Define the initial state (Before the animation)
    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    
    cell.layer.transform = rotation;
    cell.layer.anchorPoint = CGPointMake(0, 0.5);
    
    
    //3. Define the final state (After the animation) and commit the animation
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.8];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    [UIView commitAnimations];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    UIViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:ViewsArray[indexPath.row]];
    [self.navigationController pushViewController:viewController animated:YES];
    
    
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


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    backimgview.hidden=YES;
    // tabview.userInteractionEnabled=YES;
    self.btn_menu_outlet.userInteractionEnabled=YES;
    //self.searchbtnoutlet.userInteractionEnabled=YES;
    //self.notificationbtnoutlet.userInteractionEnabled=YES;
    
    [self.view endEditing:YES];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.50];
    [UIView setAnimationBeginsFromCurrentState:YES];
    basetab.frame = CGRectMake(-280, 71, 280, self.view.frame.size.height-50);
    [UIView commitAnimations];
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



@end

