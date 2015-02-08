//
//  ViewController.m
//  图片浏览器(优化)
//
//  Created by firework on 15/2/7.
//  Copyright (c) 2015年 fireworkwhj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


//声明对象
//索引label
@property (weak, nonatomic) IBOutlet UILabel *indexLabel;
//图片view
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
//前一张图片的按钮
@property (weak, nonatomic) IBOutlet UIButton *perviouBtn;
//下一张图片的按钮
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
//描述lebel
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

//定义一个属性记录索引
@property (nonatomic,assign) int index;
//定义一个数组存储变化的数据
@property (nonatomic,strong) NSArray * datas;

//声明前一张图片的方法
- (IBAction)perviou;
//声明后一张图片的方法
- (IBAction)next;

@end

@implementation ViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self next];

}

//懒加载:在使用该数据的时候再去加载
-(NSArray *)datas
{
    //先进行判断,只有数组为nil的时候才去加载
    if (_datas == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"imageData" ofType:@"plist"];
        
            _datas = [NSArray arrayWithContentsOfFile:path];

    }
    return _datas;
}





//-(void)viewDidLoad
//{
//    [super viewDidLoad];
//
//    //数据的封装
//    //对数据进行初始化
//    //NSBundle 是负责管理应用文件夹的
////    NSString * rootPath = [[NSBundle mainBundle]bundlePath];
////    NSLog(@"%@",rootPath);
//    //可以通过这种方法获得应用根目录下的绝对路径
//    
//    NSString *path = [[NSBundle mainBundle]pathForResource:@"imageData" ofType:@"plist"];
//    
//    _datas = [NSArray arrayWithContentsOfFile:path];
//    
//
////    //将数据初始化
////    NSDictionary *data1 = @{@"icon":@"biaoqingdi",@"desc":@"在他面前,其他神马表情都弱爆了!"};
////    
////    NSDictionary *data2 = @{@"icon":@"wangba",@"desc":@"哥们为什么选八号呢"};
////    
////    NSDictionary *data3 = @{@"icon":@"bingli",@"desc":@"这也忒狠了"};
////    
////    NSDictionary *data4 = @{@"icon":@"chiniupa",@"desc":@"这小姑娘吃个牛排比杀牛还费劲啊!"};
////    
////    NSDictionary *data5 = @{@"icon":@"danteng",@"desc":@"亲，你能改下你的网名么？哈哈!"};
////    
////    _datas = @[data1,data2,data3,data4,data5];
//    //解决第一张显示不正确的问题
//    [self next];
//    
//}



-(void)change
{
    //修改indexLabel
    self.indexLabel.text = [NSString stringWithFormat:@"%d/%zd",self.index,self.datas.count];
    
    //根据索引更改imageView的image属性文字和说明
    NSDictionary *data = self.datas[self.index-1];
    self.imageView.image = [UIImage imageNamed:data[@"icon"]];
    self.descLabel.text = data[@"desc"];
    
    //当索引不为1,向前的按钮就是可用的
    self.perviouBtn.enabled = (self.index != 1);
    //当索引部位5,向后的按钮就是可用的
    self.nextBtn.enabled = (self.index != 5);
    
}
- (IBAction)perviou
{
    //索引 +1
    self.index--;
    [self change];
    
}

- (IBAction)next
{
    //索引-1
    self.index++;
    [self change];
}



@end
