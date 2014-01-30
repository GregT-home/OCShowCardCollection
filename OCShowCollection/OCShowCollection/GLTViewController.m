//
//  GLTViewController.m
//  OCShowCollection
//
//  Created by Greg Tarsa on 1/29/14.imageview
//  Copyright (c) 2014 Greg Tarsa. All rights reserved.
//

#import "GLTViewController.h"
#import "GoFishModel.h"
#import "FishCardCell.h"

@interface GLTViewController () <UITextFieldDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
// @property (nonatomic, strong) NSMutableDictionary *gameSections;
@property (nonatomic, strong) FishHand *hand;

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

/*
@property (nonatomic, weak) IBOutlet UIToolbar *toolBar;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *shareButton;
@property (nonatomic, weak) IBOutlet UITextField *textField;
 */
- (IBAction)shareButtonTapped:(id)sender;


@end

@implementation GLTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // self.gameSections = [NSMutableDictionary new];
    
    // Books will be stored as the actual cards, but be displayed differently (no idea what "differently" means yet.
/* Dict:
 NSArray *keys = [NSArray arrayWithObjects:@"Hand", @"Books", nil];
    NSArray *objs = [NSArray arrayWithObjects:[FishHand new], [FishHand new], nil];
    self.gameSections = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
*/
    //fishCards is the array of cards we will be displaying
    //hand is our hand.  It may be the same as fishCards, so we may be optimizing later
    self.hand = [FishHand new];
    [self loadCardsIntoHand];
    
    // self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_cork"]];
}

- (void)loadCardsIntoHand {
    FishDeck *deck = [FishDeck newWithCards];
    //    [deck shuffle];
    // FishHand *hand = [FishHand new];
    
    // create a hand of cards
    for (int i = 0; i < 52; i++) {
        FishCard *card;
        card = [deck give_card];
        
        [self.hand receiveCards:@[card]];
//        NSLog(@"card = %@, image = %@.png", [card description], [card toFileBaseName]);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) shareButtonTapped:(id)sender {
    // ToDo
}



# pragma mark - UI CollectionView Datasource

- (NSInteger) collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
   // dict: return [[self.gameSections objectForKey:@"Hand"] numberOfCards];
    return [[self.hand numberOfCards] integerValue];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
 //   UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FishCardCell" forIndexPath:indexPath];
    FishCardCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FishCardCell" forIndexPath:indexPath];
    
    FishCard *card = self.hand.cards[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[card toFileBaseName]];
    cell.backgroundColor = [UIColor whiteColor];

    return cell;
}

/*
 - (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    return [UICollectionReusableView new];
}
*/

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    // TODO: Select Item
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    // TODO: Deselect item
}

#pragma mark – UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
//    [UIImage imageNamed:[fishCard.card toFileBaseName]]
    // Our playing cards are these dimensions.  Need to figure out how to determine this dynamically
    CGSize retval;
    
    retval.height += 96; retval.width += 71;
    return retval;
}

- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(50, 20, 50, 20);
}

@end
