//
//  String.m
//  Created by Devin on 7/18/12.
//
/*
 
 tapku || https://github.com/devinross/tapkulibrary
 
 Permission is hereby granted, free of charge, to any person
 obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without
 restriction, including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the
 Software is furnished to do so, subject to the following
 conditions:
 
 The above copyright notice and this permission notice shall be
 included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import "NSStringTests.h"

@implementation NSStringTests


- (void) testEmail{
    
	STAssertFalse(nil, @"POCKET");
    STAssertTrue([@"bob@sanders.com" isEmail], @"Expected to be a valid email");
    STAssertTrue([@"ao123sda.b2132Ob@sAND123123dsadrs.c" isEmail], @"Expected to be a valid email");
    
    STAssertFalse([@"ao,sda.bOb@sANDdsadrs.c" isEmail], @"Expected to be an invalid email");
    STAssertFalse([@"" isEmail], @"Expected to be an invalid email");
    STAssertFalse([@"@b.d" isEmail], @"Expected to be an invalid email");
    
}

- (void) testMD5Sum{
	STAssertEqualObjects([@"password" md5sum], @"5f4dcc3b5aa765d61d8327deb882cf99", nil);
	STAssertEqualObjects([@"devin" md5sum], @"11ef1590a74e1ab26c31a4e13f52d71b", nil);
}


- (void) testURLEncode{
	STAssertEqualObjects([@"Bob Sanders" URLEncode], @"Bob%20Sanders", nil);
	STAssertEqualObjects([@"\"Aardvarks lurk, OK?\"" URLEncode], @"%22Aardvarks%20lurk%2C%20OK%3F%22", nil);
}

- (void) testURLDecode {
    NSString * originalString = @"?test ;";
    NSString* encoded = [originalString URLEncode];

    STAssertEqualObjects(@"%3Ftest%20%3B", encoded, @"encode should work");
    STAssertEqualObjects(originalString, [encoded URLDecode], @"decode should work");
}


- (void) testHasString{
	
	STAssertTrue([@"Bob Sanders" hasString:@"Sanders"], nil);
	
	STAssertFalse([@"Bob Sanders" hasString:@"SANDERS"], nil);
	STAssertFalse([@"Bob Sanders" hasString:@"Cooper"], nil);
	
}

- (void) testPhoneString{
		
	NSString *output = [@"2345678901" formattedPhoneNumberWithLastCharacterRemoved:NO];
	STAssertEqualObjects(output, @"(234) 567-8901", nil);
	
	output = [@"12345678901" formattedPhoneNumberWithLastCharacterRemoved:NO];
	STAssertEqualObjects(output, @"1 (234) 567-8901", nil);
	
	output = [@"123456789012" formattedPhoneNumberWithLastCharacterRemoved:NO];
	STAssertEqualObjects(output, @"123456789012", nil);
	
	output = [@"123" formattedPhoneNumberWithLastCharacterRemoved:NO];
	STAssertEqualObjects(output, @"1 (23)", nil);
	
	output = [@"1234" formattedPhoneNumberWithLastCharacterRemoved:NO];
	STAssertEqualObjects(output, @"1 (234)", nil);
	
	output = [@"12345" formattedPhoneNumberWithLastCharacterRemoved:NO];
	STAssertEqualObjects(output, @"1 (234) 5", nil);
	
	output = [@"12345678" formattedPhoneNumberWithLastCharacterRemoved:NO];
	STAssertEqualObjects(output, @"1 (234) 567-8", nil);
	
	output = [@"529112345678912" formattedPhoneNumberWithLastCharacterRemoved:NO];
	STAssertEqualObjects(output, @"529112345678912", nil);

}


@end