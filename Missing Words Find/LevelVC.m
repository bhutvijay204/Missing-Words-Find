
#import "LevelVC.h"

@interface LevelVC ()

@end

@implementation LevelVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([_gamecetagory  isEqual: @"1"])
    {
        _img1.image = [UIImage imageNamed:@"salad"];
        _img2.image = [UIImage imageNamed:@"salad"];
        _img3.image = [UIImage imageNamed:@"salad"];

    }
    else if ([_gamecetagory  isEqual: @"2"])
    {
        _img1.image = [UIImage imageNamed:@"number-blocks"];
        _img2.image = [UIImage imageNamed:@"number-blocks"];
        _img3.image = [UIImage imageNamed:@"number-blocks"];
        
    }
    else if ([_gamecetagory  isEqual: @"3"])
    {
        _img1.image = [UIImage imageNamed:@"fruit"];
        _img2.image = [UIImage imageNamed:@"fruit"];
        _img3.image = [UIImage imageNamed:@"fruit"];
        
    }
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
    PlayVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"PlayVC"];
    if (sender.tag == 101)
    {
        vc.levelType = 0;
    }
    else if (sender.tag == 102)
    {
        vc.levelType = 1;

    }
    else if (sender.tag == 103)
    {
        vc.levelType = 2;
    }
    vc.gamecetagory = _gamecetagory;
    [self.navigationController pushViewController:vc animated:true];

}

- (IBAction)btnBACK:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
