//
//  CompareCarViewController.m
//  VahanIndia
//
//  Created by geniemac4 on 02/04/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import "CompareCarViewController.h"
#import "BaseTableView.h"
#import "MBProgressHUD.h"
#import "DemoAppDelegate.h"
#import "ByPriceViewController.h"
#import "ByBrandViewController.h"
#import "ByFuelViewController.h"
#import "ByBodyTypeViewController.h"
#import "CarDealersViewController.h"
#import "CarServiceStnViewController.h"
#import "CompareCarDetailedViewController.h"
#import "CompareCarVersionDetailedViewController.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
#import "CompareCarTableViewCell.h"
#import "CompareBtnClickedViewController.h"


@interface CompareCarViewController ()
{
     DemoAppDelegate *app;
    NSMutableArray *sample1;
    NSArray *images;
    BaseTableView *basetab;
    UIImageView *backimgview;
    NSMutableArray *ViewsArray;
    
    UIImage *image;
    
    
    NSMutableArray *array_brand_name;
    NSMutableArray *array_brand_id;
    
   
    
}

@end

@implementation CompareCarViewController

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
    
    
    //cell1.lbl_carbrandnames.text=[array_brand_name objectAtIndex:indexPath.row];
    
    if (app.var==FALSE)
    {
       self.lbl_selectCar1.text=@"Select Car 1";
       self.lbl_selectCar2.text=@"Select Car 2";
        
        self.img_selectCar1.image=[UIImage imageNamed:@"sample_first_compare_car.png"];
        self.img_selectCar2.image=[UIImage imageNamed:@"sample_first_compare_car.png"];
        
        
    }
    
    else if(app.var==TRUE)
        
    {
            if(app.comparecar4ID==NULL && app.comparecar6ID!=NULL)
            {
                
                self.lbl_selectCar1.text=@"Select Car 1";
              //  self.img_selectCar1.image=[UIImage imageNamed:@"sample_first_compare_car.png"];
                
                [self.img_selectCar1 setImageWithURL:[NSURL URLWithString:app.comparecar5ID]  usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];

                
                self.lbl_selectCar2.text=[NSString stringWithFormat:@"%@",app.comparecar6ID];
                
                [self.img_selectCar2 setImageWithURL:[NSURL URLWithString:app.comparecar7ID]  usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];

                // set 2nd here
                
                
              }
           else if(app.comparecar6ID==NULL && app.comparecar4ID!=NULL)
            {
                
                self.lbl_selectCar2.text=@"Select Car 2";
                //self.img_selectCar2.image=[UIImage imageNamed:@"sample_first_compare_car.png"];
                [self.img_selectCar2 setImageWithURL:[NSURL URLWithString:app.comparecar7ID]  usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
                

                self.lbl_selectCar1.text=[NSString stringWithFormat:@"%@",app.comparecar4ID];
                
                 [self.img_selectCar1 setImageWithURL:[NSURL URLWithString:app.comparecar5ID]  usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
             //   set firt
            }
        
           else
           {
               
               self.lbl_selectCar2.text=[NSString stringWithFormat:@"%@",app.comparecar6ID];
               self.lbl_selectCar1.text=[NSString stringWithFormat:@"%@",app.comparecar4ID];
               
               [self.img_selectCar2 setImageWithURL:[NSURL URLWithString:app.comparecar7ID]  usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
               [self.img_selectCar1 setImageWithURL:[NSURL URLWithString:app.comparecar5ID]  usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];

               
           }
        
        
       
    }
    
   // self.lbl_selectCar1.text=app.comparecar4ID;
    
    
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
    return 5;
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"CompareCarTableViewCell";
    
    CompareCarTableViewCell *cell1 = (CompareCarTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell1 == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CompareCarTableViewCell" owner:self options:nil];
        cell1 = [nib objectAtIndex:0];
    }
    
    
   // cell1.ViewBg.layer.cornerRadius=10;
    
  //  cell1.lbl_name.text =[sample1 objectAtIndex:indexPath.row];
    
    
    
//    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 20, 100, 100)];
//    imgView.image = [UIImage imageNamed:[images objectAtIndex:indexPath.row]];
//    [cell1.contentView addSubview:imgView];
    
    
    
    cell1.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
    cell1.backgroundColor=[UIColor clearColor];
    return cell1;
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    
//    UIViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:ViewsArray[indexPath.row]];
//    [self.navigationController pushViewController:viewController animated:YES];
    
  //  app.comparecar4ID=array1[indexPath.row];

    
    
    
    
    
}

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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btn_selectCar1HDN:(id)sender
{
    app.firstbtn=FALSE;
    
    
        CompareCarDetailedViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"CompareCarDetailedViewController"];
        [self.navigationController pushViewController:hvc animated:YES];

    
    


}

- (IBAction)btn_selectCar2HDN:(id)sender
{
    
    app.firstbtn=TRUE;
        
    
        
    CompareCarDetailedViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"CompareCarDetailedViewController"];
    [self.navigationController pushViewController:hvc animated:YES];
        
    

}

- (IBAction)btn_COMPARE:(id)sender
{
    if([self.lbl_selectCar1.text isEqual:@"Select Car 1"]||[self.lbl_selectCar2.text isEqual:@"Select Car 2"])
    {
        
    }
    
    else
    {
    
    CompareBtnClickedViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"CompareBtnClickedViewController"];
    
    [self.navigationController pushViewController:hvc animated:YES];
        
    }

}



@end
