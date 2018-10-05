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
    
    // Do any additional setup after loading the view.
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:[[cell contentView] frame]];
//    [lbl setTextColor:[UIColor blueColor]];
//    [lbl setTextAlignment:NSTextAlignmentCenter];
//    [lbl setText:[NSString stringWithFormat:@"Cell : %ld", indexPath.row + 1]];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageWithData:[[self.photos objectAtIndex:indexPath.row] valueForKey:@"image"]]];
   // = recipeImageView;

    [cell addSubview:lbl];
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Cell Tap" message:[NSString stringWithFormat:@"Cell : %ld selected", indexPath.row + 1] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}
- (IBAction)Back:(id)sender{
    [self dismissViewControllerAnimated:NO completion:nil];
}
- (IBAction)addPhoto:(id)sender {
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"photoCapture"]) {
        CameraViewController* ViewController = segue.destinationViewController;
        ViewController.property = self.property;
        
    }
}


@end
