//
//  HDCustomButton.h
//  fffff
//
//  Created by m w on 2023/2/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, HDCustomButtonType) {
    
    HDCustomButtonTypeTitleOnTheImageTop       = 0,//文字在上，图片在下
    HDCustomButtonTypeTitleOnTheImageBottom    = 1,//文字在下，图片在上
    HDCustomButtonTypeTitleOnTheImageLeft      = 2,//文字在左，图片在右
    HDCustomButtonTypeTitleOnTheImageRight     = 3,//文字在右，图片在左
};

@interface HDCustomButton : UIView

@property (nonatomic, strong) UIImageView *imgV;

@property (nonatomic, strong) UILabel *titleLB;

@property (nonatomic, assign) double space;//图文间距

@property (nonatomic, assign) double paddingLR;//图文到父视图左右间距

@property (nonatomic, assign) double paddingTB;//图文到父视图上下间距

@property (nonatomic, copy) void(^didClickBlock)(void);//点击事件回调

- (instancetype)initTitle:(NSString *)title
                imageName:(NSString *)imageName
                     font:(UIFont *)font
                    color:(UIColor *)color
                     type:(HDCustomButtonType)type
                    space:(double)space
                paddingLR:(double)paddingLR
                paddingTB:(double)paddingTB;

@end

NS_ASSUME_NONNULL_END
