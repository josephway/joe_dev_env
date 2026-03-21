#import <Cocoa/Cocoa.h>
#import <Carbon/Carbon.h>

void updateTmuxStatus(NSString *inputSource) {
    NSString *cursorColor;
    NSString *imLabel;
    NSString *statusLeft;

    if ([inputSource containsString:@"wetype"] || [inputSource containsString:@"pinyin"]) {
        // 中文输入法：深洋红 (colour126)
        cursorColor = @"colour126";
        imLabel = @"中";
        statusLeft = [NSString stringWithFormat:@"#[fg=colour126,bold]%@ #[fg=black,bold]Session: #S #[fg=white]#I #[fg=black]#P", imLabel];
    } else {
        // 英文输入法：布莱茵蓝 (colour33)
        cursorColor = @"colour33";
        imLabel = @"EN";
        statusLeft = [NSString stringWithFormat:@"#[fg=colour33,bold]%@ #[fg=black,bold]Session: #S #[fg=white]#I #[fg=black]#P", imLabel];
    }

    // 更新光标颜色
    NSString *cursorScript = [NSString stringWithFormat:@
        "tmux set-option -gw cursor-colour %@ 2>/dev/null", cursorColor];

    // 直接设置 status-left（带颜色）
    NSString *statusScript = [NSString stringWithFormat:@
        "tmux set-option -g status-left '%@' 2>/dev/null", statusLeft];

    // 强制刷新
    NSString *refreshScript = @"tmux refresh-client -S 2>/dev/null";

    system([cursorScript UTF8String]);
    system([statusScript UTF8String]);
    system([refreshScript UTF8String]);
}

NSString* getCurrentInputSource() {
    TISInputSourceRef source = TISCopyCurrentKeyboardInputSource();
    NSString *sourceID = (__bridge NSString *)TISGetInputSourceProperty(source, kTISPropertyInputSourceID);
    return sourceID ?: @"";
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 初始化时设置一次
        updateTmuxStatus(getCurrentInputSource());

        // 监听输入法切换
        [[NSDistributedNotificationCenter defaultCenter]
            addObserverForName:@"com.apple.Carbon.TISNotifySelectedKeyboardInputSourceChanged"
            object:nil queue:nil usingBlock:^(NSNotification *note) {
            updateTmuxStatus(getCurrentInputSource());
        }];

        NSLog(@"Tmux IM watcher started. Press Ctrl+C to stop.");
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
