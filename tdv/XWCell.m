
//
//  XWCell.m
//  PanCollectionView
//
//  Created by YouLoft_MacMini on 16/1/4.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "XWCell.h"
#import "XWCellModel.h"

@interface XWCell ()


@end

@implementation XWCell


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *lb = [[UILabel alloc]initWithFrame:self.bounds];
        
        [self addSubview:lb];
        self.lb = lb;
    }
    return self;
}



@end
