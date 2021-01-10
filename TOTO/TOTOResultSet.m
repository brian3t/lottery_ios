//
//  TOTOResultSet.m
//  TOTO
//
//  Created by Chanh Minh Vo on 23/6/14.
//  Copyright (c) 2014 USV Solutions. All rights reserved.
//
#import "TOTOResultSet.h"
NSString * const DrawNumber = @"draw_no";
NSString * const Id = @"id";
NSString * const ResultDate = @"draw_date";
NSString * const WinningNumbers = @"winning_nos";
NSString * const AdditionalWinningNumber = @"additional_winning_number";
NSString * const WinningGroups = @"winning_groups";
NSString * const group1amt = @"group1amt";
NSString * const group2amt = @"group2amt";
NSString * const group3amt = @"group3amt";
NSString * const group4amt = @"group4amt";
NSString * const group5amt = @"group5amt";
NSString * const group6amt = @"group6amt";
NSString * const group7amt = @"group7amt";
NSString * const group1shares = @"group1shares";
NSString * const group2shares = @"group2shares";
NSString * const group3shares = @"group3shares";
NSString * const group4shares = @"group4shares";
NSString * const group5shares = @"group5shares";
NSString * const group6shares = @"group6shares";
NSString * const group7shares = @"group7shares";

NSString * const ShareAmountFormat = @"$%.0f";
NSString * const JackpotDate = @"next_draw_date";
NSString * const JackpotAmount = @"next_jackpot";

NSString * const GroupTier = @"group_tier";
NSString * const Amount = @"amount";
NSString * const NumOfWinningShares = @"num_of_winning_shares";
NSString * const WinningBooths = @"winning_booths";
NSString * const group1booths = @"group1booths";
NSString * const group2booths = @"group2booths";

@implementation TOTOResultSet
@synthesize resultDate;
@synthesize winningNumbers;
@synthesize winningNumber1;
@synthesize winningNumber2;
@synthesize winningNumber3;
@synthesize winningNumber4;
@synthesize winningNumber5;
@synthesize winningNumber6;
@synthesize additionalWinningNumber;
@synthesize jackpotAmount;
@synthesize jackpotDate;

@synthesize winningPrizeGroups;
@synthesize winningLocationsGroup1;
@synthesize winningLocationsGroup2;

