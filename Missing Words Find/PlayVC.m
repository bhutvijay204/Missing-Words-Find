

#import "PlayVC.h"

@interface PlayVC ()
{
    NSString *namedata;
    NSString *animalMatchName;
    NSString *imgToshow;
    NSArray *FruitArray;
    NSArray *VagitableArray;
    NSArray *NumberArray;

    
    NSArray *VagitableTest;
    NSArray *FruitTest;
    NSTimer *RemainTimer;
    int time;
    __weak IBOutlet UILabel *lblTimer;
    int trueCount;
    
}
@end

@implementation PlayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    trueCount = 0;
    time = 50;
    self.title = @"Play Quiz- Vegetables";
    if (_levelType == 1)
    {
        time = 35;
        self.title = @"Play Quiz- Numbers";

    }
    
    if (_levelType == 2)
    {
        time = 20;
        self.title = @"Play Quiz- Fruits";

    }
    
    
    RemainTimer = [NSTimer scheduledTimerWithTimeInterval: 1.0
                                                   target: self selector:@selector(onTick)
                                                 userInfo: nil repeats:YES];
    [self onTick];
    
    FruitArray = [[NSArray alloc]initWithObjects:@"APPLE.jpg",@"APRICOT.png",@"BANANA.jpg",@"CHERRIES.jpg",@"GRAPES.jpg",@"GUAVA.jpg",@"KIWI.jpg",@"LOQUAT.jpg",@"ORANGE.jpg",@"PEACH.jpg",@"WATERMELON.jpg", nil];
    VagitableArray  = [[NSArray alloc]initWithObjects:@"BASIL.jpg",@"BEANS.jpg",@"BEETROOT.jpg",@"CABBAGE.jpg",@"CHICKPEA.jpg",@"CUCUMBER.jpg",@"ONION.jpg",@"DILL.jpg",@"GARLIC.jpg",@"LEEKS.jpg",@"PARSLEY.jpg",@"PEAS.jpg",@"PUNMPKIN.jpg",@"TOMATO.jpg",@"ZUCCINI.jpg", nil];
        NumberArray = [[NSArray alloc]initWithObjects:@"ONE.jpg",@"TWO.jpg",@"THREE.jpg",@"FOUR.jpg",@"FIVE.jpg",@"SIX.jpg",@"SEVEN.jpg",@"EIGHT.jpg",@"NINE.jpg",@"TEN.jpg",@"ELEVEN.jpg",@"TWELVE.jpg",@"FIFTEEN.jpg", nil];

    
    [self generateRandom];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor blackColor],
       NSFontAttributeName:[UIFont fontWithName:@"AmericanTypewriter-Bold" size:20.0]}];
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
}

- (void)viewDidDisappear:(BOOL)animated
{
    if (RemainTimer != nil)
    {
        [RemainTimer invalidate];
        RemainTimer = NULL;
    }
}
-(void)generateRandom
{
    NSString *randomName = @"";
    if ([_gamecetagory  isEqual: @"1"])
    {
        randomName = [VagitableArray objectAtIndex:arc4random()%[VagitableArray count]];
    }
    else  if ([_gamecetagory  isEqual: @"2"])
    {
        randomName = [NumberArray objectAtIndex:arc4random()%[NumberArray count]];
    }
    else  if ([_gamecetagory  isEqual: @"3"])
    {
        randomName = [FruitArray objectAtIndex:arc4random()%[FruitArray count]];
    }
    
    imgToshow = randomName;
    NSString *str;
    _img.image = [UIImage imageNamed:imgToshow];
    str  = [imgToshow substringToIndex:[imgToshow
                                        length] - 5];
    _lblName.text = [str stringByAppendingString:@"_"];
}
-(void)onTick
{
    if(time == 0)
    {
        if (RemainTimer != nil)
        {
            [RemainTimer invalidate];
            RemainTimer = NULL;
        }
        resultView *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"resultView"];
        vc.score = [NSString stringWithFormat:@"%d",trueCount];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    time--;
    [lblTimer setText:[NSString stringWithFormat:@"Remaining time:%d",time]];
}

-(IBAction)btnAction:(id)sender{
  //  NSLog(@"Button pressed: %@", [sender currentTitle]);
   // [_btnshow setTitle:@"show" forState:UIControlStateNormal];
    
    
    NSString *str;
    str = _lblName.text;
    
    
    str = [str substringToIndex:[str length] - 1];
    
    
    namedata = [NSString stringWithFormat:@"%@%@", str,
                [sender currentTitle]];
    
    animalMatchName = imgToshow;
    animalMatchName = [animalMatchName substringToIndex:[animalMatchName
                                                         length] - 4];
    if ([namedata isEqualToString:animalMatchName]) {
        NSLog(@"match");
        _lblName.text = namedata;
        [self generateRandom];
        trueCount++;
        //[self performSegueWithIdentifier:@"result" sender:self];
        
    }else{
        [self shakeAnimation:_lblName];
        //        _lblName.text = [str substringToIndex:[str length] - 1];
        
    }
}
-(void)shakeAnimation:(UILabel*) label
{
    CABasicAnimation *shake = [CABasicAnimation animationWithKeyPath:@"position"];
    [shake setDuration:0.1];
    [shake setRepeatCount:5];
    [shake setAutoreverses:YES];
    [shake setFromValue:[NSValue valueWithCGPoint:
                         CGPointMake(label.center.x - 5,label.center.y)]];
    [shake setToValue:[NSValue valueWithCGPoint:
                       CGPointMake(label.center.x + 5, label.center.y)]];
    [label.layer addAnimation:shake forKey:@"position"];
}

@end
