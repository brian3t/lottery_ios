//
//  TOTOResultVC.m
//  TOTO
//
//  Created by Chanh Minh Vo on 26/6/14.
//  Copyright (c) 2014 USV Solutions. All rights reserved.
//

#import "TOTOResultVC.h"
#import "WinningBoothsVC.h"
#import "Utilities.h"

@interface TOTOResultVC ()
@property (weak, nonatomic) IBOutlet UILabel *winningNumbers;
@property (weak, nonatomic) IBOutlet UILabel *additionalWinningNumber;
@property (weak, nonatomic) IBOutlet UILabel *shareAmount1;
@property (weak, nonatomic) IBOutlet UILabel *shareAmount2;
@property (weak, nonatomic) IBOutlet UILabel *shareAmount3;
@property (weak, nonatomic) IBOutlet UILabel *shareAmount4;
@property (weak, nonatomic) IBOutlet UILabel *shareAmount5;
@property (weak, nonatomic) IBOutlet UILabel *shareAmount6;
@property (weak, nonatomic) IBOutlet UILabel *shareAmount7;
@property (weak, nonatomic) IBOutlet UILabel *noOfShares1;
@property (weak, nonatomic) IBOutlet UILabel *noOfShares2;
@property (weak, nonatomic) IBOutlet UILabel *noOfShares3;
@property (weak, nonatomic) IBOutlet UILabel *noOfShares4;
@property (weak, nonatomic) IBOutlet UILabel *noOfShares5;
@property (weak, nonatomic) IBOutlet UILabel *noOfShares6;
@property (weak, nonatomic) IBOutlet UILabel *noOfShares7;
@property (weak, nonatomic) IBOutlet UINavigationItem *toolbar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refreshBarButtonItem;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *indicator;

- (IBAction)showActionSheet:(id)sender;
- (void)rightSwipeHandle:(UISwipeGestureRecognizer*)gestureRecognizer;
- (void)leftSwipeHandle:(UISwipeGestureRecognizer*)gestureRecognizer;
@end

@implementation TOTOResultVC

@synthesize winningNumbers;
@synthesize additionalWinningNumber;
@synthesize toolbar;
@synthesize indicator;
@synthesize resultSet = _resultSet;
@synthesize actionItem = _actionItem;

- (TOTOResultSet *)resultSet {
    return _resultSet;
}

- (void) setResultSet:(TOTOResultSet *)resultSet {
    _resultSet = resultSet;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    if (self.resultSet != nil) {
        [self updateUI];
    }
}

- (void)showWinningGroup:(int)groupNumber forShareAmountLabel:(UILabel *)shareAmountLabel forWinningSharesLabel:(UILabel *)winningSharesLabel {
    @try {
        WinningPrizeGroup *prizeGroup = [self.resultSet.winningPrizeGroups objectAtIndex:(groupNumber-1)];
        if (prizeGroup != nil && prizeGroup.shareAmount > 0) {
            shareAmountLabel.text = [NSString localizedStringWithFormat:ShareAmountFormat, prizeGroup.shareAmount];
            winningSharesLabel.text = [NSString stringWithFormat:@"%d", prizeGroup.numberOfWinningShares];
        }
        else {
            shareAmountLabel.text = @"-";
            winningSharesLabel.text = @"-";        
        }
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        shareAmountLabel.text = @"-";
        winningSharesLabel.text = @"-";
    }
    @finally {
    }
}
- (void)updateUI{
    NSString *temp = @"";
    for (int i=0; i<self.resultSet.winningNumbers.count - 2; i++) {
        temp = [temp stringByAppendingString:[self.resultSet.winningNumbers objectAtIndex:i]];
        temp = [temp stringByAppendingString:@"   "];
    }
    temp = [temp stringByAppendingString:[self.resultSet.winningNumbers objectAtIndex:5]];
    
    self.navigationItem.title = [self.resultSet getResultDateForDisplay];
    self.winningNumbers.text = temp;
    //self.additionalWinningNumber.text = [NSString stringWithFormat:@"%d", self.resultSet.additionalWinningNumber];
    self.additionalWinningNumber.text = [self.resultSet.winningNumbers objectAtIndex:6];

    [self showWinningGroup:1 forShareAmountLabel:self.shareAmount1 forWinningSharesLabel:self.noOfShares1];
    [self showWinningGroup:2 forShareAmountLabel:self.shareAmount2 forWinningSharesLabel:self.noOfShares2];
    [self showWinningGroup:3 forShareAmountLabel:self.shareAmount3 forWinningSharesLabel:self.noOfShares3];
    [self showWinningGroup:4 forShareAmountLabel:self.shareAmount4 forWinningSharesLabel:self.noOfShares4];
    [self showWinningGroup:5 forShareAmountLabel:self.shareAmount5 forWinningSharesLabel:self.noOfShares5];
    [self showWinningGroup:6 forShareAmountLabel:self.shareAmount6 forWinningSharesLabel:self.noOfShares6];
    [self showWinningGroup:7 forShareAmountLabel:self.shareAmount7 forWinningSharesLabel:self.noOfShares7];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowWinningBooths"]) {
        WinningBoothsVC *vc = (WinningBoothsVC *) segue.destinationViewController;
        vc.title = self.navigationItem.title;
        vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        vc.modalPresentationStyle = UIModalPresentationFormSheet;
        vc.delegate = self;
        vc.resultSet = self.resultSet;
    }
}

#pragma mark - TOTOResultVCDelegate
- (void)winningBoothDidCancel:(WinningBoothsVC *)controller {
    NSMutableArray *vcArray = [self.navigationController.viewControllers mutableCopy];
    [vcArray removeLastObject];
    self.navigationController.viewControllers = vcArray;
}

@end
