//
//  ViewController.m
//  tdv
//
//  Created by 杨 on 8/21/16.
//  Copyright © 2016 杨. All rights reserved.
//

#import "ViewController.h"

#import "XWCell.h"
#import "XWCellModel.h"
#import "XWDragCellCollectionView.h"

@interface ViewController ()<XWDragCellCollectionViewDataSource, XWDragCellCollectionViewDelegate>
@property (nonatomic, strong) NSArray *data;
@property (weak, nonatomic) IBOutlet XWDragCellCollectionView *collectionView;


@end

@implementation ViewController
- (IBAction)rightItemClick:(id)sender {
   [self.collectionView stopShake];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(60, 60);
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
   
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerClass:[XWCell class] forCellWithReuseIdentifier:@"cell"];
 
    self.collectionView.collectionViewLayout = layout;
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
 
}

- (NSArray *)data{
    if (!_data) {
        NSMutableArray *temp = @[].mutableCopy;
        
        for (int i = 0; i < 150; i ++) {
            
            NSString *str = [NSString stringWithFormat:@"%03d", i];
            XWCellModel *model = [XWCellModel new];
            model.backGroundColor = [UIColor colorWithRed:arc4random_uniform(255.5)/255.0 green:arc4random_uniform(255.5)/255.0 blue:arc4random_uniform(255.5)/255.0 alpha:1.0];
            model.title = str;
            [temp addObject:model];
        }
        _data = temp.copy;
    }
    return _data;
}




- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XWCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    XWCellModel *model = _data[indexPath.item];
    cell.lb.text =model.title;
    cell.lb.backgroundColor = model.backGroundColor;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *iD = @"cell";
    [collectionView dequeueReusableCellWithReuseIdentifier:iD forIndexPath:indexPath];
    
    NSLog(@"%@\n%@",indexPath,(( XWCellModel *)_data[indexPath.item]).title);
}

- (NSArray *)dataSourceArrayOfCollectionView:(XWDragCellCollectionView *)collectionView{
    return _data;
}

- (void)dragCellCollectionView:(XWDragCellCollectionView *)collectionView newDataArrayAfterMove:(NSArray *)newDataArray{
    _data = newDataArray;
}





-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.collectionView stopShake];
}


@end
