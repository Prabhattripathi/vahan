//
//  CompareBtnClickedViewController.m
//  VahanIndia
//
//  Created by geniemac4 on 20/04/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import "CompareBtnClickedViewController.h"
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
#import "CompareBtnClickedTableViewCell.h"


@interface CompareBtnClickedViewController ()
{
    DemoAppDelegate *app;
    NSMutableArray *sample1;
     NSMutableArray *sample2;
    
    NSArray *images;
    BaseTableView *basetab;
    UIImageView *backimgview;
    NSMutableArray *ViewsArray;
    
    UIImage *image;
    
    
    NSMutableArray *array_brand_name;
    NSMutableArray *array_brand_id;
    
    NSMutableArray *headerarray;
    
    
    NSMutableArray *arr1;
    NSMutableArray *arr2;
    NSMutableArray *arr3;
    NSMutableArray *arr4;
    NSMutableArray *arr5;
    NSMutableArray *arr6;
    

    NSMutableArray *car1arr,*car2arr;
    
    //for 2nd header..
    NSMutableArray *car1H2,*car2H2;
    
    
}


@end

@implementation CompareBtnClickedViewController

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
    
    
    [self.scroll_Vieww setScrollEnabled:YES];
    [self.scroll_Vieww setContentSize:CGSizeMake(0, 1240)];
    

    
    
    //for the view's background color...
  //  self.view.backgroundColor=[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0];
    
    
    /// === header name array === ///
    
    headerarray=[[NSMutableArray alloc]init];
    [headerarray addObject:@"Mileage and Specifications"];
    [headerarray addObject:@"Standard Features"];
 //   [headerarray addObject:@"Colors"];
    

    
    // for table view's list..
    
    sample1 = [[NSMutableArray alloc]init];
    
    [sample1 addObject:@"Fuel Type"];
    [sample1 addObject:@"Engine(cc)"];
    //[sample1 addObject:@"Max Power"];
    [sample1 addObject:@"Max Torque"];
    [sample1 addObject:@"Transmission"];
    [sample1 addObject:@"Seating"];
    [sample1 addObject:@"Mileage-City(kmpl)"];
    [sample1 addObject:@"Mileage-Highway(kmpl)"];
    //[sample1 addObject:@"Finance Available"];
    [sample1 addObject:@"Ex-Showroom Price"];
    [sample1 addObject:@"Fuel Tank Capacity"];
    [sample1 addObject:@"Engine Description"];
    
    
    
    sample2 = [[NSMutableArray alloc]init];
    
    [sample2 addObject:@"Anti Lock Braking System"];
    [sample2 addObject:@"Brake Assist"];
    [sample2 addObject:@"Central Locking"];
  //  [sample2 addObject:@"Power Door Locks"];
    [sample2 addObject:@"Child Safety Locks"];
   // [sample2 addObject:@"Passenger Airbag"];
    //[sample2 addObject:@"Side Airbag Front"];
    [sample2 addObject:@"Halogen Head lamps"];
    [sample2 addObject:@"Door Ajar Warning"];
    [sample2 addObject:@"Adjustable Seats"];
    [sample2 addObject:@"Engine Immobilizer"];
   // [sample2 addObject:@"Clutch Lock"];
//    [sample2 addObject:@"EBD"];
//    [sample2 addObject:@"Rear Seat Belts"];
//    [sample2 addObject:@"Crash Sensor"];

    
    
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
    
    
    
    
    self.lbl_carname1.text=app.comparecar4ID;
    self.lbl_carname2.text=app.comparecar6ID;
    
    
    
    // self.lbl_selectCar1.text=app.comparecar4ID;
    // self.lbl_munijiName.text=app.munjisName;

    [self GetCompareCarData];
    
    [self.table_view reloadData];

}


-(void)GetCompareCarData

