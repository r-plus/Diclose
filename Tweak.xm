// navigation controller.
@interface DDParsecServiceCollectionViewController : UINavigationController
- (void)doneButtonPressed:(id)arg1 punchout:(BOOL)arg2;
- (void)doneButtonPressed:(id)arg1;
@end
// root vc.
@interface DDParsecTableViewController : UITableViewController
@end
// entity vc.
@interface DDDictionaryCardViewController : UIViewController <UIWebViewDelegate>
@end
// others vc.
@interface DDEventEditViewController : UIViewController
@end
@interface DDParsecFirstTimeViewController : UIViewController
@end

%hook UIViewController
- (void)viewDidLoad
{
    %orig;
    UISwipeGestureRecognizer *horizonSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(doneButtonPressedByDiclose)];
    horizonSwipeGesture.direction = (UISwipeGestureRecognizerDirection)(UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight);
    [self.view addGestureRecognizer:horizonSwipeGesture];
    [horizonSwipeGesture release];
}
%new
- (void)doneButtonPressedByDiclose
{
    DDParsecServiceCollectionViewController *nv = (DDParsecServiceCollectionViewController *)self.navigationController;
    if (!nv) { return; }
    [nv doneButtonPressed:nil];
}
%end

