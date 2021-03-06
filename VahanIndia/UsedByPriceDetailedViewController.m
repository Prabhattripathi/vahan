//
//  UsedByPriceDetailedViewController.m
//  VahanIndia
//
//  Created by geniemac4 on 10/04/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import "UsedByPriceDetailedViewController.h"
#import "BaseTableView.h"
#import "ByPrizeTableViewCell.h"
#import "BaseTableView.h"
#import "MBProgressHUD.h"
#import "DemoAppDelegate.h"
#import "UsedByPriceDetailedTableViewCell.h"
#import "UsedCarFinallllViewController.h"


@interface UsedByPriceDetailedViewController ()
{
    UIImage * image;
    BaseTableView *basetab;
    NSMutableArray *sample1;
    NSArray *images;
    UIImageView *backimgview;
    NSMutableArray *ViewsArray;
    MBProgressHUD * HUD;
    
    
    NSMutableArray * array1;
    NSMutableArray * array2;
    NSMutableArray * array3;
    NSMutableArray * array4;
    NSMutableArray * array5;
    NSMutableArray * array6;
    NSMutableArray * array7;
    NSMutableArray * array8;
    NSMutableArray * array9;
    
    DemoAppDelegate *app;
    
    
}

@end

@implementation UsedByPriceDetailedViewController

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
        
        [self UsedGetPriceDetailedData];
        
        
    } completionBlock:^{
        
        [self.table_view reloadData];
        
    }];
    
    
    
    
    
    //imp step....
    self.table_view.backgroundColor=[UIColor clearColor];
    

}




-(void)UsedGetPriceDetailedData

{
    
    NSString *str=[NSString stringWithFormat:@"%@",app.UsedCar_Priceid];
    
    //  NSString *urlString =[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/filter_usedcar_price?data={\"usedcar_id\":\"1787\"}"];
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/filter_usedcar_price?data={\"usedcar_id\":\"%@\"}",str];
    
    
    
    //http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/filter_usedcar_price?data={"usedcar_id":"17"}
    
    
    
    NSURL *URL = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSData * jsondata= [NSData dataWithContentsOfURL:URL];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                      jsondata options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"Output :%@",jsonObjects);
    
    NSMutableDictionary * respdic = [[NSMutableDictionary alloc]init];
    
    respdic = [jsonObjects valueForKey:@"text"];
    
    // for labels..
    array1 = [respdic valueForKey:@"model name"];
    array2 = [respdic valueForKey:@"city"];
    array3 = [respdic valueForKey:@"Used car price"];
    array5 = [respdic valueForKey:@"KMS"];
    array6 = [respdic valueForKey:@"Owner"];
    array7 = [respdic valueForKey:@"fuel_name"];
    array8 = [respdic valueForKey:@"transmission"];
    
    array9 = [respdic valueForKey:@"car_id"];
    
    //for images...
    array4 = [respdic valueForKey:@"image"];
    
    
    
    
    
    
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
    // return [sample1 count];
    return [array2 count];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 165;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"UsedByPriceDetailedTableViewCell";
    
    UsedByPriceDetailedTableViewCell *cell1 = (UsedByPriceDetailedTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell1 == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"UsedByPriceDetailedTableViewCell" owner:self options:nil];
        cell1 = [nib objectAtIndex:0];
    }
    
    
    cell1.Viewbg.layer.cornerRadius=10;
    
    //  cell1.ViewBg.layer.borderColor=[UIColor blackColor].CGColor;
    //cell1.ViewBg.layer.borderWidth=1;
    
    
    // for labels...
    cell1.lbl_modelname.text=[array1 objectAtIndex:indexPath.row];
    cell1.lbl_city.text=[array2 objectAtIndex:indexPath.row];
    cell1.lbl_usedcarprice.text=[array3 objectAtIndex:indexPath.row];
    cell1.lbl_kms.text=[array5 objectAtIndex:indexPath.row];
    cell1.lbl_owner.text=[array6 objectAtIndex:indexPath.row];
    cell1.lbl_fuelname.text=[array7 objectAtIndex:indexPath.row];
    cell1.lbl_transmission.text=[array8 objectAtIndex:indexPath.row];
    
    
    // for 1 image...
    // cell1.imageView.image = [UIImage imageNamed:@"Hotel1.jpeg"];
    
    
    // for images
    
    NSLog(@"img:%@",array4[indexPath.row]);
    
    NSData *data=[NSData dataWithContentsOfURL:[NSURL URLWithString:array4[indexPath.row]]];
    
    cell1.img_view.image=[UIImage imageWithData:data];
    
    
    //    cell1.img_view.layer.cornerRadius = cell1.img_view.frame.size.height /2;
    //    cell1.img_view.layer.masksToBounds = YES;
    //    cell1.img_view.layer.borderWidth = 0;
    
    
    cell1.selectionStyle=UITableViewCellSelectionStyleNone;
    cell1.backgroundColor=[UIColor clearColor];
    return cell1;
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //for car name and carimage...
    
    app.UsedCarImage=array4[indexPath.row];
    
    
    
    
    //   app.CarName=array1[indexPath.row];
    
    //    //Carprice and CarKMPL for finalcarVC in general tab..
    //
    //    app.CarPrice=array6[indexPath.row];
    //    app.CarKMPL=array7[indexPath.row];
    
    
    
    app.Used_Detailed_ids=[NSString stringWithFormat:@"%@",[array9 objectAtIndex:indexPath.row]];
    
    
    UsedCarFinallllViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"UsedCarFinallllViewController"];
    [self.navigationController pushViewController:hvc animated:YES];
    
    
    
    
}






//ds method is fr animations..





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

@end
