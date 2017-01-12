
//默认加载图片
#define PLACEHOLDER [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"placeholder" ofType:@"jpg"]]
#define TAPLOAD [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"tapLoadImage" ofType:@"jpg"]]


//屏幕宽高
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

//系统颜色
#define CLEARCOLOR [UIColor clearColor]
#define REDCOLOR [UIColor redColor]
#define BLACKCOLOR [UIColor blackColor]
#define DARKGRAYCOLOR [UIColor darkGrayColor]
#define LIGHTGRAYCOLOR [UIColor lightGrayColor]
#define WHITECOLOR [UIColor whiteColor]
#define GRAYCOLOR [UIColor grayColor]
#define GREENCOLOR [UIColor greenColor]
#define BLUECOLOR [UIColor blueColor]
#define CYANCOLOR [UIColor cyanColor]
#define YELLOWCOLOR [UIColor yellowColor]
#define MAGENTACOLOR [UIColor magentaColor]
#define ORANGECOLOR [UIColor orangeColor]
#define PURPLECOLOR [UIColor purpleColor]
#define BROWNCOLOR [UIColor brownColor]
#define DNColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]


//打印
#ifdef DEBUG
#define NSLogRect(rect) NSLog(@"%s x:%.4f, y:%.4f, w:%.4f, h:%.4f", #rect, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)
#define NSLogSize(size) NSLog(@"%s w:%.4f, h:%.4f", #size, size.width, size.height)
#define NSLogPoint(point) NSLog(@"%s x:%.4f, y:%.4f", #point, point.x, point.y)
#define DNLogPoint(p) NSLog(@"%@",NSStringFromCGPoint(p))
#define DNLogSize(p) NSLog(@"%@",NSStringFromCGSize(p))
#define DNLogRect(frame) NSLog(@"x->%f,y->%f,width->%f,height->%f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height)
#define DNLog(p) NSLog(@"%@",p)
#define DNLogDicKeyValue(p,q) NSLog(@"%@<---->%@",p,q)
#define DNLogFUNCTION NSLog(@"%s",__FUNCTION__);
#define DNDocumentUrl NSLog(@"%@",[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]);
#else
#define NSLogRect(rect)
#define NSLogSize(size)
#define NSLogPoint(point)
#define DNLogPoint(p)
#define DNLogSize(p)
#define DNLogRect(frame)
#define DNLog(p)
#define DNLogDicKeyValue(p,q)
#define DNLogFUNCTION
#define DNDocumentUrl

#endif

//iOS系统版本
#define IOS_VERSION ［[UIDevice currentDevice] systemVersion] floatValue]
#define ios9x  [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0f
#define ios8x  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0f) && ([[[UIDevice currentDevice] systemVersion] floatValue] < 9.0f)
#define ios7x ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f) && ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0f)
#define iosNot7x [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0f
//手机屏幕
#define iphone4x_3_5 ([UIScreen mainScreen].bounds.size.height==480.0f)
#define iphone5x_4_0 ([UIScreen mainScreen].bounds.size.height==568.0f)
#define iphone6_4_7 ([UIScreen mainScreen].bounds.size.height==667.0f)
#define iphone6Plus_5_5 ([UIScreen mainScreen].bounds.size.height==736.0f || [UIScreen mainScreen].bounds.size.height==414.0f)

//设置应用内颜色
#pragma mark - Color
//#define DEFAULT_NAVBAR_COLOR            [UIColor colorWith0xRGB:@"f43b3b"];
#define DEFAULT_BACKGROUND_COLOR        DNColor(239.0, 239.0, 244.0, 1.0)

#define DEFAULT_SEARCHBAR_COLOR         DNColor(239.0, 239.0, 244.0, 1.0)
#define DEFAULT_TABBAr_COLOR             DNColor(240, 43, 52, 1.0f)

#define TitleColor [UIColor colorWithR:30 g:30 b:30 a:1]




