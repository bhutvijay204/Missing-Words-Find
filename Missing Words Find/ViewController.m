

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor blackColor],
       NSFontAttributeName:[UIFont fontWithName:@"AmericanTypewriter-Bold" size:20.0]}];
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
}
-(IBAction)btnAction:(UIButton *)sender
{
    LevelVC *levelview = [self.storyboard instantiateViewControllerWithIdentifier:@"LevelVC"];

    if (sender.tag == 101)
    {
        levelview.gamecetagory = @"1";
    }
    else if (sender.tag == 102)
    {
         levelview.gamecetagory = @"2";
    }
    else if (sender.tag == 103)
    {
         levelview.gamecetagory = @"3";
    }
    [self.navigationController pushViewController:levelview animated:YES];

    
}
- (IBAction)btnShare:(id)sender
{
    NSString *urlToShare = @"Hello! Check Out Missing Words Find app on the App Store here:- https://itunes.apple.com/us/app/id1499324976&mt=8";
    NSArray *itemsToShare = @[urlToShare];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc]initWithActivityItems:itemsToShare applicationActivities:nil];
    activityVC.excludedActivityTypes = @[UIActivityTypePostToWeibo,UIActivityTypePostToTwitter,UIActivityTypePostToFacebook,UIActivityTypeMail,UIActivityTypeMessage,UIActivityTypeAssignToContact,UIActivityTypePostToTencentWeibo];
    [self presentViewController:activityVC animated:YES completion:nil];
    
}

@end
