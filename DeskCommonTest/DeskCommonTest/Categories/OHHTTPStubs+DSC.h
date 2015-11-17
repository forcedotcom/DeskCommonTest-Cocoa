//
//  OHHTTPStubs+DSC.h
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

#import "OHHTTPStubs.h"

typedef NS_ENUM(NSUInteger, DSCMatchType) {
    DSCMatchTypeContains,
    DSCMatchTypeHasSuffix
};

@interface OHHTTPStubs (DSC)

+ (void)stubResponseFromFixtureName:(NSString *)fixtureName
                     withStatusCode:(NSInteger)statusCode;

+ (void)stubResponseFromFixtureName:(NSString *)fixtureName
                     withStatusCode:(NSInteger)statusCode
                             andTag:(NSString *)tag;

+ (void)stubResponseFromFixtureName:(NSString *)fixtureName
                     withStatusCode:(NSInteger)statusCode
                             andTag:(NSString *)tag
                   withTagMatchType:(DSCMatchType)tagMatchType;

+ (void)stubResponseFromFixtureName:(NSString *)fixtureName
                     withStatusCode:(NSInteger)statusCode
                        andHTTPVerb:(NSString *)httpVerb;

+ (void)stubResponseFromFixtureName:(NSString *)fixtureName
                     withStatusCode:(NSInteger)statusCode
                             andTag:(NSString *)tag
                        andHTTPVerb:(NSString *)httpVerb;

+ (void)stubResponseFromFixtureName:(NSString *)fixtureName
                     withStatusCode:(NSInteger)statusCode
                             andTag:(NSString *)tag
                   withTagMatchType:(DSCMatchType)tagMatchType
                        andHTTPVerb:(NSString *)httpVerb;

+ (void)stubOkResponseFromFixtureName:(NSString *)fixtureName;

+ (void)stubCreatedResponseFromFixtureName:(NSString *)fixtureName;

+ (void)tearDownResponseStubs;

+ (void)setFixturesBundle:(NSBundle *)bundle;

@end
