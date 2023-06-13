//
//  HDCustomButton.m
//  fffff
//
//  Created by m w on 2023/2/7.
//

#import "HDCustomButton.h"
#import "Masonry.h"

@implementation HDCustomButton


- (instancetype)initTitle:(NSString *)title
                imageName:(NSString *)imageName
                     font:(UIFont *)font
                    color:(UIColor *)color
                     type:(HDCustomButtonType)type
                    space:(double)space
                paddingLR:(double)paddingLR
                paddingTB:(double)paddingTB {
    
    if (self = [super init])
    {
        self.backgroundColor = [UIColor yellowColor];
        self.imgV.image = [UIImage imageNamed:imageName];
        self.titleLB.text = title;
        self.titleLB.textColor = color;
        self.titleLB.font = font;
        self.space = space;
        self.paddingLR = paddingLR;
        self.paddingTB = paddingTB;
        [self addSubview:self.imgV];
        [self addSubview:self.titleLB];
        [self makeConstraintsWithType:type];
        [self addClickGestureRecognizer];
    }
    return self;
}

- (void)makeConstraintsWithType:(HDCustomButtonType)type{
    
    switch (type) {
        case HDCustomButtonTypeTitleOnTheImageTop:
            [self titleOverTheImageTopConstraints];
            break;
        case HDCustomButtonTypeTitleOnTheImageBottom:
            [self titleBelowTheImageBottomConstraints];
            break;
        case HDCustomButtonTypeTitleOnTheImageLeft:
            [self titleOnTheImageLeftConstraints];
            break;
        case HDCustomButtonTypeTitleOnTheImageRight:
            [self titleOnTheImageRightConstraints];
            break;
        default:
            break;
    }
}

#pragma mark -- 文字在上，图片在下
- (void)titleOverTheImageTopConstraints {
    
    [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.paddingTB);
        make.left.mas_equalTo(self.paddingLR);
        make.right.mas_equalTo(-self.paddingLR);
    }];

    [self.imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLB.mas_bottom).offset(self.space);
        make.left.mas_equalTo(self.paddingLR);
        make.right.mas_equalTo(-self.paddingLR);
        make.bottom.mas_equalTo(-self.space);
    }];
}

#pragma mark -- 文字在下，图片在上
- (void)titleBelowTheImageBottomConstraints {
    
    [self.imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.paddingTB);
        make.left.mas_equalTo(self.paddingLR);
        make.right.mas_equalTo(-self.paddingLR);
    }];

    [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imgV.mas_bottom).offset(self.space);
        make.left.mas_equalTo(self.paddingLR);
        make.right.mas_equalTo(-self.paddingLR);
        make.bottom.mas_equalTo(-self.space);
    }];
}

#pragma mark -- 文字在左，图片在右
- (void)titleOnTheImageLeftConstraints {
    
    [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.paddingLR);
        make.top.mas_equalTo(self.paddingTB);
        make.bottom.mas_equalTo(-self.paddingTB);
    }];
    
    [self.imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.paddingTB);
        make.bottom.mas_equalTo(-self.paddingTB);
        make.left.mas_equalTo(self.titleLB.mas_right).offset(self.space);
        make.right.mas_equalTo(-self.paddingLR);
    }];
}

#pragma mark -- 文字在右，图片在左
- (void)titleOnTheImageRightConstraints {
    
    [self.imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.paddingTB);
        make.bottom.mas_equalTo(-self.paddingTB);
        make.left.mas_equalTo(self.paddingLR);
    }];

    [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.paddingTB);
        make.bottom.mas_equalTo(-self.paddingTB);
        make.left.mas_equalTo(self.imgV.mas_right).offset(self.space);
        make.right.mas_equalTo(-self.paddingLR);
    }];
}

- (void)addClickGestureRecognizer {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    [self addGestureRecognizer:tap];
}

- (void)click {
    if (_didClickBlock)
    {
        _didClickBlock();
    }
}

- (UIImageView *)imgV {
    if (_imgV == nil)
    {
        _imgV = [[UIImageView alloc] init];
        _imgV.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imgV;
}

- (UILabel *)titleLB {
    if (_titleLB == nil)
    {
        _titleLB = [[UILabel alloc] init];
        _titleLB.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLB;
}

@end