+ (TOTOResultSet *) initWithDictionary:(NSDictionary *)dict {
    if (dict == nil || dict.count <=0)
        return nil;
    
    TOTOResultSet *result = [[super alloc] init];
    result.winningPrizeGroups = nil;
    NSString *value;
    NSString *grp1amt, *grp1shares;
    NSString *grp2amt, *grp2shares;
    NSString *grp3amt, *grp3shares;
    NSString *grp4amt, *grp4shares;
    NSString *grp5amt, *grp5shares;
    NSString *grp6amt, *grp6shares;
    NSString *grp7amt, *grp7shares;
    for (NSString *key in dict)
    {
        if ([key isEqualToString:ResultDate]) {
            value = [dict objectForKey:key];
            NSDateFormatter *df = [[NSDateFormatter alloc] init];
            [df setDateFormat:@"yyyy-MM-dd"];
            result.resultDate = [df dateFromString: value];
        }
        else if ([key isEqualToString:WinningNumbers]) {
            value = [dict objectForKey:key];
            result.winningNumbers = [value componentsSeparatedByString:@" "];
        }
//        else if ([key isEqualToString:AdditionalWinningNumber]) {
//            value = [dict objectForKey:key];
//            result.additionalWinningNumber = [value intValue];
//        }
        else if ([key isEqualToString:JackpotAmount]) {
            value = [dict objectForKey:key];
            if (![value isKindOfClass:[NSNull class]])
                result.jackpotAmount = [value intValue];
        }
        else if ([key isEqualToString:JackpotDate]) {
            value = [dict objectForKey:key];
            if (![value isKindOfClass:[NSNull class]])
                result.jackpotDate = value;
        }
        else if ([key isEqualToString:group1booths]) {
            value = [dict objectForKey:key];
            result.winningLocationsGroup1 = value;
        }
        else if ([key isEqualToString:group2booths]) {
            value = [dict objectForKey:key];
            result.winningLocationsGroup2 = value;
        }
        else if ([key isEqualToString:group1amt]) {
            grp1amt = [dict objectForKey:key];
        }
        else if ([key isEqualToString:group1shares]) {
            grp1shares = [dict objectForKey:key];
        }
        else if ([key isEqualToString:group2amt]) {
            grp2amt = [dict objectForKey:key];
        }
        else if ([key isEqualToString:group2shares]) {
            grp2shares = [dict objectForKey:key];
        }
        else if ([key isEqualToString:group3amt]) {
            grp3amt = [dict objectForKey:key];
        }
        else if ([key isEqualToString:group3shares]) {
            grp3shares = [dict objectForKey:key];
        }
        else if ([key isEqualToString:group4amt]) {
            grp4amt = [dict objectForKey:key];
        }
        else if ([key isEqualToString:group4shares]) {
            grp4shares = [dict objectForKey:key];
        }
        else if ([key isEqualToString:group5amt]) {
            grp5amt = [dict objectForKey:key];
        }
        else if ([key isEqualToString:group5shares]) {
            grp5shares = [dict objectForKey:key];
        }
        else if ([key isEqualToString:group6amt]) {
            grp6amt = [dict objectForKey:key];
        }
        else if ([key isEqualToString:group6shares]) {
            grp6shares = [dict objectForKey:key];
        }
        else if ([key isEqualToString:group7amt]) {
            grp7amt = [dict objectForKey:key];
        }
        else if ([key isEqualToString:group7shares]) {
            grp7shares = [dict objectForKey:key];
        }
        
//        else if ([key isEqualToString:WinningGroups]) {
//            NSArray *winGroups = (NSArray *) [dict objectForKey:key];
//            if (winGroups != nil && winGroups.count > 0) {
//                NSMutableArray *test = [[NSMutableArray alloc] init];
//                for (NSDictionary *winGroup in winGroups) {
//                    NSString *tier = [winGroup objectForKey:GroupTier];
//                    NSString *shareAmount = [winGroup objectForKey:Amount];
//                    NSString *noOfWinningShares = [winGroup objectForKey:NumOfWinningShares];
//                    NSString *winningBooths = [winGroup objectForKey:WinningBooths];
//                    NSString *processedValue = [value isKindOfClass:[NSNull class]] ? @"" : winningBooths;
//                    [test addObject:[[WinningPrizeGroup alloc] initWithStringParameters:tier shareAmount:shareAmount numberOfWinningShares:noOfWinningShares winningBooths:processedValue]];
//                }
//                result.winningPrizeGroups = [test mutableCopy];
//            }
//        }
    }
    
    NSMutableArray *test = [[NSMutableArray alloc] init];
    [test addObject:[[WinningPrizeGroup alloc] initWithStringParameters:@"1" shareAmount:grp1amt numberOfWinningShares:grp1shares winningBooths:@""]];
    [test addObject:[[WinningPrizeGroup alloc] initWithStringParameters:@"2" shareAmount:grp2amt numberOfWinningShares:grp2shares winningBooths:@""]];
    [test addObject:[[WinningPrizeGroup alloc] initWithStringParameters:@"3" shareAmount:grp3amt numberOfWinningShares:grp3shares winningBooths:@""]];
    [test addObject:[[WinningPrizeGroup alloc] initWithStringParameters:@"4" shareAmount:grp4amt numberOfWinningShares:grp4shares winningBooths:@""]];
    [test addObject:[[WinningPrizeGroup alloc] initWithStringParameters:@"5" shareAmount:grp5amt numberOfWinningShares:grp5shares winningBooths:@""]];
    [test addObject:[[WinningPrizeGroup alloc] initWithStringParameters:@"6" shareAmount:grp6amt numberOfWinningShares:grp6shares winningBooths:@""]];
    [test addObject:[[WinningPrizeGroup alloc] initWithStringParameters:@"7" shareAmount:grp7amt numberOfWinningShares:grp7shares winningBooths:@""]];
    result.winningPrizeGroups = [test mutableCopy];
    return result;
}

