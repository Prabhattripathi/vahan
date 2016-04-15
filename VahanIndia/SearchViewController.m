//
//  SearchViewController.m
//  VahanIndia
// nm
//  Created by geniemac4 on 27/04/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import "SearchViewController.h"
#import "BaseTableView.h"
#import "ByBrandTableViewCell.h"
#import "SDWebImageCompat.h"
#import "SDWebImageManager.h"
#import "UIImageView+WebCache.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
#import "MBProgressHUD.h"
#import "DemoAppDelegate.h"
#import "SearchnewdetailedViewController.h"


@interface SearchViewController ()

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
    
    NSInteger a,b,c,d,e,f,g,h;
    
    
    //for BRAND drp down...
    NSMutableArray * array_brand_id;
    NSMutableArray * array_brand_name;
    
    
    //for MODEL drp down...
    NSMutableArray * array_model_id;
    NSMutableArray * array_model_name;
    
    NSMutableArray * ar2;
    NSMutableArray * ar1;
    NSMutableArray * ar3;
    
    
    NIDropDown *dropDown1 ,*dropDown2 ,*dropDown3,*dropDown4;
    NSString *brandstr ,*modelstr,*statestr ,*budgetstr ,*vehicaltype;
    BOOL test;
    
}


@end

@implementation SearchViewController

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
    
    a=0;b=0;c=0;d=0;

    
    self.view_ByModel.hidden=YES;
    
    self.view_UsedCar.hidden=YES;
    
    
    
    [self.btn_outlet_ByBudget setBackgroundImage:[UIImage imageNamed:@"Radio_btn_blue.png"] forState:UIControlStateNormal];
    
    [self.btn_outlet_ByModel setBackgroundImage:[UIImage imageNamed:@"Radio_btn_white.png"] forState:UIControlStateNormal];
    

    
    
    [self.btn_outlet_ByBudget2 setBackgroundImage:[UIImage imageNamed:@"Radio_btn_blue.png"] forState:UIControlStateNormal];
    
    [self.btn_outlet_ByModel2 setBackgroundImage:[UIImage imageNamed:@"Radio_btn_white.png"] forState:UIControlStateNormal];

    
    
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
    //self.view.backgroundColor=[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0];
    
    
    //==== For Activity Indicator ..using HUD..=======
    
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    HUD.delegate = self;
    HUD.labelText = @"Please Wait...";
    //HUD.mode = MBProgressHUDModeAnnularDeterminate;
    [self.view addSubview:HUD];
    
    [HUD showAnimated:YES whileExecutingBlock:^{
        
        [self getSelctBrandDrpDown];
      //  [self getSelctModelDrpDown];
        
         [self GetPrizeData];
        [self GetVehicleTypeData];

        
    } completionBlock:^{
        
        
    }];

    
}



//fr drpdown...

-(int)getRandomNumberBetween:(int)from to:(int)to
{
    
    return (int)from + arc4random() % (to-from+1);
}



-(void)UniqueRandom
{
    
    int T[11];
    BOOL flag;
    for(int i=0;i<10;i++)
    {
        
        int ranNo=  random()%100+1;
        flag=TRUE;
        int s=(sizeof T);
        
        for(int x=0;x<s;x++)
        {
            
            if(ranNo==T[x])
            {
                i--;
                flag= FALSE;
                break;
            }
        }
        
        if(flag) T[i]=ranNo;
    }
    
    for(int j=0;j<100;j++)
        
        NSLog(@"unique random %d",T[j]);
}



-(void)getSelctBrandDrpDown

{
    
    NSString *urlString =@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/branddropdwon";
    
    NSURL *URL = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSData * jsondata= [NSData dataWithContentsOfURL:URL];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                      jsondata options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"Output :%@",jsonObjects);
    
    NSMutableDictionary * respdic = [[NSMutableDictionary alloc]init];
    
    respdic = [jsonObjects valueForKey:@"userdata"];
    
    
    array_brand_name = [respdic valueForKey:@"brand_name"];
    array_brand_id = [respdic valueForKey:@"brand_id"];
    NSLog(@"afgjjkljh%@",array_brand_id);
    
    
    
}


- (IBAction)btn_Make_Brand_drpdwn:(id)sender
{
    a=1;b=0;c=0,d=0;
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    
    
    for(int i=0;i<[array_brand_name count];i++)
    {
        
        NSString *namestr=[array_brand_name objectAtIndex:i];
        [arr addObject:namestr];
    }
    
    if(dropDown1 == nil)
    {
        CGFloat f;
        f = 150;
        dropDown1 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown1.delegate = self;
    }
    else
    {
        [dropDown1 hideDropDown:sender];
        [self rel1];
    }
    
}



