//
//  GLTFishCard.h
//  Fish Card viewer
//
//  Created by Greg Tarsa on 1/27/14.
//  Copyright (c) 2014 Greg Tarsa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FishCard.h"
#import "FishDeck.h"
#import "FishHand.h"

//@class GLTFishCard : NSObject

@interface FishCardCell : UICollectionViewCell

@property FishCard *card;
@property (nonatomic, strong) IBOutlet UIImage *cardImage;
@property (nonatomic, strong) IBOutlet UIImageView *imageView;

@end

/*
 
 @interface FlickrPhotoCell : UICollectionViewCell
 @property (nonatomic, strong) FlickrPhoto *photo;

 */
