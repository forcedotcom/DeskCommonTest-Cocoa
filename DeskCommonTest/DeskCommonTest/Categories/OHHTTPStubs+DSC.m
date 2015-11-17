//
//  OHHTTPStubs+DSC.m
//  Desk
//
//  Created by Desk.com on 12/18/14.
//  Copyright (c) 2015, Salesforce.com, Inc.
//  All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without modification, are permitted provided
//  that the following conditions are met:
//
//     Redistributions of source code must retain the above copyright notice, this list of conditions and the
//     following disclaimer.
//
//     Redistributions in binary form must reproduce the above copyright notice, this list of conditions and
//     the following disclaimer in the documentation and/or other materials provided with the distribution.
//
//     Neither the name of Salesforce.com, Inc. nor the names of its contributors may be used to endorse or
//     promote products derived from this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED
//  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
//  PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
//  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
//  TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
//  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
//  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
//  POSSIBILITY OF SUCH DAMAGE.
//

#import "OHHTTPStubs+DSC.h"
#import <DeskCommon/DeskCommon.h>

@implementation OHHTTPStubs (DSC)

+ (void)stubResponseFromFixtureName:(NSString *)fixtureName withStatusCode:(NSInteger)statusCode
{
    [self stubResponseFromFixtureName:fixtureName
                       withStatusCode:statusCode
                               andTag:nil
                          andHTTPVerb:nil];
}

+ (void)stubResponseFromFixtureName:(NSString *)fixtureName
                     withStatusCode:(NSInteger)statusCode
                             andTag:(NSString *)tag
{
    [self stubResponseFromFixtureName:fixtureName
                       withStatusCode:statusCode
                               andTag:tag
                          andHTTPVerb:nil];
}

+ (void)stubResponseFromFixtureName:(NSString *)fixtureName
                     withStatusCode:(NSInteger)statusCode
                             andTag:(NSString *)tag
                   withTagMatchType:(DSCMatchType)tagMatchType
{
    [self stubResponseFromFixtureName:fixtureName
                       withStatusCode:statusCode
                               andTag:tag
                     withTagMatchType:tagMatchType
                          andHTTPVerb:nil];
}

+ (void)stubResponseFromFixtureName:(NSString *)fixtureName
                     withStatusCode:(NSInteger)statusCode
                        andHTTPVerb:(NSString *)httpVerb
{
    [self stubResponseFromFixtureName:fixtureName
                       withStatusCode:statusCode
                               andTag:nil
                          andHTTPVerb:httpVerb];
}

+ (void)stubResponseFromFixtureName:(NSString *)fixtureName
                     withStatusCode:(NSInteger)statusCode
                             andTag:(NSString *)tag
                        andHTTPVerb:(NSString *)httpVerb
{
    [self stubResponseFromFixtureName:fixtureName
                       withStatusCode:statusCode
                               andTag:tag
                     withTagMatchType:DSCMatchTypeContains
                          andHTTPVerb:httpVerb];
}

+ (void)stubResponseFromFixtureName:(NSString *)fixtureName
                     withStatusCode:(NSInteger)statusCode
                             andTag:(NSString *)tag
                   withTagMatchType:(DSCMatchType)tagMatchType
                        andHTTPVerb:(NSString *)httpVerb
{
    NSDictionary *responseHeaders = @{@"Content-Type":@"text/json"};
    NSString *filePath = [self findResourcePathForFixtureName:fixtureName];
    
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        NSString *url = request.URL.absoluteString;
        BOOL tagMatches = YES;
        BOOL verbMatches = YES;
        
        if ([tag isPresent]) {
            switch (tagMatchType) {
                case DSCMatchTypeHasSuffix:
                    tagMatches = ([url hasSuffix:tag]);
                    break;
                default:
                    tagMatches = ([url rangeOfString:tag].location != NSNotFound);
                    break;
            }
        }
        
        if ([httpVerb isPresent]) {
            verbMatches = [request.HTTPMethod isEqualToString:httpVerb];
        }
        
        return tagMatches && verbMatches;
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [OHHTTPStubsResponse responseWithFileAtPath:filePath
                                                statusCode:(int)statusCode
                                                   headers:responseHeaders];
    }];
}

+ (void)stubOkResponseFromFixtureName:(NSString *)fixtureName
{
    [self stubResponseFromFixtureName:fixtureName withStatusCode:DSC_HTTP_STATUS_OK];
}

+ (void)stubCreatedResponseFromFixtureName:(NSString *)fixtureName
{
    [self stubResponseFromFixtureName:fixtureName withStatusCode:DSC_HTTP_STATUS_CREATED];
}

+ (void)tearDownResponseStubs
{
    [OHHTTPStubs removeAllStubs];
}

static NSBundle *fixturesBundle = nil;

+ (void)setFixturesBundle:(NSBundle *)bundle
{
    fixturesBundle = bundle;
}

#pragma mark - Private
+ (NSString *)findResourcePathForFixtureName:(NSString *)fixtureName
{
    if (fixturesBundle)
    {
        return [fixturesBundle pathForResource:fixtureName ofType:@"json"];
    }
    else
    {
        NSArray *bundles = [NSBundle allBundles];
        for (NSBundle *bundle in bundles)
        {
            NSString *resourcePath = [bundle pathForResource:fixtureName ofType:@"json"];
            if (resourcePath)
            {
                return resourcePath;
            }
        }
    }
    return nil;
}

@end