-(void)getSelctModelDrpDown

{
    
    NSString *urlString =[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/modeldropdwon?data={\"brand_id\":\"%@\"}",brandstr];
    
    
    
    //    NSString *urlString =[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/modeldropdwon?data={\"brand_id\":\"%@\"}"];
    
    NSLog(@"urlstyju%@",urlString);
    
    NSURL *URL = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSData * jsondata= [NSData dataWithContentsOfURL:URL];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                      jsondata options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"Output :%@",jsonObjects);
    
    NSMutableDictionary * respdic = [[NSMutableDictionary alloc]init];
    
    respdic = [jsonObjects valueForKey:@"text"];
    
    
    array_model_name = [respdic valueForKey:@"model_name"];
    array_model_id = [respdic valueForKey:@"model_id"];
    
}



- (IBAction)btn_AnyModelDrpdwn:(id)sender
{
    a=0;b=1;c=0,d=0;
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    
    //    NSArray *cntarrrr=[[NSArray alloc]initWithObjects:@"--Select--",@"Ecosport",@"Endeavour",@"Fiesta",@"Figo",@"Mondeo", nil];
    
    for(int i=0;i<[array_model_name count];i++)
    {
        
        NSString *namestr=[array_model_name objectAtIndex:i];
        [arr addObject:namestr];
    }
    
    if(dropDown2 == nil)
    {
        CGFloat f;
        f=150;
        //f = ([array_model_name count]*41);
        dropDown2 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown2.delegate = self;
    }
    else
    {
        [dropDown2 hideDropDown:sender];
        [self rel2];
    }

}



-(void)GetPrizeData

{
    // http://demo1.geniesoftsystem.com/vahanindia/admin/api/getprice.php
    
    NSString *urlString =@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/getprice";
    
    NSURL *URL = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSData * jsondata= [NSData dataWithContentsOfURL:URL];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                      jsondata options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"Output :%@",jsonObjects);
    
    NSMutableDictionary * respdic = [[NSMutableDictionary alloc]init];
    
    respdic = [jsonObjects valueForKey:@"userdata"];
    
    
    array2 = [respdic valueForKey:@"vehicle_price_id"];
    
    array1 = [respdic valueForKey:@"vehicle_price_range"];
    NSLog(@"vehicalrange %@",array1);
    
    
    
    
}


- (IBAction)btn_budgetdrpdwn:(id)sender
{
    a=0;b=0;c=1,d=0;
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    
    //    NSArray *cntarrrr=[[NSArray alloc]initWithObjects:@"--Select--",@"Ecosport",@"Endeavour",@"Fiesta",@"Figo",@"Mondeo", nil];
    
    for(int i=0;i<[array1 count];i++)
    {
        
        NSString *namestr=[array1 objectAtIndex:i];
        [arr addObject:namestr];
    }
    
    if(dropDown3 == nil)
    {
        CGFloat f;
        f=150;
        //f = ([array_model_name count]*41);
        dropDown3 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown3.delegate = self;
    }
    else
    {
        [dropDown3 hideDropDown:sender];
        [self rel3];
    }

}




-(void)GetVehicleTypeData

{
    
    NSString *urlString =@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/getbodytype";
    
    NSURL *URL = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSData * jsondata= [NSData dataWithContentsOfURL:URL];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                      jsondata options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"Output :%@",jsonObjects);
    
    NSMutableDictionary * respdic = [[NSMutableDictionary alloc]init];
    
    respdic = [jsonObjects valueForKey:@"userdata"];
    
    
    ar2 = [respdic valueForKey:@"body_id"];
    ar1 = [respdic valueForKey:@"body_name"];
    ar3 = [respdic valueForKey:@"body_image_path"];
    
    
}





- (IBAction)btn_VehicletypeDrpdwn:(id)sender
{
    a=0;b=0;c=0,d=1;
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    
    //    NSArray *cntarrrr=[[NSArray alloc]initWithObjects:@"--Select--",@"Ecosport",@"Endeavour",@"Fiesta",@"Figo",@"Mondeo", nil];
    
    for(int i=0;i<[ar1 count];i++)
    {
        
        NSString *namestr=[ar1 objectAtIndex:i];
        [arr addObject:namestr];
    }
    
    if(dropDown4 == nil)
    {
        CGFloat f;
        f=150;
        //f = ([array_model_name count]*41);
        dropDown4 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown4.delegate = self;
    }
    else
    {
        [dropDown4 hideDropDown:sender];
        [self rel4];
    }

}




