//
//  HDCustomTextField.h
//  fffff
//
//  Created by m w on 2023/3/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HDCustomTextField : UITextField

//如果设置了正则属性 优先使用正则
@property (nonatomic, copy) NSString *pattern;//正则


- (void)textFieldWithFormat:(NSString *)format charactersInString:(NSString *)charactersInString maxLimit:(NSInteger)maxLimit;

@end

NS_ASSUME_NONNULL_END
//