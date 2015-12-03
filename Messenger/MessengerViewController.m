//
//  ViewController.m
//  Messenger
//
//  Created by Hứ Ta Khinh on 11/27/15.
//  Copyright © 2015 Hứ Ta Khinh. All rights reserved.
//

#import "MessengerViewController.h"

@implementation MessengerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [DATACENTER setMessengerViewController:self];
    
    [self.messengerWebView setFrameLoadDelegate:self];
    [self.messengerWebView setPolicyDelegate:self];
    [self.indicator startAnimation:self];
    
    [self openURL:[NSURL URLWithString:DEFAULT_URL]];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void)openURL:(NSURL *)url {
    if (!url || [[url absoluteString] isEqualToString:@""]) {
        return;
    }
    self.defaultURLRequest =[NSURLRequest requestWithURL:url];
    [[self.messengerWebView mainFrame] loadRequest:self.defaultURLRequest];
}

- (void)reload {
    [self.indicator startAnimation:self];
    [self.messengerWebView reload:self];
}
#pragma mark WebFrameLoadDelegate

- (void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame {
    [self.indicator stopAnimation:self];
}

#pragma mark WebScripting protocol

/* checks whether a selector is acceptable to be called from JavaScript */
+ (BOOL)isSelectorExcludedFromWebScript:(SEL) selector {
    return YES;
}

// right now exclude all properties (eg keys)
+ (BOOL)isKeyExcludedFromWebScript:(const char*) name {
    return YES;
}

#pragma mark WebPolicyDelegate

- (void)webView:(WebView*) sender decidePolicyForNavigationAction:(NSDictionary*) actionInformation request:(NSURLRequest*) request frame:(WebFrame*) frame decisionListener:(id <WebPolicyDecisionListener>) listener {
    NSString *url = [[request URL] absoluteString];
    NSString *urlHost = [[request URL] host];
    
    if ([urlHost isEqualToString:MESSENGER_HOST]) {
        if ([url containsString:MESSENGER_BUSINESS_URL] ||
            [url containsString:MESSENGER_PLATFORM_URL] ||
            [url containsString:MESSENGER_FEATURES_URL]) {
            [listener ignore];
        } else {
            [listener use];
        }
    } else if ([urlHost isEqualToString:FACEBOOK_HOST] ) {
        if ([url containsString:MESSENGER_HOST]) {
            [listener use];
        } else {
            [listener ignore];
        }
    } else if ([url containsString:FACEBOOK_RESOURCE_HOST_1] ||
               [url containsString:FACEBOOK_RESOURCE_HOST_2] ||
               [url containsString:FACEBOOK_RESOURCE_HOST_3]) {
        [listener ignore];
        [[NSWorkspace sharedWorkspace] openURL:[request URL]];
    } else {
        [listener ignore];
    }
}

- (void)webView:(WebView *)webView decidePolicyForNewWindowAction:(NSDictionary *)actionInformation request:(NSURLRequest *)request newFrameName:(NSString *)frameName decisionListener:(id<WebPolicyDecisionListener>)listener {
    [listener ignore];
}

#pragma mark WebViewDelegate

- (BOOL) webView:(WebView*) sender runBeforeUnloadConfirmPanelWithMessage:(NSString*) message initiatedByFrame:(WebFrame*) frame {
    return [self webView:sender runJavaScriptConfirmPanelWithMessage:message initiatedByFrame:frame];
}

- (void)webView:(WebView*) sender runOpenPanelForFileButtonWithResultListener:(id <WebOpenPanelResultListener>) resultListener allowMultipleFiles:(BOOL) allowMultipleFiles {
    NSOpenPanel* openPanel = [NSOpenPanel openPanel];
    
    [openPanel setCanChooseFiles:YES];
    [openPanel setAllowsMultipleSelection:allowMultipleFiles];
    [openPanel setCanChooseDirectories:YES];
    
    if ([openPanel runModal] == NSModalResponseOK) {
        [resultListener chooseFilenames:[[openPanel URLs] valueForKey:@"relativePath"]];
    }
}

- (void)webView:(WebView*) sender runOpenPanelForFileButtonWithResultListener:(id <WebOpenPanelResultListener>) resultListener {
    [self webView:sender runOpenPanelForFileButtonWithResultListener:resultListener allowMultipleFiles:YES];
}

- (void) webView:(WebView*) sender runJavaScriptAlertPanelWithMessage:(NSString*) message initiatedByFrame:(WebFrame*) frame {
    NSAlert* alert = [[NSAlert alloc] init];
    [alert addButtonWithTitle:NSLocalizedString(@"OK", @"")];
    [alert setMessageText:message];
    
    [alert runModal];
}

- (BOOL)webView:(WebView*) sender runJavaScriptConfirmPanelWithMessage:(NSString*) message initiatedByFrame:(WebFrame*) frame {
    NSAlert* alert = [[NSAlert alloc] init];
    [alert addButtonWithTitle:NSLocalizedString(@"OK", @"")];
    [alert addButtonWithTitle:NSLocalizedString(@"Cancel", @"")];
    [alert setMessageText:message];
    
    return ([alert runModal] == NSAlertFirstButtonReturn);
}

- (NSString*)webView:(WebView*) sender runJavaScriptTextInputPanelWithPrompt:(NSString*) prompt defaultText:(NSString*) defaultText initiatedByFrame:(WebFrame*) frame {
    NSAlert *alert = [[NSAlert alloc] init];
    [alert addButtonWithTitle:NSLocalizedString(@"OK", @"")];
    [alert addButtonWithTitle:NSLocalizedString(@"Cancel", @"")];
    [alert setMessageText:prompt];
    NSTextField* input = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 300, 24)];
    [input setStringValue:defaultText];
    [alert setAccessoryView:input];
    
    NSInteger button = [alert runModal];
    if (button == NSAlertFirstButtonReturn) {
        [input validateEditing];
        return [input stringValue];
    }
    
    return nil;
}

#pragma mark WebEditingDelegate

- (NSArray *)webView:(WebView *)sender contextMenuItemsForElement:(NSDictionary *)element
    defaultMenuItems:(NSArray *)defaultMenuItems
{
    // disable right-click context menu
    return nil;
}

//- (BOOL)webView:(WebView *)webView shouldChangeSelectedDOMRange:(DOMRange *)currentRange
//     toDOMRange:(DOMRange *)proposedRange
//       affinity:(NSSelectionAffinity)selectionAffinity
// stillSelecting:(BOOL)flag
//{
//    // disable text selection
//    return NO;
//}

@end
