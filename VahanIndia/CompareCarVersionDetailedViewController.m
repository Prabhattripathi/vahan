//
//  CompareCarVersionDetailedViewController.m
//  VahanIndia
//
//  Created by geniemac4 on 17/04/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import "CompareCarVersionDetailedViewController.h"
#import "BaseTableView.h"
#import "BaseTableView.h"
#import "MBProgressHUD.h"
#import "DemoAppDelegate.h"
#import "CompareCarModelDetailedViewController.h"
#import "CompareCarVersionDetailedTableViewCell.h"
#import "CompareCarViewController.h"


@interface CompareCarVersionDetailedViewController ()
{
    UIImage * image;
    BaseTableView *basetab;
    NSMutableArray *sample1;
    NSArray *images;
    UIImageView *backimgview;
    NSMutableArray *ViewsArray;
    
    DemoAppDelegate *app;
    
    NSMutableArray * array1;
    NSMutableArray * array2;
    MBProgressHUD* HUD;
    
    
    NSMutableArray *array_brand_name;
    NSMutableArray *array_brand_id;
    
    NSMutableArray *array_model_name;
    NSMutableArray *array_model_id;
    
    NSMutableArray *array_version_name;
    NSMutableArray *array_version_id;
    NSMutableArray * array_carid;
    NSMutableArray * array_carname;
    NSMutableArray * array_carimage;

    
    NSString *brandstr ,*modelstr;
    
}

@end

@implementation CompareCarVersionDetailedViewController

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
  //  self.view.backgroundColor=[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0];
    
    
    
    
    //==== For Activity Indicator ..using HUD..=======
    
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    HUD.delegate = self;
    HUD.labelText = @"Please Wait...";
    //HUD.mode = MBProgressHUDModeAnnularDeterminate;
    [self.view addSubview:HUD];
    
    [HUD showAnimated:YES whileExecutingBlock:^{
        
        [self GetCompareVersionData];
        
        
    } completionBlock:^{
        
        [self.table_view reloadData];
        
    }];
    
    
    //imp step....
    self.table_view.backgroundColor=[UIColor clearColor];

}



-(void)GetCompareVersionData

{
    
    
    NSString *str9=[NSString stringWithFormat:@"%@",app.comparecar2ID];
    
    NSLog(@"Output :%@",app.comparecar2ID);
        
    NSString *urlString =[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/versiondropdwon?data={\"model_id\":\"%@\"}",str9];
    
    NSLog(@"urlstyju%@",urlString);
       
    NSURL *URL = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSData * jsondata= [NSData dataWithContentsOfURL:URL];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                      jsondata options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"Output :%@",jsonObjects);
    
    NSMutableDictionary * respdic = [[NSMutableDictionary alloc]init];
    
    respdic = [jsonObjects valueForKey:@"version"];
    
    
    array_version_name = [respdic valueForKey:@"version_name"];
    NSLog(@"abnkl%@",array_version_name);
    array_version_id = [respdic valueForKey:@"versionid"];
    array_carid = [respdic valueForKey:@"carid"];
    array_carname = [respdic valueForKey:@"carname"];
    array_carimage = [respdic valueForKey:@"carimage"];
    

    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [array_version_name count];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"CompareCarVersionDetailedTableViewCell";
    
    CompareCarVersionDetailedTableViewCell *cell1 = (CompareCarVersionDetailedTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell1 == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CompareCarVersionDetailedTableViewCell" owner:self options:nil];
        cell1 = [nib objectAtIndex:0];
    }
    
    
    //cell1.Viewbg.layer.cornerRadius=10;
    //  cell1.ViewBg.layer.borderColor=[UIColor blackColor].CGColor;
    //cell1.ViewBg.layer.borderWidth=1;
    
    cell1.lbl_carVersions.text=[array_version_name objectAtIndex:indexPath.row];
    
    // for 1 image...
    // cell1.imageView.image = [UIImage imageNamed:@"Hotel1.jpeg"];
    
    cell1.selectionStyle=UITableViewCellSelectionStyleNone;
    
    // cell1.backgroundColor=[UIColor clearColor];
    
    return cell1;
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    if (app.firstbtn==FALSE)
    {
        app.var=TRUE;
        
        app.comparecar3ID=[NSString stringWithFormat:@"%@",[array_carid objectAtIndex:indexPath.row]];
        
        app.comparecar4ID=[NSString stringWithFormat:@"%@",[array_carname objectAtIndex:indexPath.row]];
        
        app.comparecar5ID=[NSString stringWithFormat:@"%@",[array_carimage objectAtIndex:indexPath.row]];
        
                
        
        CompareCarViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"CompareCarViewController"];
        [self.navigationController pushViewController:hvc animated:YES];

    }
    if (app.firstbtn==TRUE)
    {
        app.var=TRUE;
        
        app.comparecar9ID=[NSString stringWithFormat:@"%@",[array_carid objectAtIndex:indexPath.row]];
        
        app.comparecar6ID=[NSString stringWithFormat:@"%@",[array_carname objectAtIndex:indexPath.row]];
        
        app.comparecar7ID=[NSString stringWithFormat:@"%@",[array_carimage objectAtIndex:indexPath.row]];

        
        
        CompareCarViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"CompareCarViewController"];
        [self.navigationController pushViewController:hvc animated:YES];

    }
    
    
    
    
    
    
    
//    app.var=TRUE;
//    
//    app.comparecar3ID=[NSString stringWithFormat:@"%@",[array_carid objectAtIndex:indexPath.row]];
//    
//    app.comparecar4ID=[NSString stringWithFormat:@"%@",[array_carname objectAtIndex:indexPath.row]];
//    
//    app.comparecar5ID=[NSString stringWithFormat:@"%@",[array_carimage objectAtIndex:indexPath.row]];
//    
//    app.comparecar6ID=[NSString stringWithFormat:@"%@",[array_carname objectAtIndex:indexPath.row]];
//    
//    
//
//    CompareCarViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"CompareCarViewController"];
//    [self.navigationController pushViewController:hvc animated:YES];


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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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




@end
