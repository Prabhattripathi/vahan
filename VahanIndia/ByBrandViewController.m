//
//  ByBrandViewController.m
//  VahanIndia
//
//  Created by geniemac4 on 27/03/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import "ByBrandViewController.h"
#import "BaseTableView.h"
#import "ByBrandTableViewCell.h"
#import "SDWebImageCompat.h"
#import "SDWebImageManager.h"
#import "UIImageView+WebCache.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
#import "MBProgressHUD.h"
#import "DemoAppDelegate.h"
#import "ByBrandDetailedViewController.h"



@interface ByBrandViewController ()

{
    
    UIImage *image;
     BaseTableView *basetab;
    
        NSMutableArray *sample1;
        NSArray *images;
        UIImageView *backimgview;
        NSMutableArray *ViewsArray;
     DemoAppDelegate *app;
    NSMutableArray * array1;
    NSMutableArray * array2;
    NSMutableArray * array3;
    
    MBProgressHUD *HUD;


}

@end

@implementation ByBrandViewController

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
        
        [self GetBrandData];
        
        
    } completionBlock:^{
        
        [self.table_view reloadData];
        
    }];

    
    
//    // for table view's list..
//    
//    sample1 = [[NSMutableArray alloc]init];
//    
//   
//    [sample1 addObject:@"Hyundai"];
//    [sample1 addObject:@"Ford"];
//    [sample1 addObject:@"Jaguar"];
//    [sample1 addObject:@"Maruti"];
//    [sample1 addObject:@"Tata"];
//    [sample1 addObject:@"Mahindra"];
//    [sample1 addObject:@"Chevrolet"];
//    [sample1 addObject:@"Datsun"];
//    
//    
//    images=[NSArray arrayWithObjects:@"Hyundai.png",@"ford.jpg",@"jaguar.png",@"maruti.jpg",@"tata.png",@"mahindra.png",@"chevrolet.jpg",@"datsun.jpg", nil];
//    

    
    //imp step....
    self.table_view.backgroundColor=[UIColor clearColor];
    
    
}



-(void)GetBrandData

{
    
    NSString *urlString =@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/getbrand";
    
    
    
    NSURL *URL = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSData * jsondata= [NSData dataWithContentsOfURL:URL];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                      jsondata options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"Output :%@",jsonObjects);
    
    NSMutableDictionary * respdic = [[NSMutableDictionary alloc]init];
    
    respdic = [jsonObjects valueForKey:@"userdata"];
    
    
    array2 = [respdic valueForKey:@"brand_id"];
    array1 = [respdic valueForKey:@"brand_name"];
    array3 = [respdic valueForKey:@"brand_image_path"];
    
    
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
    return [array1 count];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"ByBrandTableViewCell";
    
    ByBrandTableViewCell *cell1 = (ByBrandTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell1 == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ByBrandTableViewCell" owner:self options:nil];
        cell1 = [nib objectAtIndex:0];
    }
    
    
    cell1.Viewbg.layer.cornerRadius=10;
    //  cell1.ViewBg.layer.borderColor=[UIColor blackColor].CGColor;
    //cell1.ViewBg.layer.borderWidth=1;
    
    //for label
    cell1.lbl_name.text =[array1 objectAtIndex:indexPath.row];
    
   // for images
    
    NSLog(@"img:%@",array3[indexPath.row]);
    
    NSData *data=[NSData dataWithContentsOfURL:[NSURL URLWithString:array3[indexPath.row]]];
    
    cell1.img_view.image=[UIImage imageWithData:data];

    
//    cell1.img_view.layer.cornerRadius = cell1.img_view.frame.size.height /2;
//    cell1.img_view.layer.masksToBounds = YES;
//    cell1.img_view.layer.borderWidth = 1;
//    cell1.img_view.layer.borderColor = [UIColor blueColor].CGColor;

    
     cell1.selectionStyle=UITableViewCellSelectionStyleNone;
    
    cell1.backgroundColor=[UIColor clearColor];
    return cell1;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    app.brand_id=[NSString stringWithFormat:@"%@",[array2 objectAtIndex:indexPath.row]];
    
    ByBrandDetailedViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"ByBrandDetailedViewController"];
    [self.navigationController pushViewController:hvc animated:YES];

    
    
    //    if(indexPath.row==0)
    //    {
    //        //for profile segue
    //        [self performSegueWithIdentifier:@"GuruB_Detailed_segue" sender:nil];
    //
    //    }
    
    
}




//ds method is fr animations..

//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    
//    //1. Setup the CATransform3D structure
//    CATransform3D rotation;
//    rotation = CATransform3DMakeRotation( (220*M_PI)/90, 0.0, 3.7, 3.4);
//    rotation.m34 = 10.0/ -2000;
//    
//    
//    //2. Define the initial state (Before the animation)
//    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
//    cell.layer.shadowOffset = CGSizeMake(10, 10);
//    cell.alpha = 0;
//    
//    cell.layer.transform = rotation;
//    cell.layer.anchorPoint = CGPointMake(0, 0.5);
//    
//    
//    //3. Define the final state (After the animation) and commit the animation
//    [UIView beginAnimations:@"rotation" context:NULL];
//    [UIView setAnimationDuration:0.8];
//    cell.layer.transform = CATransform3DIdentity;
//    cell.alpha = 1;
//    cell.layer.shadowOffset = CGSizeMake(0, 0);
//    [UIView commitAnimations];
//    
//}




-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer
{
    //backimgview.hidden=YES;
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
  //  backimgview.hidden=YES;
    // tabview.userInteractionEnabled=YES;
    self.btn_menu_outlet.userInteractionEnabled=YES;
   // self.searchbar.userInteractionEnabled=YES;
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





@end