- (NSString *)getResultDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString = [dateFormatter stringFromDate:self.resultDate];
    return dateString;
}

- (NSString *)getResultDateForDisplay {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd MMM yyyy (EEE)"];
    NSString *dateString = [dateFormatter stringFromDate:self.resultDate];
    return dateString;
}

- (NSString *)getWinningNumbersAsString {
    NSString *result = @"";
    for (int i=0; i<self.winningNumbers.count - 1; i++) {
        result = [result stringByAppendingString:[self.winningNumbers objectAtIndex:i]];
        result = [result stringByAppendingString:@" "];
    }
    result = [result stringByAppendingString:[self.winningNumbers objectAtIndex:5]];
    return result;
}

- (NSString *)getAdditionalNumbersAsString {
    NSString *result = [NSString stringWithFormat:@"%d", self.additionalWinningNumber];
    return result;
}

- (NSString *) getTotoResultAsStringForSms {
    NSString *result = [NSString stringWithFormat:@"Toto Result\r%@\r\rNumbers: %@\rAdditional: %@", [self getResultDate], [self getWinningNumbersAsString], [self getAdditionalNumbersAsString]];
    return result;
}

- (NSString *) getTotoResultAsStringForEmail {
    NSString *result = [NSString stringWithFormat:@"Draw Date: %@\n\r\n\rWinning Numbers: %@\n\rAdditional Number: %@", [self getResultDate], [self getWinningNumbersAsString], [self getAdditionalNumbersAsString]];
    return result;
}

+ (TOTOResultSet *)getResultAtUrl:(NSString *)url {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSError *jsonParsingError = nil;
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:&jsonParsingError];
    
    TOTOResultSet *temp = [[TOTOResultSet class] initWithDictionary:result];
    return temp;
}

+ (TOTOResultSet *)getLatestResult {
    NSString *url = @"http://localhost/api/web/v1/results/latest";
    return [[TOTOResultSet class] getResultAtUrl:url];
}

- (TOTOResultSet *)getPreviousResult {
    NSString *url = @"http://localhost/api/web/v1/results/previous?date=";
    url = [url stringByAppendingString:[self getResultDate]];
    return [[TOTOResultSet class] getResultAtUrl:url];
}

- (TOTOResultSet *)getNextResult {
    //NSString *url = @"http://motailor.com/lottery/totoResult/getNext/date/";
    NSString *url = @"http://localhost/api/web/v1/results/next?date=";
    url = [url stringByAppendingString:[self getResultDate]];
    return [[TOTOResultSet class] getResultAtUrl:url];
}

+ (TOTOResultSet *)getResultForDate:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    //NSString *url = @"http://motailor.com/lottery/totoResult/get/date/";
    NSString *url = @"http://localhost/api/web/v1/results/one?date=";
    url = [url stringByAppendingString:dateString];
    return [[TOTOResultSet class] getResultAtUrl:url];
}

@end

@implementation WinningPrizeGroup
@synthesize prizeGroup;
@synthesize numberOfWinningShares;
@synthesize shareAmount;
@synthesize winningBooths;

- (id)initWithPrizeGroup:(int)thePrizeGroup
             shareAmount:(double)theAmount
   numberOfWinningShares:(int)theShares
           winningBooths:(NSString *)theWinningBooths;

{
    self.prizeGroup = thePrizeGroup;
    self.shareAmount = theAmount;
    self.numberOfWinningShares = theShares;
    self.winningBooths = theWinningBooths;
    
    return self;
}

- (id)initWithStringParameters:(NSString *)thePrizeGroup
             shareAmount:(NSString *)amount
   numberOfWinningShares:(NSString *)shares
        winningBooths:(NSString *)theWinningBooths
{
    self.prizeGroup = [thePrizeGroup intValue];
    self.shareAmount = [amount doubleValue];
    self.numberOfWinningShares = (shares != nil && ![shares isKindOfClass:[NSNull class]]) ? [shares intValue] : 0;
    self.winningBooths = theWinningBooths;
    
    return self;
}
@end

@implementation WinningLocation
@synthesize prizeGroup;
@synthesize location;
@end

