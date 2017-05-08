//
//  ViewController.m
//  TelBook
//
//  Created by Apple on 15/10/9.
//  Copyright (c) 2015年 zf. All rights reserved.
//
#define kColor(r,g,b,a) [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:a]
#define kImageName(name) [UIImage imageNamed:name]

#import "ViewController.h"

@interface ViewController ()
{
    UISearchBar *searchbar;
}
@end

@implementation ViewController
@synthesize array_cell,array,table;
- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view=[[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIView *view1=[[UIView alloc] initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, 60)];
    //view1.backgroundColor=[UIColor orangeColor];
    searchbar=[[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    self.table=[[UITableView alloc] initWithFrame:CGRectMake(0, view1.frame.origin.y+view1.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-90) style:UITableViewStylePlain];
    searchbar.showsCancelButton=YES;
    [self.view addSubview:view1];
    //searchbar.prompt=@"zhang"; UIsearchbar 上面的标题
    [self setSearchBarStyle];
    [view1 addSubview:searchbar];
    self.table.delegate=self;
    self.table.dataSource=self;
    searchbar.delegate = self;
    
    [self InitArray];
    //[self.view addSubview:searchbar];
    [self.view addSubview:table];
    
    //[self hanziTopinyin];
}

- (void)setSearchBarStyle {
    
    
    NSArray *subviews = nil;
    
    subviews = [[searchbar.subviews objectAtIndex:0] subviews];
    
   
    for (UIView *view in subviews) {
        if ([view isKindOfClass:[UITextField class]]) {
            UITextField *textFeild = (UITextField *)view;
            textFeild.font = [UIFont systemFontOfSize:14.f];
            textFeild.enablesReturnKeyAutomatically = NO;
           
            textFeild.backgroundColor = kColor(233, 91, 38, 1);
            textFeild.layer.cornerRadius = 4;
            textFeild.layer.masksToBounds = YES;
            textFeild.textColor = [UIColor whiteColor];
                
            
        }
        else {
            if ([view isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
                [view removeFromSuperview];
            }
        }
    }
}

-(NSMutableString *)hanziTopinyin:(NSString *)hanziText

{
    //NSString *hanziText = @"我是中国人";
    if ([hanziText length]) {
        NSMutableString *ms = [[NSMutableString alloc] initWithString:hanziText];
        if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformMandarinLatin, NO)) {
            NSLog(@"pinyin: %@", ms);
        }
        if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformStripDiacritics, NO)) {
            NSLog(@"pinyin: %@", ms);
        }
        return ms;
    }
    return nil;
}
-(void)InitArray
{
    
    self.array=[[NSMutableArray alloc] initWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z", nil];
    //self.array=(NSMutableArray*)@[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
    
    
    self.array_cell=[[NSMutableArray alloc] initWithObjects:@"Auy",@"Bdrrtt",@"成正",@"Dgj",@"Eht",@"Fjyj",@"Gfb",@"Hukuk",@"Iasd",@"Jvc",@"Ksdv",@"Lw",@"Mfn",@"Nqreg",@"Oeytj",@"PF",@"QTB",@"Rfgsd",@"Sfdgf",@"Tfdbgd",@"Ufdg",@"Vdfg",@"Wdfg",@"Xdfg",@"Ydfb",@"张", nil];
    //self.array_cell=(NSMutableArray*)@[@"Auy",@"Bdf",@"Cfh",@"Dgj",@"Eht",@"Fjyj",@"Gfb",@"Hukuk",@"Iasd",@"Jvc",@"Ksdv",@"Lw",@"Mfn",@"Nqreg",@"Oeytj",@"PF",@"QTB",@"Rfgsd",@"Sfdgf",@"Tfdbgd",@"Ufdg",@"Vdfg",@"Wdfg",@"Xdfg",@"Ydfb",@"Zdfg"];
    
   
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [array count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
{
    return [array objectAtIndex:section];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}   
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *value=[array_cell objectAtIndex:indexPath.section];
    
    static NSString *str=@"cellID";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    cell.textLabel.text=value;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
//设置tableview右边的竖向搜索栏(搜索栏通过section自动索引)
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return array;
}

- (NSInteger)tableView:(UITableView *)tableView
  sectionForSectionIndexTitle:(NSString *)title
               atIndex:(NSInteger)index
{
    NSString *key = [array_cell objectAtIndex:index];
    if (key == UITableViewIndexSearch)
    {
        [tableView setContentOffset:CGPointZero animated:NO];
        return NSNotFound;
    }
    else return index;

}

//筛选搜索结果
- (void)handleSearchForTerm:(NSString *)searchTerm
{
   
    [self InitArray];
    
    NSMutableArray *toRemoveValue = [[NSMutableArray alloc] init];
    NSMutableArray *toRemoveKey = [[NSMutableArray alloc] init];
    for (NSString *name in array_cell) {
        //把汉字转换成拼音(若是字母保持不变)
        NSMutableString *pinyin_name=[self hanziTopinyin:name];
        
        if ([pinyin_name rangeOfString:searchTerm
                        options:NSCaseInsensitiveSearch].location == NSNotFound){
            [toRemoveValue addObject:name];
            //把不符合搜索要求的放入将要删除的数组
            NSInteger num=[array_cell indexOfObject:name];
            [toRemoveKey addObject:[array objectAtIndex:num]];
            
        }
    
    }
   
    [self.array_cell removeObjectsInArray:toRemoveValue];
    [self.array removeObjectsInArray:toRemoveKey];
    [table reloadData];
}
#pragma mark -
#pragma mark Search Bar Delegate Methods

//按回车键或则按键盘上的搜索键
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *searchTerm = [searchBar text];
    [self handleSearchForTerm:searchTerm];
}
//开始点击搜索框的时候
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [table reloadData];
}
//当搜索框内的内容改变时
- (void)searchBar:(UISearchBar *)searchBar
    textDidChange:(NSString *)searchTerm
{
    if ([searchTerm length] == 0)
    {
        [self InitArray];
        [table reloadData];
        return;
    }
    
    [self handleSearchForTerm:searchTerm];
    
}

//按键盘上的取消键时
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self InitArray];
    [table reloadData];
    searchBar.text=nil;
    [searchBar resignFirstResponder];
}

//只要触摸其他地方就退出密码输入键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self InitArray];
    [table reloadData];
    [searchbar resignFirstResponder];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