- (void) niDropDownDelegateMethod: (NIDropDown *) sender
{
    if (a==1&&b==0&&c==0&&d==0)
    {
        [self rel1];
        
    }
    
    if (a==0&&b==1&&c==0&&d==0)
    {
        [self rel2];
        
    }
    
    if (a==0&&b==0&&c==1&&d==0)
    {
        [self rel3];
        
    }
    
    if (a==0&&b==0&&c==0&&d==1)
    {
        [self rel4];
        
    }
    
    
}



-(void)rel1
{
    dropDown1 = nil;
    brandstr=[NSString stringWithFormat:@"%@",[array_brand_id objectAtIndex:app.index]];
    NSLog(@"brandstr%@",brandstr);
    NSLog(@"brandstr%ld",(long)app.index);
    
    app.brandstr=[NSString stringWithFormat:@"%@",[array_brand_name objectAtIndex:app.index]];
    NSLog(@"app.brandstr%@",app.brandstr);
    NSLog(@"app.brandstr%ld",(long)app.index);
    
   
    
    [self getSelctModelDrpDown];
    
}
-(void)rel2
{
    dropDown2 = nil;
    
    app.modelstr =[NSString stringWithFormat:@"%@",[array_model_name objectAtIndex:app.index]];
    NSLog(@"app.budgetstr%@",app.modelstr);
    NSLog(@"app.budgetstr%ld",(long)app.index);
    
    
    //[self getSelctVersionDrpDown];
}

-(void)rel3
{
    dropDown3 = nil;
   app.budgetstr =[NSString stringWithFormat:@"%@",[array2 objectAtIndex:app.index]];
    NSLog(@"app.budgetstr%@",app.budgetstr);
    NSLog(@"app.budgetstr%ld",(long)app.index);
}


-(void)rel4
{
    dropDown4 = nil;
    app.vehicaltype=[NSString stringWithFormat:@"%@",[ar1 objectAtIndex:app.index]];
    NSLog(@"app.vehicaltype%@",app.vehicaltype);
    NSLog(@"vehicaltype%ld",(long)app.index);
}




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






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


 
- (IBAction)btn_ByBudget:(id)sender
{
  
//    if([[self.btn_outlet_ByBudget backgroundImageForState:UIControlStateNormal] isEqual: [UIImage imageNamed:@"Radio_btn_blue.png"]])
//    {
         app.test =true;
        [self.btn_outlet_ByBudget setBackgroundImage:[UIImage imageNamed:@"Radio_btn_blue.png"] forState:UIControlStateNormal];
        [self.btn_outlet_ByModel setBackgroundImage:[UIImage imageNamed:@"Radio_btn_white.png"] forState:UIControlStateNormal];
        
        self.view_ByModel.hidden=YES;
        
    //}
//    else
//    {
//        app.test=false;
//        [self.btn_outlet_ByBudget setBackgroundImage:[UIImage imageNamed:@"Radio_btn_blue.png"] forState:UIControlStateNormal];
       // [self.btn_outlet_ByModel setBackgroundImage:[UIImage imageNamed:@"Radio_btn_white.png"] forState:UIControlStateNormal];
        
    
        
        
    //}

}



- (IBAction)btn_ByModel:(id)sender
{
  
//    if([[self.btn_outlet_ByModel backgroundImageForState:UIControlStateNormal] isEqual: [UIImage imageNamed:@"Radio_btn_blue.png"]])
//    {
    
    app.test=false;
        [self.btn_outlet_ByModel setBackgroundImage:[UIImage imageNamed:@"Radio_btn_blue.png"] forState:UIControlStateNormal];
        [self.btn_outlet_ByBudget setBackgroundImage:[UIImage imageNamed:@"Radio_btn_white.png"] forState:UIControlStateNormal];
        
    self.view_ByModel.hidden=NO;

    
//    }
//    else
//    {
//        [self.btn_outlet_ByModel setBackgroundImage:[UIImage imageNamed:@"Radio_btn_blue.png"] forState:UIControlStateNormal];
//        [self.btn_outlet_ByBudget setBackgroundImage:[UIImage imageNamed:@"Radio_btn_white.png"] forState:UIControlStateNormal];
    
           // }
    

}






- (IBAction)btn_NewCar:(id)sender
{
    //self.view_NewCarr.hidden=NO;
    self.view_UsedCar.hidden=YES;
}



- (IBAction)btn_UsedCar:(id)sender
{
    self.view_UsedCar.hidden=NO;
    
    
    [self.btn_outlet_ByBudget2 setBackgroundImage:[UIImage imageNamed:@"Radio_btn_white.png"] forState:UIControlStateNormal];
    [self.btn_outlet_ByModel2 setBackgroundImage:[UIImage imageNamed:@"Radio_btn_blue.png"] forState:UIControlStateNormal];
    
    
}



