//
//  SellCarViewController.m
//  VahanIndia
//
//  Created by geniemac4 on 27/03/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import "SellCarViewController.h"
#import "BaseTableView.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <QuartzCore/QuartzCore.h>

@interface SellCarViewController ()

{
    UIImage *image;
    BaseTableView *basetab;
    UIImageView *backimgview;
    
    DemoAppDelegate *app;
    
    
    //for BRAND drp down...
    NSMutableArray * array_brand_id;
    NSMutableArray * array_brand_name;
    
    //for MODEL drp down...
    NSMutableArray * array_model_id;
    NSMutableArray * array_model_name;
    
    //for VERSION drp down...
    NSMutableArray * array_version_id;
    NSMutableArray * array_version_name;
    
    //for color drp down..
    NSMutableArray * array_color_id;
    NSMutableArray * array_color_name;

    
    NSMutableArray * array_carid;
    NSMutableArray * array_carname;
    NSMutableArray * array_carimage;
    
    NSMutableArray * array_state_name;
    NSMutableArray * array_state_id;
    
    NSMutableArray * array_city_name;
    NSMutableArray * array_city_id;
    
    
    
    NSMutableArray*arr,*arr2;
    
    NIDropDown *dropDown1 ,*dropDown2 ,*dropDown3,*dropDown4,*dropDown5,*dropDown6,*dropDown7,*dropDown8;
    
    NSString *brandstr ,*modelstr,*statestr ,*versionstr ,*colourstr ,*noofownerstr,*monthstr , *citystr;
    
    NSInteger a,b,c,d,e,f,g,h;
    
    
}

@end

@implementation SellCarViewController

@synthesize txt_ownername,txt_registrationNo,txt_MakeYear,txt_kmsDriven
,txt_pincode,txt_expectedPrice,txt_Remarks,txt_name,txt_emailAddress
,txt_MbNo1,txt_MbNo2;


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
    
    a=0;b=0;c=0;d=0;e=0;f=0;g=0;h=0;
    
    UITapGestureRecognizer * tapper = [[UITapGestureRecognizer alloc]
                                       initWithTarget:self action:@selector(handleSingleTap:)];
    tapper.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapper];
  
    [self getSelctBrandDrpDown];
    
    [self getSelectStateDrpDown];
   
    
    //for the view's background color...
    self.view.backgroundColor=[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0];

    
 
    [self.scroll_view setScrollEnabled:YES];
    [self.scroll_view setContentSize:CGSizeMake(0, 1050)];
    self.scroll_view.layer.cornerRadius = 6;

   // txt_Name.layer.borderColor = [[[UIColor blackColor] colorWithAlphaComponent:0.5] CGColor];
   // txt_Name.layer.borderWidth = 1.5;
       //txt_Name.clipsToBounds = YES;
    
    
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
    
    //for drpdown..
    
    int randomNumber = [self getRandomNumberBetween:1111 to:9999];
    NSLog(@"randomno is %d",randomNumber);
    
    
    //date view...
    
   self.VIEWPICKER.hidden=YES;
    
    
    
}



- (void)handleSingleTap:(UITapGestureRecognizer *) sender
{
    [self.view endEditing:YES];
    // [location_picker removeFromSuperview];
    
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




-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //backimgview.hidden=YES;
    // tabview.userInteractionEnabled=YES;
    self.btn_menu_outlet.userInteractionEnabled=YES;
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



-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"Text field did begin editing");
    
    
    //    if (textField==txt_passport||textField==txt_position||textField==txt_location||textField==txt_phnno)
    //    {
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.35f];
    CGRect frame = self.view.frame;
    frame.origin.y = -100;
    [self.view setFrame:frame];
    [UIView commitAnimations];
    
    //    }
    
}



// This method is called once we complete editing
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"Text field ended editing");
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.35f];
    CGRect frame = self.view.frame;
    frame.origin.y = 0;
    [self.view setFrame:frame];
    [UIView commitAnimations];
}




- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
   // [textField resignFirstResponder];
    
    [self.txt_emailAddress resignFirstResponder];
    [self.txt_expectedPrice resignFirstResponder];
    [self.txt_kmsDriven resignFirstResponder];
    [self.txt_MakeYear resignFirstResponder];
    [self.txt_ownername resignFirstResponder];
    [self.txt_pincode resignFirstResponder];
    [self.txt_registrationNo resignFirstResponder];
    [self.txt_Remarks resignFirstResponder];
    
    return YES;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


//


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

    
    
    // for names and usernames together:-
    
    //    for (int i=0; i<[respdic count];i++)
    //    {
    //        NSString *name=[[respdic valueForKey:@"Username name"] objectAtIndex:i];
    //        NSString *idis=[[respdic valueForKey:@"id"] objectAtIndex:i];
    //        [array addObject:[NSString stringWithFormat:@"id: %@ Name =%@",idis,name]];
    //    }
    
}



//



- (IBAction)btn_selectbrand:(id)sender
{
    a=1;b=0;c=0,d=0;e=0;f=0;g=0;h=0;
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    
    
    for(int i=0;i<[array_brand_name count];i++)
    {
        
        NSString *namestr=[array_brand_name objectAtIndex:i];
        [arr addObject:namestr];
    }
    
    if(dropDown1 == nil)
    {
        CGFloat f;
        f = 300;
        dropDown1 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown1.delegate = self;
    }
    else
    {
        [dropDown1 hideDropDown:sender];
        [self rel1];
    }

}


//


-(void)getSelctModelDrpDown

