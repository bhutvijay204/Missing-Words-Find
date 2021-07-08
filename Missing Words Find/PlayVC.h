

#import <UIKit/UIKit.h>
#import "resultView.h"
NS_ASSUME_NONNULL_BEGIN

@interface PlayVC : UIViewController

@property(nonatomic,strong)NSArray *animalArray;
@property(nonatomic,strong)NSArray *birdsArray;
@property(nonatomic,strong)NSArray *numberArray;

@property(nonatomic,strong)IBOutlet UILabel *lblName;
@property(nonatomic,strong)IBOutlet UIImageView *img;

@property NSString *catagory;
@property NSString *imgToshow;
@property BOOL isFruit;
@property int levelType;
@property (nonatomic,strong)NSString *gamecetagory;

@end

NS_ASSUME_NONNULL_END
