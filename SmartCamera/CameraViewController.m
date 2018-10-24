//
//  CameraViewController.m
//  SmartCamera
//
//  Created by  shihongliang on 10/4/18.
//  Copyright © 2018  shihongliang. All rights reserved.
//

#import "CameraViewController.h"
#import <CoreData/CoreData.h>
#import <GoogleAPIClientForREST/GTLRUtilities.h>
#import <GTMSessionFetcher/GTMSessionFetcherService.h>
#import <GTMSessionFetcher/GTMSessionFetcherLogging.h>
@import GoogleAPIClientForREST;
#import "GTLRFramework.h"
#import "GTLRQuery.h"
#import "GTLRObject.h"
#import "GTLRService.h"
#import "GTLRDrive.h"
#import "AppDelegate.h"
@interface CameraViewController ()

@end

@implementation CameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [GIDSignIn sharedInstance].uiDelegate = self;
    NSLog(@"viewDidLoad");
    

}
-(void) viewDidDisappear:(BOOL)animated{
    NSLog(@"viewDidDisappear");
}
-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"viewDidAppear");
}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"viewWillAppear");
}
- (IBAction)takePhoto:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)selectPhoto:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (IBAction)Save:(UIButton*)sender {
     NSManagedObjectContext *moc = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;
    Photo* item = [NSEntityDescription insertNewObjectForEntityForName:@"Photo"
                                     inManagedObjectContext:moc];
    item.image = UIImagePNGRepresentation(self.imageView.image);
    item.property = self.property;
    item.id = [self uniqueIdForObject];
    [((AppDelegate *)[UIApplication sharedApplication].delegate) saveContext];
    [[GIDSignIn sharedInstance]signInSilently];
    [self upload:item];
    [self dismissViewControllerAnimated:NO completion:nil];
}
- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}



- (void) upload:(Photo*)item {
    GIDAuthentication* authentication = [GIDSignIn sharedInstance].currentUser.authentication;
    GTLRDriveService *driveService = [[GTLRDriveService alloc] init];
    driveService.authorizer = [authentication fetcherAuthorizer];
    GTLRDrive_File *metadata = [GTLRDrive_File object];
    NSData *fileData = item.image;
    GTLRUploadParameters * uploadParameters = [GTLRUploadParameters uploadParametersWithData:fileData
                                                                                    MIMEType:@"image/jpeg"];
    uploadParameters.shouldUploadWithSingleRequest = TRUE;
    uploadParameters.useBackgroundSession =TRUE;
    metadata.name = @"test";
    metadata.mimeType = @"application/vnd.google-apps.drive-sdk";
    GTLRDriveQuery_FilesCreate *query = [GTLRDriveQuery_FilesCreate queryWithObject:metadata
                                                                   uploadParameters:uploadParameters];
    query.fields = @"id";
    [driveService executeQuery:query completionHandler:^(GTLRServiceTicket *ticket,
                                                         GTLRDrive_File *file,
                                                         NSError *error) {
        if (error == nil) {
            NSLog(@"File ID %@", file.identifier);
        } else {
            NSLog(@"An error occurred: %@", error);
        }
    }];
}
- (NSString *)uniqueIdForObject {
    CFUUIDRef uniqueString = CFUUIDCreate(NULL);
    CFStringRef isString = CFUUIDCreateString(NULL, uniqueString);
    CFRelease(uniqueString);
    return (__bridge NSString *) isString;
}
@end
