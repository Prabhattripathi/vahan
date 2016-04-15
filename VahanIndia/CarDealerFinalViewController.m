//
//  CarDealerFinalViewController.m
//  VahanIndia
//
//  Created by geniemac4 on 10/04/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import "CarDealerFinalViewController.h"
#import "BaseTableView.h"
#import "MBProgressHUD.h"
#import "DemoAppDelegate.h"
#import "CarDealerFinalTableViewCell.h"


@interface CarDealerFinalViewController ()
{
    UIImage * image;
    BaseTableView *basetab;
    NSMutableArray *sample1;
    NSArray *images;
    UIImageView *backimgview;
    NSMutableArray *ViewsArray;
    
    
    NSMutableArray * array1;
    NSMutableArray * array2;
    NSMutableArray * array3;
    NSMutableArray * array4;
    NSMutableArray * array5;
    NSMutableArray * array6;
    NSMutableArray * array7;
    
    DemoAppDelegate *app;
    
    
}

@end

@implementation CarDealerFinalViewController

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
    
    
    //imp step...
    self.table_view.backgroundColor=[UIColor clearColor];
    
    [self GetCardealerFinalData];

}



-(void)GetCardealerFinalData

{
    
    NSString *str1=[NSString stringWithFormat:@"%@",app.cardealer_id];
    NSString *str2=[NSString stringWithFormat:@"%@",app.cardealer_Cityid];
    
    NSLog(@"Output :%@",app.cardealer_id);
    NSLog(@"Output :%@",app.cardealer_Cityid);
    
    NSString *urlString =[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/detail_newcar_dealercontactlist?data={\"brand_id\":\"%@\",\"city_id\":\"%@\"}",str1,str2];
    
    
    // http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/detail_newcar_dealercontactlist?data={%22brand_id%22:%2215%22,%22city_id%22:%22666%22}
    
    
    
    
    
    NSURL *URL = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSData * jsondata= [NSData dataWithContentsOfURL:URL];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                      jsondata options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"Output :%@",jsonObjects);
    
    NSMutableDictionary * respdic = [[NSMutableDictionary alloc]init];
    
    respdic = [jsonObjects valueForKey:@"text"];
    
    // for labels..
    array1 = [respdic valueForKey:@"ds_name"];
    array2 = [respdic valueForKey:@"ds_address"];
    array3 = [respdic valueForKey:@"city_name"];
    array4 = [respdic valueForKey:@"address_pincode"];
    array5 = [respdic valueForKey:@"stateName"];
    array6 = [respdic valueForKey:@"ds_mobile"];
    array7 = [respdic valueForKey:@"brand_name"];
    
    
    
    [self.table_view reloadData];
    
    
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
    return [array1 count];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 205;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"CarDealerFinalTableViewCell";
    
    CarDealerFinalTableViewCell *cell1 = (CarDealerFinalTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell1 == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CarDealerFinalTableViewCell" owner:self options:nil];
        cell1 = [nib objectAtIndex:0];
    }
    
    
    cell1.Viewbg.layer.cornerRadius=10;
    
    //  cell1.ViewBg.layer.borderColor=[UIColor blackColor].CGColor;
    //cell1.ViewBg.layer.borderWidth=1;
    
    
    // for label...
    cell1.lbl_cardealername.text=[array1 objectAtIndex:indexPath.row];
    cell1.lbl_cardealerAddress.text=[array2 objectAtIndex:indexPath.row];
    cell1.lbl_cardealerCityName.text=[array3 objectAtIndex:indexPath.row];
    cell1.lbl_cardealerPincodeAdd.text=[array4 objectAtIndex:indexPath.row];
    cell1.lbl_cardealerStatename.text=[array5 objectAtIndex:indexPath.row];
    cell1.lbl_cardealerMobile.text=[array6 objectAtIndex:indexPath.row];

    
    
    cell1.selectionStyle=UITableViewCellSelectionStyleNone;
    cell1.backgroundColor=[UIColor clearColor];
    return cell1;
    
}



//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//
//
//    ByPriceDetailedViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"ByPriceDetailedViewController"];
//    [self.navigationController pushViewController:hvc animated:YES];
//
//
//
//
//}




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
