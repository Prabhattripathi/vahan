//
//  FinanceViewController.m
//  VahanIndia
//
//  Created by geniemac4 on 31/03/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import "FinanceViewController.h"
#import "BaseTableView.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <QuartzCore/QuartzCore.h>
#import "DemoAppDelegate.h"

@interface FinanceViewController ()
{
    UIImage *image;
    BaseTableView *basetab;
    UIImageView *backimgview;
    
    
    
    DemoAppDelegate *app;
    
    NSInteger a,b,c,d,e,f,g,h;
    
    
    //for BRAND drp down...
    NSMutableArray * array_brand_id;
    NSMutableArray * array_brand_name;
    
    //for MODEL drp down...
    NSMutableArray * array_model_id;
    NSMutableArray * array_model_name;
    
    //for VERSION drp down...
    NSMutableArray * array_version_id;
    NSMutableArray * array_version_name;
    NSMutableArray * array_carid;
    NSMutableArray * array_carname;
    NSMutableArray * array_carimage;
    
    NSMutableArray * array_state_name;
    NSMutableArray * array_state_id;
    
    NSMutableArray * array_city_name;
    NSMutableArray * array_city_id;
    
    NSMutableArray *arrr;
    
    NIDropDown *dropDown1 ,*dropDown2 ,*dropDown3,*dropDown4,*dropDown5,*dropDown6,*dropDown7,*dropDown8;
    NSString *brandstr ,*modelstr,*statestr,*citystr,*versionstr,*carloantypestr;

    
    
}


@end

@implementation FinanceViewController

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
    
    [self getSelctBrandDrpDown];
    
    [self getSelectCityDrpDown];
    
    
    //for the view's background color...
    self.view.backgroundColor=[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0];
    
    
    
    [self.scroll_view setScrollEnabled:YES];
    [self.scroll_view setContentSize:CGSizeMake(0, 870)];
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
    
    
    //date view...
    
    self.VIEW_DATEPICKER.hidden=YES;


    
}


//fr drpdown..


-(int)getRandomNumberBetween:(int)from to:(int)to
{
    
    return (int)from + arc4random() % (to-from+1);
}


