//
//  PhotoViewController.m
//  SmartCamera
//
//  Created by  shihongliang on 10/4/18.
//  Copyright © 2018  shihongliang. All rights reserved.
//

#import "PhotoViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>



@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSManagedObjectContext *moc = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Photo"];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"property = %@" , self.property];
    self.photos = [[moc executeFetchRequest:fetchRequest error:nil] mutableCopy];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageWithData:[[self.photos objectAtIndex:indexPath.row] valueForKey:@"image"]]];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.photo = [self.photos objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"PhotoDetailSegue" sender:self];
}
- (IBAction)Back:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}
- (IBAction)addPhoto:(id)sender {
    
}

#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"photoCapture"]) {
        CameraViewController* ViewController = segue.destinationViewController;
        ViewController.property = self.property;
        
    } else if ([segue.identifier isEqualToString:@"PhotoDetailSegue"]) {
        PhotoDetailViewController* viewConteoller = segue.destinationViewController;
        viewConteoller.photo = self.photo;
    }
}


@end