- (IBAction)btn_ByBudget2:(id)sender
{
    if([[self.btn_outlet_ByBudget2 backgroundImageForState:UIControlStateNormal] isEqual: [UIImage imageNamed:@"Radio_btn_blue.png"]])
    {
        [self.btn_outlet_ByBudget2 setBackgroundImage:[UIImage imageNamed:@"Radio_btn_blue.png"] forState:UIControlStateNormal];
        [self.btn_outlet_ByModel2 setBackgroundImage:[UIImage imageNamed:@"Radio_btn_white.png"] forState:UIControlStateNormal];
        
    }
    
    else
        
    {
        [self.btn_outlet_ByBudget2 setBackgroundImage:[UIImage imageNamed:@"Radio_btn_blue.png"] forState:UIControlStateNormal];
        [self.btn_outlet_ByModel2 setBackgroundImage:[UIImage imageNamed:@"Radio_btn_white.png"] forState:UIControlStateNormal];
        
      
        self.view_ByModel2.hidden=YES;
        
    }

}
- (IBAction)btn_ByModel2:(id)sender
{
    if([[self.btn_outlet_ByModel2 backgroundImageForState:UIControlStateNormal] isEqual: [UIImage imageNamed:@"Radio_btn_blue.png"]])
    {
        [self.btn_outlet_ByModel2 setBackgroundImage:[UIImage imageNamed:@"Radio_btn_blue.png"] forState:UIControlStateNormal];
        [self.btn_outlet_ByBudget2 setBackgroundImage:[UIImage imageNamed:@"Radio_btn_white.png"] forState:UIControlStateNormal];
        
        
        
    }
    else
    {
        [self.btn_outlet_ByModel2 setBackgroundImage:[UIImage imageNamed:@"Radio_btn_blue.png"] forState:UIControlStateNormal];
        [self.btn_outlet_ByBudget2 setBackgroundImage:[UIImage imageNamed:@"Radio_btn_white.png"] forState:UIControlStateNormal];
        
        self.view_ByModel2.hidden=NO;
    }

}





- (IBAction)btn_budgetdrpdwn2:(id)sender
{
}


- (IBAction)btn_citydrpdown2:(id)sender
{
}
- (IBAction)btn_MakeBrand2:(id)sender
{
}
- (IBAction)btn_Modeldrpdwn2:(id)sender
{
}



//for new car search...
- (IBAction)btn_Search1:(id)sender
{
    
    //if([self.lbl_selectCar1.text isEqual:@"Select Car 1"]||[self.lbl_selectCar2.text isEqual:@"Select Car 2"])
    
    if([self.btn_outlet_budget.titleLabel.text isEqualToString:@"--Budget--"]|| [self.btn_outlet_VehicleType.titleLabel.text isEqualToString:@"--Vehicle Type--"])
    {
        
    }
    
    else
        
    {
        
        SearchnewdetailedViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"SearchnewdetailedViewController"];
        [self.navigationController pushViewController:hvc animated:YES];
    }
    
    //
    
    
    if([self.btn_outlet_Make_Brand.titleLabel.text isEqualToString:@"--Make--"]|| [self.btn_outlet_AnyModel.titleLabel.text isEqualToString:@"--Any model--"])
    {
        
    }
    
    else
        
    {
        SearchnewdetailedViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"SearchnewdetailedViewController"];
        [self.navigationController pushViewController:hvc animated:YES];
    }


}



//for used car search...
- (IBAction)btn_Search2:(id)sender
{
    
    if([self.btn_outlet_budget.titleLabel.text isEqualToString:@"--Budget--"]|| [self.btn_outlet_VehicleType.titleLabel.text isEqualToString:@"--Vehicle Type--"])
    {
        
    }
    
    else
        
    {
        
        SearchnewdetailedViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"SearchnewdetailedViewController"];
        [self.navigationController pushViewController:hvc animated:YES];
    }
    
    //
    
    
    if([self.btn_outlet_Make_Brand.titleLabel.text isEqualToString:@"--Make--"]|| [self.btn_outlet_AnyModel.titleLabel.text isEqualToString:@"--Any model--"])
    {
        
    }
    
    else
        
    {
        SearchnewdetailedViewController *hvc=[self.storyboard instantiateViewControllerWithIdentifier:@"SearchnewdetailedViewController"];
        [self.navigationController pushViewController:hvc animated:YES];
    }

    
}




@end