-(void)UniqueRandom
{
    
    int T[11];
    BOOL flag;
    for(int i=0;i<10;i++){
        
        int ranNo=  random()%100+1;
        flag=TRUE;
        int s=(sizeof T);
        
        for(int x=0;x<s;x++){
            
            if(ranNo==T[x]){
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


//- (void) niDropDownDelegateMethod: (NIDropDown *) sender
//{
//    
//    [self rel];
//    
//}
//
//-(void)rel
//{
//    dropDown = nil;
//}

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
    
    versionstr=[NSString stringWithFormat:@"%@",[array_version_id objectAtIndex:app.index]];
    
    NSLog(@"versionstr%@",versionstr);

}

-(void)rel4
{
    dropDown4 = nil;
    
    citystr=[NSString stringWithFormat:@"%@",[array_city_id objectAtIndex:app.index]];
    
    NSLog(@"Citystr%@",citystr);

}
-(void)rel5
{
    dropDown5 = nil;
    
    carloantypestr=[NSString stringWithFormat:@"%@",[arrr objectAtIndex:app.index]];
    
    NSLog(@"carloantypestr%@",carloantypestr);

    
}
-(void)rel6
{
    dropDown6 = nil;
}
-(void)rel7
{
    dropDown7 = nil;
    
    
}
-(void)rel8
{
    dropDown8 = nil;
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
    [textField resignFirstResponder];
    
    return YES;
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





- (IBAction)btn_dateclick:(id)sender
{
    self.VIEW_DATEPICKER.hidden=NO;
    //    self.date_picker =[[UIDatePicker alloc]initWithFrame:CGRectMake(0, 0,10, 50)];
    //  self.date_picker.datePickerMode=UIDatePickerModeDate;
    self.date_picker.hidden=NO;
    self.date_picker.date=[NSDate date];
    [self.date_picker addTarget:self action:@selector(LabelTitle:) forControlEvents:UIControlEventValueChanged];
    self.date_picker.backgroundColor=[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0];
    [self.VIEW_DATEPICKER addSubview:self.date_picker];
    

}

-(void)LabelTitle:(id)sender
{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    dateFormat.dateStyle=NSDateFormatterMediumStyle;
    [dateFormat setDateFormat:@"MM/dd/yyyy"];
    NSString *str=[NSString stringWithFormat:@"%@",[dateFormat  stringFromDate:self.date_picker.date]];
    self.lbl_displaydate.text=str;
}


- (IBAction)btn_done:(id)sender
{
    self.VIEW_DATEPICKER.hidden=YES;
}






- (IBAction)btn_submit:(id)sender
{
    
    NSMutableDictionary *mydict=[[NSMutableDictionary alloc]init];
    
    
    
    if(self.txt_mb2.text==NULL || self.txt_email.text==NULL || self.txt_name.text==NULL || self.txt_monthlyIncome.text==NULL|| self.txt_Rs.text==NULL || [self.btn_outlet_newcarloan.titleLabel.text isEqualToString:@"--New Car Loan--"] || [self.btn_outlet_selectbrand.titleLabel.text isEqualToString:@"--Select Brand--"]|| [self.btn_outlet_selectmodel.titleLabel.text isEqualToString:@"--Select Model--"]|| [self.btn_outlet_selectversion.titleLabel.text isEqualToString:@"--Select Version--"]|| [self.btn_outlet_selectcity.titleLabel.text isEqualToString:@"--Select City--"] || [self.lbl_displaydate.text isEqualToString:@"mm/dd/yyyy"])
        
        
                
    {
        UIAlertView *messageBox = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Please enter full details" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        
        [messageBox show];
    }
    else
    {
        
        /*data={"type":"new","brand_id":"10","model_id":"10","version_id":"111","city_id":"10","username":"poonam","email":"poonamboriya@gmail.com","mobile":"9022504685","loan_ammount":"565655","monthly_income":"500000","dob":"23-09-99"}
         
         */

        
        [mydict setObject:self.txt_Rs.text forKey:@"loan_ammount"];
        [mydict setObject:self.txt_monthlyIncome.text forKey:@"monthly_income"];
        [mydict setObject:self.txt_name.text forKey:@"username"];
        [mydict setObject:self.txt_email.text forKey:@"email"];
        [mydict setObject:self.txt_mb2.text forKey:@"mobile"];
        
        [mydict setObject:brandstr forKey:@"brand_id"];
        [mydict setObject:modelstr forKey:@"model_id"];
        [mydict setObject:versionstr forKey:@"version_id"];
        [mydict setObject:citystr forKey:@"city_id"];
        [mydict setObject:carloantypestr forKey:@"type"];
        [mydict setObject:self.lbl_displaydate.text forKey:@"dob"];
        
        
    
        NSString *str=@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/finance?";
        
        
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





// for dropdown buttons...




#pragma mark

#pragma mark    DropDowns...

#pragma mark


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
    
    
}


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
    array_carid = [respdic valueForKey:@"carid"];
    array_carname = [respdic valueForKey:@"carname"];
    array_carimage = [respdic valueForKey:@"carimage"];
    
    
    
}



-(void)getSelectCityDrpDown

{
    
    NSString *urlString =@"http://demo1.geniesoftsystem.com/vahanindia/api/index.php/api/citysingledropdown";
    
    
    
    NSURL *URL = [[NSURL alloc]initWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSData * jsondata= [NSData dataWithContentsOfURL:URL];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                      jsondata options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"Output :%@",jsonObjects);
    
    NSMutableDictionary * respdic = [[NSMutableDictionary alloc]init];
    
    respdic = [jsonObjects valueForKey:@"userdata"];
    
    
    array_city_name = [respdic valueForKey:@"city_name"];
    array_city_id = [respdic valueForKey:@"city_id"];
    
    NSLog(@"afgjjkljh%@",array_city_id);
    
    
    
    
}




- (IBAction)btn_newcarloan:(id)sender
{
    /*
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

     */
    
    a=0;b=0;c=0,d=0;e=1;f=0;g=0;h=0;
    
    arrr=[[NSMutableArray alloc]init];
    
    NSArray *cntarr=[[NSArray alloc]initWithObjects:@"New Car Loan",@"Used Car Loan",@"Car Loan Balance Transfer", nil];
    
    for(int i=0;i<[cntarr count];i++)
    {
        
        NSString *namestr=[cntarr objectAtIndex:i];
        [arrr addObject:namestr];
    }
    
    if(dropDown5 == nil)
    {
        CGFloat f;
        f = ([cntarr count]*41);
        dropDown5 = [[NIDropDown alloc]showDropDown:sender :&f :arrr :nil :@"down"];
        dropDown5.delegate = self;
    }
    else
    {
        [dropDown5 hideDropDown:sender];
        [self rel5];
    }

}

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

- (IBAction)btn_selectModel:(id)sender
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

- (IBAction)select_version:(id)sender
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
        f = 300;
        dropDown3 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown3.delegate = self;
    }
    else
    {
        [dropDown3 hideDropDown:sender];
        [self rel3];
    }
    

}

- (IBAction)btn_selectCity:(id)sender
{
    a=0;b=0;c=0,d=1;e=0;f=0;g=0;h=0;
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    
    //  NSArray *cntarrrrt=[[NSArray alloc]initWithObjects:@"--select version--",@"Businesss Class",@"TDI premium",@"TDI Technology",@"TFSI Premium",@"Premium Plus", nil];
    NSLog(@"array is %@",array_city_name);
    
    for(int i=0;i<[array_city_name count];i++)
    {
        
        NSString *namestr=[array_city_name objectAtIndex:i];
        [arr addObject:namestr];
    }
    
    if(dropDown4 == nil)
    {
        CGFloat f;
        f =300;
        dropDown4 = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDown4.delegate = self;
    }
    else
    {
        [dropDown4 hideDropDown:sender];
        [self rel4];
    }

}




@end
