//
//  ByPriceFinalNewsDetailedViewController.m
//  VahanIndia
//
//  Created by geniemac4 on 08/04/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import "ByPriceFinalNewsDetailedViewController.h"
#import "ByPriceFinalNewsDetailedTableViewCell.h"
#import "BaseTableView.h"
#import "MBProgressHUD.h"
#import "DemoAppDelegate.h"
#import "ByPriceFinalColorCollViewCell.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
#import "MBProgressHUD.h"


@interface ByPriceFinalNewsDetailedViewController ()

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
    
    DemoAppDelegate *app;
    MBProgressHUD*HUD;
    
    NSMutableArray * namearray;
    
    //custom label fr long description in news detail...
     UILabel * lbl_News_longdescrr;
}



@end

@implementation ByPriceFinalNewsDetailedViewController

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
//    self.view.backgroundColor=[UIColor colorWithRed:204.0/255.0f green:208.0/255.0f blue:234.0/255.0f alpha:1.0];
    
    
    //imp step...
    //self.table_view.backgroundColor=[UIColor clearColor];

    
}



 

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return 1;
    //return [array2 count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *simpleTableIdentifier = @"ByPriceFinalNewsDetailedTableViewCell";
    
    ByPriceFinalNewsDetailedTableViewCell *cell1 = (ByPriceFinalNewsDetailedTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell1 == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ByPriceFinalNewsDetailedTableViewCell" owner:self options:nil];
        cell1 = [nib objectAtIndex:0];
    }
    
    
    //for particular car title Name...
    
    cell1.lbl_detailNews_TITLE.text=app.NewsDetailTITLE;
    cell1.lbl_detailNews_DATE.text=app.NewsDetailSTARTDATE;
    cell1.lbl_detailnews_username.text=app.NewsDetailUSERNAME;
    
    
    //for particular car's Image...
    
    [cell1.img_detailNews_IMG setImageWithURL:[NSURL URLWithString:app.NewsDetailIMAGE] placeholderImage:[UIImage imageNamed:@"logo.png"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
        
    //DYNAMIC CREATION OF "DESCRIPTION" LABEL...
    
    NSString *Descrstr=[NSString stringWithFormat:@"%@",app.NewsDetailLONGDESCRP];
    NSLog(@"app.munjisDescription:%@",app.NewsDetailLONGDESCRP);
    
    CGSize size1 = [self text:app.NewsDetailLONGDESCRP sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(300, 3000) lineBreakMode:NSLineBreakByWordWrapping];
    
    // lbl_description =[[UILabel alloc]initWithFrame:CGRectMake(0,75, size1.width, size1.height)];
    lbl_News_longdescrr =[[UILabel alloc]initWithFrame:CGRectMake(2,300, size1.width, size1.height)];
    lbl_News_longdescrr.numberOfLines = 0;
    lbl_News_longdescrr.lineBreakMode = NSLineBreakByWordWrapping;
    
    
    
//    
//    app.NewsDetailLONGDESCRP = [app.NewsDetailLONGDESCRP dataUsingEncoding:NSUTF8StringEncoding];
////    NSString *decodevalue1 = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    [app.NewsDetailLONGDESCRP stringByAddingPercentEscapesUsingEncoding:
     NSUTF8StringEncoding];
    
    NSLog(@"ajjjkl%@",app.NewsDetailLONGDESCRP);
    lbl_News_longdescrr.text=app.NewsDetailLONGDESCRP;
    lbl_News_longdescrr.font=[UIFont systemFontOfSize:15];
    
    [cell1.contentView addSubview:lbl_News_longdescrr];
    
    cell1.selectionStyle=UITableViewCellSelectionStyleNone;    
    
    return cell1;
    
}


-(CGSize)text:(NSString*)text sizeWithFont:(UIFont*)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode) linkBreakMode
{
    if([text respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]){
        NSDictionary *attributesDictionary = @{NSFontAttributeName: font};
        CGRect frame = [text boundingRectWithSize:size
                                          options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                       attributes:attributesDictionary
                                          context:nil];
        return frame.size;
    }
    else
    {
        return [text sizeWithFont:font constrainedToSize:size lineBreakMode:linkBreakMode];
    }
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGSize size = [self text:app.NewsDetailLONGDESCRP sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(300, 3000) lineBreakMode:NSLineBreakByWordWrapping];
    
    
    return size.height+300;
    
    //return 2500;
    
    
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



@end