{
    //comparecar3ID:-for 1st car id.
    //comparecar9ID:-for 2nd car id.
    
    NSString *str1=[NSString stringWithFormat:@"%@",app.comparecar3ID];
    NSString *str2=[NSString stringWithFormat:@"%@",app.comparecar9ID];
    
    NSLog(@"Output :%@",app.comparecar3ID);
    NSLog(@"Output :%@",app.comparecar9ID);
    
    
    //http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/compaircar?data={%22car_id1%22:%2294%22,%22car_id2%22:%2295%22}
    
    NSString *urlString =[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/compaircar?data={\"car_id1\":\"%@\",\"car_id2\":\"%@\"}",str1,str2];
    
    NSLog(@"urlstyju%@",urlString);
    
    NSURL *URL = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSData * jsondata= [NSData dataWithContentsOfURL:URL];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                      jsondata options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"Output :%@",jsonObjects);
    
    NSMutableDictionary * respdic = [[NSMutableDictionary alloc]init];
    
    respdic= [jsonObjects valueForKey:@"car"];
    
    arr1=[respdic valueForKey:@"car1"];
    
    car1arr=[[NSMutableArray alloc]init];
    
    
    NSString*st1=[NSString stringWithFormat:@"%@",[arr1 valueForKey:@"fuel_name"]];
    NSLog(@"%@",st1);
    
    NSString*st2=[NSString stringWithFormat:@"%@",[arr1 valueForKey:@"engine_size"]];
    NSLog(@"%@",st2);
    
    NSString*st3=[NSString stringWithFormat:@"%@",[arr1 valueForKey:@"engine_torque"]];
    NSLog(@"%@",st3);
    
    NSString*st4=[NSString stringWithFormat:@"%@",[arr1 valueForKey:@"transmission"]];
    
    NSString*st5=[NSString stringWithFormat:@"%@",[arr1 valueForKey:@"number_of_seats"]];
    
    NSString*st6=[NSString stringWithFormat:@"%@",[arr1 valueForKey:@"fuel_mileage_min"]];

    NSString*st7=[NSString stringWithFormat:@"%@",[arr1 valueForKey:@"fuel_mileage_max"]];

    NSString*st8=[NSString stringWithFormat:@"%@",[arr1 valueForKey:@"vehicle_price_range"]];

    NSString*st9=[NSString stringWithFormat:@"%@",[arr1 valueForKey:@"fuel_tank_capacity"]];
    
    NSString*st10=[NSString stringWithFormat:@"%@",[arr1 valueForKey:@"engine_type"]];
    
    
    
    [car1arr addObject:[NSString stringWithFormat:@"%@",st1]];
    [car1arr addObject:[NSString stringWithFormat:@"%@",st2]];
    [car1arr addObject:[NSString stringWithFormat:@"%@",st3]];
    [car1arr addObject:[NSString stringWithFormat:@"%@",st4]];
    [car1arr addObject:[NSString stringWithFormat:@"%@",st5]];
    [car1arr addObject:[NSString stringWithFormat:@"%@",st6]];
    [car1arr addObject:[NSString stringWithFormat:@"%@",st7]];
    [car1arr addObject:[NSString stringWithFormat:@"%@",st8]];
    [car1arr addObject:[NSString stringWithFormat:@"%@",st9]];
    [car1arr addObject:[NSString stringWithFormat:@"%@",st10]];
    
    
    
    //---------------------------------------//
    
    
    
    arr2=[respdic valueForKey:@"car2"];
    
    car2arr=[[NSMutableArray alloc]init];
    
    
    NSString*stt1=[NSString stringWithFormat:@"%@",[arr2 valueForKey:@"fuel_name"]];
    NSLog(@"%@",stt1);
    
    NSString*stt2=[NSString stringWithFormat:@"%@",[arr2 valueForKey:@"engine_size"]];
    NSLog(@"%@",stt2);
    
    NSString*stt3=[NSString stringWithFormat:@"%@",[arr2 valueForKey:@"engine_torque"]];
    NSLog(@"%@",stt3);
    
    NSString*stt4=[NSString stringWithFormat:@"%@",[arr2 valueForKey:@"transmission"]];
    
    NSString*stt5=[NSString stringWithFormat:@"%@",[arr2 valueForKey:@"number_of_seats"]];
    
    NSString*stt6=[NSString stringWithFormat:@"%@",[arr2 valueForKey:@"fuel_mileage_min"]];
    
    NSString*stt7=[NSString stringWithFormat:@"%@",[arr2 valueForKey:@"fuel_mileage_max"]];
    
    NSString*stt8=[NSString stringWithFormat:@"%@",[arr2 valueForKey:@"vehicle_price_range"]];
    
    NSString*stt9=[NSString stringWithFormat:@"%@",[arr2 valueForKey:@"fuel_tank_capacity"]];
    
    NSString*stt10=[NSString stringWithFormat:@"%@",[arr2 valueForKey:@"engine_type"]];
    
    
    [car2arr addObject:[NSString stringWithFormat:@"%@",stt1]];
    [car2arr addObject:[NSString stringWithFormat:@"%@",stt2]];
    [car2arr addObject:[NSString stringWithFormat:@"%@",stt3]];
    [car2arr addObject:[NSString stringWithFormat:@"%@",stt4]];
    [car2arr addObject:[NSString stringWithFormat:@"%@",stt5]];
    [car2arr addObject:[NSString stringWithFormat:@"%@",stt6]];
    [car2arr addObject:[NSString stringWithFormat:@"%@",stt7]];
    [car2arr addObject:[NSString stringWithFormat:@"%@",stt8]];
    [car2arr addObject:[NSString stringWithFormat:@"%@",stt9]];
    [car2arr addObject:[NSString stringWithFormat:@"%@",stt10]];
    
    
    
    
    
    
    
    
    // for header2 car1 entities....
    
    
    car1H2=[[NSMutableArray alloc]init];
    
    NSString*stq1=[NSString stringWithFormat:@"%@",[arr1 valueForKey:@"anti_lock_braking_system"]];
    
    NSString*stq2=[NSString stringWithFormat:@"%@",[arr1 valueForKey:@"brake_assist"]];
    
    NSString*stq3=[NSString stringWithFormat:@"%@",[arr1 valueForKey:@"central_locking"]];
    
    NSString*stq4=[NSString stringWithFormat:@"%@",[arr1 valueForKey:@"child_safety_lock"]];
    
    NSString*stq5=[NSString stringWithFormat:@"%@",[arr1 valueForKey:@"automatic_head_lamps"]];
    
    NSString*stq6=[NSString stringWithFormat:@"%@",[arr1 valueForKey:@"door_ajar_warning"]];
    
    NSString*stq7=[NSString stringWithFormat:@"%@",[arr1 valueForKey:@"driver_height_adjustable_seat"]];
    
    NSString*stq8=[NSString stringWithFormat:@"%@",[arr1 valueForKey:@"immobiliser"]];
    
    
    
    [car1H2 addObject:[NSString stringWithFormat:@"%@",stq1]];
    [car1H2 addObject:[NSString stringWithFormat:@"%@",stq2]];
    [car1H2 addObject:[NSString stringWithFormat:@"%@",stq3]];
    [car1H2 addObject:[NSString stringWithFormat:@"%@",stq4]];
    [car1H2 addObject:[NSString stringWithFormat:@"%@",stq5]];
    [car1H2 addObject:[NSString stringWithFormat:@"%@",stq6]];
    [car1H2 addObject:[NSString stringWithFormat:@"%@",stq7]];
    [car1H2 addObject:[NSString stringWithFormat:@"%@",stq8]];
    
    //
    
    
    
    // for header2 car2 entities....
    
    
    car2H2=[[NSMutableArray alloc]init];
    
    NSString*stz1=[NSString stringWithFormat:@"%@",[arr2 valueForKey:@"anti_lock_braking_system"]];
    
    NSString*stz2=[NSString stringWithFormat:@"%@",[arr2 valueForKey:@"brake_assist"]];
    
    NSString*stz3=[NSString stringWithFormat:@"%@",[arr2 valueForKey:@"central_locking"]];
    
    NSString*stz4=[NSString stringWithFormat:@"%@",[arr2 valueForKey:@"child_safety_lock"]];
    
    NSString*stz5=[NSString stringWithFormat:@"%@",[arr2 valueForKey:@"automatic_head_lamps"]];
    
    NSString*stz6=[NSString stringWithFormat:@"%@",[arr2 valueForKey:@"door_ajar_warning"]];
    
    NSString*stz7=[NSString stringWithFormat:@"%@",[arr2 valueForKey:@"driver_height_adjustable_seat"]];
    
    NSString*stz8=[NSString stringWithFormat:@"%@",[arr2 valueForKey:@"immobiliser"]];
    
    
    
    [car2H2 addObject:[NSString stringWithFormat:@"%@",stz1]];
    [car2H2 addObject:[NSString stringWithFormat:@"%@",stz2]];
    [car2H2 addObject:[NSString stringWithFormat:@"%@",stz3]];
    [car2H2 addObject:[NSString stringWithFormat:@"%@",stz4]];
    [car2H2 addObject:[NSString stringWithFormat:@"%@",stz5]];
    [car2H2 addObject:[NSString stringWithFormat:@"%@",stz6]];
    [car2H2 addObject:[NSString stringWithFormat:@"%@",stz7]];
    [car2H2 addObject:[NSString stringWithFormat:@"%@",stz8]];
    
    //

    self.table_view.frame=CGRectMake(7, 0, 303, 140*[car2H2 count]);
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return [headerarray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    
  //  return [sample1 count];
    
    if(section==0)
    {
        return [sample1 count];
        
    }
    else
    {
        return [sample2 count];
    }

    
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.section==0)
    {

   
    static NSString *simpleTableIdentifier = @"CompareBtnClickedTableViewCell";
    
    CompareBtnClickedTableViewCell *cell1 = (CompareBtnClickedTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell1 == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CompareBtnClickedTableViewCell" owner:self options:nil];
        cell1 = [nib objectAtIndex:0];
    }
    
    
    // cell1.ViewBg.layer.cornerRadius=10;
    
      cell1.lbl_section2.text =[sample1 objectAtIndex:indexPath.row];
        
    cell1.lbl_section1.text=[car1arr objectAtIndex:indexPath.row];
    cell1.lbl_section3.text=[car2arr objectAtIndex:indexPath.row];
        
        
    
    //    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 20, 100, 100)];
    //    imgView.image = [UIImage imageNamed:[images objectAtIndex:indexPath.row]];
    //    [cell1.contentView addSubview:imgView];
    
    
    
    cell1.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
   // cell1.backgroundColor=[UIColor clearColor];
    
    return cell1;
        
    }
    
    
    else
    {

            static NSString *CellIdentifier = @"Cell";
            UITableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            
            
            
            UILabel *lbl2=[[UILabel alloc]initWithFrame:CGRectMake(100, 20, 240, 15)];
            lbl2.textColor=[UIColor blackColor];
            lbl2.font=[UIFont boldSystemFontOfSize:10];
        
            
            
            UILabel *lbl1=[[UILabel alloc]initWithFrame:CGRectMake(15, 20, 240, 15)];
            lbl1.textColor=[UIColor blackColor];
            lbl1.font=[UIFont systemFontOfSize:10];
      
            
            UILabel *lbl3=[[UILabel alloc]initWithFrame:CGRectMake(270, 20, 240, 15)];
            lbl3.textColor=[UIColor blackColor];
            lbl3.font=[UIFont systemFontOfSize:10];
        
        
            
        lbl2.text =[sample2 objectAtIndex:indexPath.row];
        [cell.contentView addSubview:lbl2];
        
        
        lbl1.text =[car1H2 objectAtIndex:indexPath.row];
        [cell.contentView addSubview:lbl1];
        
        
        lbl3.text =[car2H2 objectAtIndex:indexPath.row];
        [cell.contentView addSubview:lbl3];

                    
        return cell;
        
    }
    
    
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
        UIView *headerView;
    
    
        headerView=[[UIView alloc] initWithFrame:CGRectMake(0, 10, self.view.frame.size.width, 50)];
        headerView.tag = section;
       // headerView.backgroundColor = [UIColor colorWithRed:248/255.0 green:194/255.0 blue:3/255.0 alpha:1.0];
      headerView.backgroundColor = [UIColor lightGrayColor];

    
        UILabel *headerString  = [[UILabel alloc] initWithFrame:CGRectMake(55,4,300, 25)];
        headerString.backgroundColor = [UIColor clearColor];
        headerString.textAlignment      = NSTextAlignmentLeft;
        headerString.font = [UIFont fontWithName:@"ProximaNova-Regular" size:16];
        headerString.text=[NSString stringWithFormat:@"%@",[headerarray objectAtIndex:section]];
        [headerView addSubview:headerString];
        
//        if(headerView.tag==2)
//        {
//            
//        }
//        else
//        {
//            UILabel *seeall=[[UILabel alloc]initWithFrame:CGRectMake(250, 15, 50, 25)];
//            seeall.text=@"See All";
//            seeall.font = [UIFont fontWithName:@"ProximaNova-Regular" size:14];
//            seeall.textColor=[UIColor blackColor];
//            [headerView addSubview:seeall];
//            
//            UIImageView *nextview=[[UIImageView alloc]initWithFrame:CGRectMake(305, 20, 10, 15)];
//            nextview.image=[UIImage imageNamed:@"arrow.png"];
//            [headerView addSubview:nextview];
//            
//        }
    
    return headerView;
        
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
    return 35;
}






- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
//    UIViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:ViewsArray[indexPath.row]];
//    [self.navigationController pushViewController:viewController animated:YES];
    
    
    
    
    
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





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
