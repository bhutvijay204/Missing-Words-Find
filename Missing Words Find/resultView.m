

#import "resultView.h"

@interface resultView ()

@end

@implementation resultView

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [_lblName setText: [NSString stringWithFormat:@"YOUR SCORE :- %@",_score]];

}
-(IBAction)btn1GOHome:(id)sender{
    
    
    [self.navigationController popToRootViewControllerAnimated:TRUE];
    
}

-(IBAction)btnGOHome:(id)sender{
    
    
    [self.navigationController popToRootViewControllerAnimated:TRUE];
    
}
@end
