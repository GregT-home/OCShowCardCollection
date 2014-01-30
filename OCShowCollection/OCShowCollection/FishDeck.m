//
//  FishDeck.m
//  GoFishModel
//
//  Created by Greg Tarsa on 1/23/14.
//  Copyright (c) 2014 Greg Tarsa. All rights reserved.
//

#import "FishDeck.h"
#import "FishCard.h"

@interface FishDeck()
// declare our cards so that they are not visible, similar to an instance variable in Ruby
// nonatomic: value can be returned without regard to multi-threading.
// strong: use automatic reference counting (ARC) with this item.
@property (nonatomic, strong) NSMutableArray *cards;
@end


@implementation FishDeck
+ (instancetype)newWithCards {
    return[[self alloc] initWithCards];
}

- (instancetype)initWithCards {
    self = [super init];
    if (self) {
        [self createCards];
    }
    return self;
}

- (void)createCards {
     self.cards = [NSMutableArray new];
    for (NSString *suit in SUITS) {
        for (NSString *rank in RANKS) {
            [self.cards addObject:[FishCard newWithRank:rank suit:suit]];
        }
    }
}

- (NSNumber *)numberOfCards   {
    return @([self.cards count]);
}

- (BOOL)isEqual:(FishDeck *)aDeck {
    __block BOOL result;
    [self.cards enumerateObjectsUsingBlock:^(FishCard *card, NSUInteger i, BOOL *stopearly) {
        result = [card isEqual:[aDeck.cards objectAtIndex:i]];
        if (!result)
            *stopearly = YES;
    }];
    return result;
}

- (void)shuffle {
    {
        int count = [[self numberOfCards] intValue];
        for (int i = 0; i < count; ++i) {
            // Select a random element between i and end of array to swap with.
            int nElements = count - i;
            int n = arc4random_uniform(nElements) + i;
            [self.cards exchangeObjectAtIndex:i withObjectAtIndex:n];
        }
    }
}

- (FishCard *)give_card {
    FishCard *card = [self.cards objectAtIndex:0];
    if (card != nil)
       [self.cards removeObjectAtIndex:0];
    return card;
}

- (void)receive_card:(FishCard *)newcard {
    [self.cards insertObject:newcard atIndex:[self.cards count] - 1];
}

@end
