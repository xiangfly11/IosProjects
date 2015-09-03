//
//  NewsConnection.m
//  MyAssistant
//
//  Created by Jiaxiang Li on 15/9/1.
//  Copyright © 2015年 Jiaxiang Li. All rights reserved.
//

#import "NewsConnection.h"

@implementation NewsConnection

-(void) connectData {
    
    NSString *urlStr = @"http://api.nytimes.com/svc/news/v3/content/nyt/world/24.json?limit=20&api-key=89cd7e0271d037f93a79dae804d76dda%3A10%3A72850940";
    
    NSURL *url = [NSURL URLWithString:urlStr];
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc]initWithURL:url] queue:[[NSOperationQueue alloc]init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError) {
            [self.delegate connectionFailedWithError:connectionError];
        }else{
            [self.delegate receiveNewsJSON:data];
        }
    }];
}



@end