{
    
    
//    NSString *str1=[NSString stringWithFormat:@"%@",app.modeldrpdownid];
//    NSLog(@"Output :%@",app.modeldrpdownid);
    
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


//


// select model button.....
- (IBAction)btn_Select_dropdown:(id)sender
{
    
    a=0;b=1;c=0,d=0;e=0;f=0;g=0;h=0;
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
        f=300;
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






//


-(void)getSelctVersionDrpDown

{
    
    
    //    NSString *str1=[NSString stringWithFormat:@"%@",app.modeldrpdownid];
    //    NSLog(@"Output :%@",app.modeldrpdownid);
   
    
     NSString *urlString =[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/versiondropdwon?data={\"model_id\":\"%@\"}",modelstr];
    NSLog(@"urlstr is %@",urlString);
    
    
    //http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/versiondropdwon?data={%22model_id%22:%2217%22}
    
    
   // NSString *urlString =[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/versiondropdwon?data={\"model_id\":\"%@\"}",self.btn_outlet_selectbrand.titleLabel.text];
    
    
    
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
    
   
    [array_version_id objectAtIndex:0];
     NSLog(@"ararr%@",array_version_id);
    
    array_carid = [respdic valueForKey:@"carid"];
    array_carname = [respdic valueForKey:@"carname"];
    array_carimage = [respdic valueForKey:@"carimage"];
    
    
    
}



- (IBAction)btn_sltvrsnacn:(id)sender
{
    a=0;b=0;c=1,d=0;e=0;f=0;g=0;h=0;
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    
    //  NSArray *cntarrrrt=[[NSArray alloc]initWithObjects:@"--select version--",@"Businesss Class",@"TDI premium",@"TDI Technology",@"TFSI Premium",@"Premium Plus", nil];
    NSLog(@"array is %@",array_version_name);
    
    for(int i=0;i<[array_version_name count];i++)
    {
        
        NSString *namestr=[array_version_name objectAtIndex:i];
        [arr addObject:namestr];
    }
    
    if(dropDown3 == nil)
    {
        CGFloat f;
        f=300;
       // f = ([array_version_name count]*41);
        dropDown3 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown3.delegate = self;
    }
    else
    {
        [dropDown3 hideDropDown:sender];
        [self rel3];
    }
    
    
}




-(void)getSelectColorDrpDown

{
    
    
    //    NSString *str1=[NSString stringWithFormat:@"%@",app.modeldrpdownid];
    //    NSLog(@"Output :%@",app.modeldrpdownid);
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/colordropdwon?data={\"model_id\":\"%@\"}",modelstr];
    
    NSLog(@"urlstr is %@",urlString);
    
    NSURL *URL = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSData * jsondata= [NSData dataWithContentsOfURL:URL];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                      jsondata options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"Output :%@",jsonObjects);
    
    NSMutableDictionary * respdic = [[NSMutableDictionary alloc]init];
    
    respdic = [jsonObjects valueForKey:@"text"];
    
    
    array_color_name = [respdic valueForKey:@"color_name"];
    NSLog(@"abnkl%@",array_color_name);
    array_color_id = [respdic valueForKey:@"color_id"];
    
    array_carid = [respdic valueForKey:@"car_id"];
    
    
}





- (IBAction)btn_selectcolor:(id)sender
{
    a=0;b=0;c=0,d=1;e=0;f=0;g=0;h=0;
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    
   // NSArray *cntarrrrt=[[NSArray alloc]initWithObjects:@"--select color--",@"Red",@"Blue",@"Green",@"Violet",@"Gray", nil];
    
    for(int i=0;i<[array_color_name count];i++)
    {
        
        NSString *namestr=[array_color_name objectAtIndex:i];
        [arr addObject:namestr];
    }
    
    if(dropDown4 == nil)
    {
        CGFloat f;
        f=300;
        //f = ([array_color_name count]*41);
        
        dropDown4 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown4.delegate = self;
    }
    else
    {
        [dropDown4 hideDropDown:sender];
        [self rel4];
    }
    
}





- (IBAction)btn_NoofOwner:(id)sender
{
    a=0;b=0;c=0,d=0;e=0;f=0;g=0;h=1;
   arr=[[NSMutableArray alloc]init];
   // NSArray *cntarrrrt=[[NSArray alloc]initWithObjects:@"--Select--",@"1",@"2",@"3",@"4",@"5", nil];
    NSArray *cntarrrrt=[[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5", nil];

    
    
    for(int i=0;i<[cntarrrrt count];i++)
    {
        
        NSString *namestr=[cntarrrrt objectAtIndex:i];
        [arr addObject:namestr];
    }
    
    if(dropDown8 == nil)
    {
        CGFloat f;
        f = ([cntarrrrt count]*41);
        dropDown8 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown8.delegate = self;
    }
    else
    {
        [dropDown8 hideDropDown:sender];
        [self rel8];
    }

}








- (IBAction)btn_makeyear:(id)sender
{
    a=0;b=0;c=0,d=0;e=1;f=0;g=0;h=0;
   arr2=[[NSMutableArray alloc]init];
    
    NSArray *cntarrrrt=[[NSArray alloc]initWithObjects:@"Jan",@"Feb",@"March",@"April",@"May",@"Jun",@"Jul",@"Aug",@"Sep",@"Oct",@"Nov",@"Dec", nil];
    
    for(int i=0;i<[cntarrrrt count];i++)
    {
        
        NSString *namestr=[cntarrrrt objectAtIndex:i];
        [arr2 addObject:namestr];
    }
    
    if(dropDown5 == nil)
    {
        CGFloat f;
        f = ([cntarrrrt count]*40);
        dropDown5 = [[NIDropDown alloc]showDropDown:sender :&f :arr2 :nil :@"down"];
        dropDown5.delegate = self;
    }
    else
    {
        [dropDown5 hideDropDown:sender];
        [self rel5];
    }

}






-(void)getSelectStateDrpDown

{
    
    NSString *urlString =@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/statedropdwon";
    
    NSURL *URL = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSData * jsondata= [NSData dataWithContentsOfURL:URL];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                      jsondata options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"Output :%@",jsonObjects);
    
    NSMutableDictionary * respdic = [[NSMutableDictionary alloc]init];
    
    respdic = [jsonObjects valueForKey:@"userdata"];
    
    
    array_state_name = [respdic valueForKey:@"state_name"];
    array_state_id = [respdic valueForKey:@"state_id"];
    NSLog(@"afgjjkljh%@",array_state_id);
    
    
}



- (IBAction)btn_SelectState:(id)sender
{
    a=0;b=0;c=0,d=0;e=0;f=1;g=0;h=0;
    NSMutableArray *arr=[[NSMutableArray alloc]init];
   // NSArray *cntarrrrt=[[NSArray alloc]initWithObjects:@"Delhi",@"Punjab",@"Goa",@"Rajasthan", nil];
    
    for(int i=0;i<[array_state_name count];i++)
    {
        
        NSString *namestr=[array_state_name objectAtIndex:i];
        [arr addObject:namestr];
    }
    if(dropDown6 == nil)
    {
        CGFloat f;
        f = 300;
        dropDown6 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown6.delegate = self;
    }
//    if(dropDown6 == nil)
//    {
//        CGFloat f;
//        f = ([array_state_name count]*40);
//        dropDown6 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
//        dropDown6.delegate = self;
//    }
    else
    {
        [dropDown6 hideDropDown:sender];
        [self rel6];
    }

}





-(void)getSelectCityDrpDown

{
    
    
    //    NSString *str1=[NSString stringWithFormat:@"%@",app.modeldrpdownid];
    //    NSLog(@"Output :%@",app.modeldrpdownid);
    
    NSString *urlString =[NSString stringWithFormat:@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/citydropdwon?data={\"state_id\":\"%@\"}",statestr];
    
    NSLog(@"urlstyju%@",urlString);
    
    NSURL *URL = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSData * jsondata= [NSData dataWithContentsOfURL:URL];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                      jsondata options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"Output :%@",jsonObjects);
    
    NSMutableDictionary * respdic = [[NSMutableDictionary alloc]init];
    
    respdic = [jsonObjects valueForKey:@"text"];
    
    
    array_city_name = [respdic valueForKey:@"city_name"];
    array_city_id = [respdic valueForKey:@"city_id"];
    
}



- (IBAction)btn_Selectcity:(id)sender
{
    a=0;b=0;c=0,d=0;e=0;f=0;g=1;h=0;
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    
   // NSArray *cntarrrrt=[[NSArray alloc]initWithObjects:@"Mumbai",@"Indore",@"Bhilai",@"Amritsar",@"Margoa",@"Jaipur", nil];
    
    for(int i=0;i<[array_city_name count];i++)
    {
        
        NSString *namestr=[array_city_name objectAtIndex:i];
        [arr addObject:namestr];
    }
    
    if(dropDown7 == nil)
    {
        CGFloat f;
        f = 300;
        dropDown7 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown7.delegate = self;
    }
    else
    {
        [dropDown7 hideDropDown:sender];
        [self rel7];
    }

}



- (IBAction)btn_chooseFiles:(id)sender
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        UIImagePickerController *_picker =
        [[UIImagePickerController alloc] init];
        
        _picker.delegate = self;
        _picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        _picker.wantsFullScreenLayout = YES;
        
        [self presentViewController:_picker animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error to access Camera"
                                                        message:@""
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    }

}



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;
{
    // get the ref url
    NSURL *refURL = [info valueForKey:UIImagePickerControllerReferenceURL];
    
    // define the block to call when we get the asset based on the url (below)
    ALAssetsLibraryAssetForURLResultBlock resultblock = ^(ALAsset *imageAsset)
    {
        ALAssetRepresentation *imageRep = [imageAsset defaultRepresentation];
        NSLog(@"[imageRep filename] : %@", [imageRep filename]);
        self.lbl_uploadcarphoto.text=[imageRep filename];
    };
    
    // get the asset library and fetch the asset based on the ref url (pass in block above)
    ALAssetsLibrary* assetslibrary = [[ALAssetsLibrary alloc] init];
    [assetslibrary assetForURL:refURL resultBlock:resultblock failureBlock:nil];
    
    
}



//ds below code is for the image fetching....

//- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
//{
//    [self dismissModalViewControllerAnimated:YES];
//    
//    NSData *imgdata = UIImageJPEGRepresentation([info objectForKey:UIImagePickerControllerOriginalImage], 0.1);
//    
//   //.. self.img_view.image = [UIImage imageWithData:imgdata];
//    
//   // NSString *str=[NSString stringWithFormat:@"%@",[dateFormat  stringFromDate:self.date_picker.date]];
//    self.lbl_uploadcarphoto.text=imgdata;
//    
//    [self.view endEditing:YES];
//    //    self.view_selectphoto.hidden=true;
//    //    self.backgoundlabel.hidden=true;
//    
//}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)  picker

{
    [picker dismissModalViewControllerAnimated:YES];
    [self.view endEditing:YES];
    //    self.view_selectphoto.hidden=true;
    //    self.backgoundlabel.hidden=true;
}




- (void) niDropDownDelegateMethod: (NIDropDown *) sender
{
    if (a==1&&b==0&&c==0&&d==0&&e==0&&f==0&&g==0&&h==0)
    {
         [self rel1];
        
    }
   
    if (a==0&&b==1&&c==0&&d==0&&e==0&&f==0&&g==0&&h==0)
    {
        [self rel2];
        
    }

    if (a==0&&b==0&&c==1&&d==0&&e==0&&f==0&&g==0&&h==0)
    {
        [self rel3];
        
    }
    
    if (a==0&&b==0&&c==0&&d==1&&e==0&&f==0&&g==0&&h==0) {
        [self rel4];
        
    }
    if (a==0&&b==0&&c==0&&d==0&&e==1&&f==0&&g==0&&h==0) {
        [self rel5];
        
    }
    if (a==0&&b==0&&c==0&&d==0&&e==0&&f==1&&g==0&&h==0) {
        [self rel6];
        
    }
    if (a==0&&b==0&&c==0&&d==0&&e==0&&f==0&&g==1&&h==0) {
        [self rel7];
        
    }
    if (a==0&&b==0&&c==0&&d==0&&e==0&&f==0&&g==0&&h==1) {
        [self rel8];
        
    }

    
}



-(void)rel1
{
    dropDown1 = nil;
    brandstr=[NSString stringWithFormat:@"%@",[array_brand_id objectAtIndex:app.index]];
    NSLog(@"brandstr%@",brandstr);
     NSLog(@"brandstr%ld",(long)app.index);
   
    
    [self getSelctModelDrpDown];

}
-(void)rel2
{
     dropDown2 = nil;
    modelstr=[NSString stringWithFormat:@"%@",[array_model_id objectAtIndex:app.index]];
    NSLog(@"modelstr%@",modelstr);
    NSLog(@"modelstr%ld",(long)app.index);
    
    [self getSelctVersionDrpDown];
}

-(void)rel3
{
    dropDown3 = nil;
    
    modelstr=[NSString stringWithFormat:@"%@",[array_model_id objectAtIndex:app.index]];
    NSLog(@"modelstr%@",modelstr);
    NSLog(@"modelstr%ld",(long)app.index);
    
     versionstr=[NSString stringWithFormat:@"%@",[array_version_id objectAtIndex:app.index]];
    
     NSLog(@"versionstr%@",versionstr);
    
    [self getSelectColorDrpDown];
}

-(void)rel4
{
    dropDown4 = nil;
    colourstr=[NSString stringWithFormat:@"%@",[array_color_id objectAtIndex:app.index]];
    
     NSLog(@"colorstr%@",colourstr);
}
-(void)rel5
{
    dropDown5 = nil;
    
    monthstr=[NSString stringWithFormat:@"%@",[arr2 objectAtIndex:app.index]];
    
    NSLog(@"monthstr%@",monthstr);

}
-(void)rel6
{
    dropDown6 = nil;
    statestr=[NSString stringWithFormat:@"%@",[array_state_id objectAtIndex:app.index]];
    NSLog(@"statestr%@",statestr);
    NSLog(@"statestr%ld",(long)app.index);
    
    [self getSelectCityDrpDown];


    
}
-(void)rel7
{
    dropDown7 = nil;
    citystr=[NSString stringWithFormat:@"%@",[array_city_id objectAtIndex:app.index]];
    NSLog(@"citystr%@",citystr);
    NSLog(@"statestr%ld",(long)app.index);
    
   
}
-(void)rel8
{
    dropDown8 = nil;
    
    noofownerstr=[NSString stringWithFormat:@"%@",[arr objectAtIndex:app.index]];
    
    NSLog(@"noofowners%@",noofownerstr);

}


- (IBAction)btn_dateclick:(id)sender
{
    self.VIEWPICKER.hidden=NO;
//    self.date_picker =[[UIDatePicker alloc]initWithFrame:CGRectMake(0, 0,10, 50)];
//  self.date_picker.datePickerMode=UIDatePickerModeDate;
    self.date_picker.hidden=NO;
    self.date_picker.date=[NSDate date];
    [self.date_picker addTarget:self action:@selector(LabelTitle:) forControlEvents:UIControlEventValueChanged];
    self.date_picker.backgroundColor=[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0];
    [self.VIEWPICKER addSubview:self.date_picker];
    
    
    
  }


-(void)LabelTitle:(id)sender
{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    dateFormat.dateStyle=NSDateFormatterMediumStyle;
    [dateFormat setDateFormat:@"MM/dd/yyyy"];
    NSString *str=[NSString stringWithFormat:@"%@",[dateFormat  stringFromDate:self.date_picker.date]];
    self.lbl_displaydate.text=str;
}



- (IBAction)btn_set:(id)sender
{
   // [self.date_picker removeFromSuperview];
    self.VIEWPICKER.hidden=YES;
}




- (IBAction)btn_SendEnquiry:(id)sender
{
    /*
     [self.lbl_uploadcarphoto.text isEqualToString:@""] ||
     [self.lbl_displaydate.text isEqualToString:@"mm/dd/yyyy"]
     */
    
    NSMutableDictionary *mydict=[[NSMutableDictionary alloc]init];
    
    if(txt_ownername.text==NULL || txt_registrationNo.text==NULL || txt_MakeYear.text==NULL || txt_kmsDriven.text==NULL|| txt_pincode.text==NULL|| txt_expectedPrice.text==NULL|| txt_Remarks.text==NULL|| txt_name.text==NULL|| txt_emailAddress.text==NULL||txt_MbNo2.text==NULL || [self.btn_outlet_selectbrand.titleLabel.text isEqualToString:@"--select brand--"]||[self.btn_outlet_selectmodel.titleLabel.text isEqualToString:@"--select model--"]||[self.btn_outlet_selectversion.titleLabel.text isEqualToString:@"--select version--"]|| [self.btn_makeYear.titleLabel.text isEqualToString:@"Jan"]|| [self.btn_outlet_seleectcolor.titleLabel.text isEqualToString:@"--select color--"]|| [self.btn_outlet_noofowner.titleLabel.text isEqualToString:@"--Select--"]||[self.btn_outlet_state.titleLabel.text isEqualToString:@"--Select State--"]|| [self.btn_outlet_city.titleLabel.text isEqualToString:@"--Select--"])
        
    {
        UIAlertView *messageBox = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Please enter full details" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        
        [messageBox show];
    }
    else
    {
        //data={"brand_id":"15","model_id":"10","version_id":"111","owner_name":"poonam","registration_no":"1212","month":"5","year":"1990","state":"3","city":"2","pincode":"452002","exprice":"2000000","remark":"hii","username":"poonam","email":"poonamboriya@gmail.com","mobile":"9022504685","Kms":"12222","color_id":"dddh","noowner":"2"}
        
        
        [mydict setObject:txt_ownername.text forKey:@"owner_name"];
        [mydict setObject:txt_registrationNo.text forKey:@"registration_no"];
        [mydict setObject:txt_MakeYear.text forKey:@"year"];
        [mydict setObject:txt_kmsDriven.text forKey:@"Kms"];
        [mydict setObject:txt_pincode.text forKey:@"pincode"];
        [mydict setObject:txt_expectedPrice.text forKey:@"exprice"];
        [mydict setObject:txt_Remarks.text forKey:@"remark"];
        [mydict setObject:txt_name.text forKey:@"username"];
        [mydict setObject:txt_emailAddress.text forKey:@"email"];
        [mydict setObject:txt_MbNo2.text forKey:@"mobile"];
        
        [mydict setObject:brandstr forKey:@"brand_id"];
         [mydict setObject:modelstr forKey:@"model_id"];
         [mydict setObject:versionstr forKey:@"version_id"];
         [mydict setObject:colourstr forKey:@"color_id"];
         [mydict setObject:noofownerstr forKey:@"noowner"];
        [mydict setObject:monthstr forKey:@"month"];
       // [mydict setObject:self.lbl_displaydate.text forKey:@"month"];
       // [mydict setObject:self.lbl_uploadcarphoto.text forKey:@"month"];
         [mydict setObject:statestr forKey:@"state"];
         [mydict setObject:citystr forKey:@"city"];
      
        
        
               
        NSString *str=@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/sellcar?";
        
        
        NSURL *tempurl=[NSURL URLWithString:str];
        
        NSLog(@"tempurl:%@",tempurl);
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:tempurl cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:100.0];
        NSError *error;
        [request setTimeoutInterval:100.0];
        [request setURL:tempurl];
        [request setHTTPMethod:@"POST"];
        NSString *boundary = @"---------------------------14737809831466499882746641449";
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
        NSMutableData *body = [NSMutableData data];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"data\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        // NSLog(@"body:%@",body);
        NSData *paramsJSONDictionaryData = [NSJSONSerialization dataWithJSONObject:mydict options:NSJSONWritingPrettyPrinted error:&error];
        // NSLog(@"paramsJSONDictionaryData:%@",paramsJSONDictionaryData);
        NSString *jsonParamsString = [[NSString alloc] initWithData:paramsJSONDictionaryData encoding:NSUTF8StringEncoding];
        
        NSLog(@"jsonParamsString :%@",jsonParamsString );
        
        [body appendData:[[NSString stringWithFormat:@"%@\r\n",jsonParamsString] dataUsingEncoding:NSUTF8StringEncoding]];
        [request setHTTPBody:body];
        NSHTTPURLResponse *response = [[NSHTTPURLResponse alloc] init];
        // NSLog(@"response:%@",response);
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        //NSLog(@"respopsedata:%@",responseData);
        NSDictionary *jsonResponseDictionary = [NSJSONSerialization JSONObjectWithData:responseData
                                                                               options:kNilOptions error:&error];
        NSLog(@"resp:%@",jsonResponseDictionary);
        
        NSString  *responsestr =[jsonResponseDictionary valueForKey:@"response"];
        
        
        
            if([responsestr isEqualToString:@"success"])
            
        {
            
            
            UIAlertView *messageBox = [[UIAlertView alloc]initWithTitle:@"VahanIndia" message:@"Data inserted successfully!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            
            [messageBox show];
            
        }
        
        else if([responsestr isEqualToString:@"failure"])
            
            
        {
            UIAlertView *messageBox = [[UIAlertView alloc]initWithTitle:@"VahanIndia" message:@"Data is not inserted" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            
            [messageBox show];
            
            
        }
        
    }

    
}




@end
