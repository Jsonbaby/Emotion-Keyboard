//
//  HMEmotionKeyboard.m
//  黑马微博
//
//  Created by apple on 14-7-15.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMEmotionKeyboard.h"
#import "HMEmotionListView.h"
#import "HMEmotionToolbar.h"

#import "HMEmotionTool.h"

@interface HMEmotionKeyboard() <HMEmotionToolbarDelegate>
/** 表情列表 */
@property (nonatomic, weak) HMEmotionListView *listView;
/** 表情工具条 */
@property (nonatomic, weak) HMEmotionToolbar *toollbar;
@end

@implementation HMEmotionKeyboard

+ (instancetype)keyboard
{
    return [[self alloc] init];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"emoticon_keyboard_background"]];
        
        // 1.添加表情列表
        HMEmotionListView *listView = [[HMEmotionListView alloc] init];
        [self addSubview:listView];
        self.listView = listView;
        self.listView.emotions = [HMEmotionTool emojiEmotions];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
   
    
    // 2.设置表情列表的frame
    self.listView.width = self.width;
    self.listView.height = self.height;
}

#pragma mark - HMEmotionToolbarDelegate
- (void)emotionToolbar:(HMEmotionToolbar *)toolbar didSelectedButton:(HMEmotionType)emotionType
{
    switch (emotionType) {
        case HMEmotionTypeDefault:// 默认
            self.listView.emotions = [HMEmotionTool defaultEmotions];
            break;
            
        case HMEmotionTypeEmoji: // Emoji
            self.listView.emotions = [HMEmotionTool emojiEmotions];
            break;
            
        case HMEmotionTypeLxh: // 浪小花
            self.listView.emotions = [HMEmotionTool lxhEmotions];
            break;
            
        case HMEmotionTypeRecent: // 最近
            self.listView.emotions = [HMEmotionTool recentEmotions];
            break;
    }
}
@end
