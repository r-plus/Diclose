%config(generator=internal)

%hook UIReferenceLibraryViewController
- (void)viewDidLoad
{
    %orig;
    UISwipeGestureRecognizer *horizonSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(_dismissModalReferenceView:)];
    horizonSwipeGesture.direction = (UISwipeGestureRecognizerDirection)(UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight);
    [self.view addGestureRecognizer:horizonSwipeGesture];
    [horizonSwipeGesture release];
}
%end
