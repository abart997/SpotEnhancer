#import <UIKit/UIKit.h>

static UITextField *textField;
static NSString *twitterUser;

@interface UIApplication (SpotEnhancer)
-(void)applicationOpenURL:(id)url;
@end

%hook SBSearchController

-(void)searchBarSearchButtonClicked:(UISearchBar *)clicked{
    %orig;
    
    
    NSString *text = clicked.text;
    
    
	if([text isEqualToString:@"Get date"]){
	
	NSDateFormatter *dateFor = [[NSDateFormatter alloc] init];
	[dateFor setDateStyle:NSDateFormatterNoStyle];
	[dateFor setTimeStyle:NSDateFormatterShortStyle];
	[dateFor setDateFormat:@"dd-MM-YYYY"];
	NSString *currentTime = [dateFor stringFromDate:[NSDate date]];
	[dateFor release];
		
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Current date" message:currentTime delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
	
	if([text isEqualToString:@"Get time"]){
	
		NSDateFormatter *dt = [[NSDateFormatter alloc] init];
	[dt setDateStyle:NSDateFormatterNoStyle];
	[dt setTimeStyle:NSDateFormatterShortStyle];
	[dt setDateFormat:@"HH:mm:ss"];
	NSString *currentHour = [dt stringFromDate:[NSDate date]];
    [dt release];
		
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Current time" message:currentHour delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alertView show];
	[alertView release];
	
}

if([text isEqualToString:@"New message"]){

 [[UIApplication sharedApplication] applicationOpenURL:[NSURL URLWithString:[NSString stringWithFormat:@"sms:+"]]];

}

if([text isEqualToString:@"New mail"]){

[[UIApplication sharedApplication] applicationOpenURL:[NSURL URLWithString:[NSString stringWithFormat:@"mailto:"]]];

}

if([text isEqualToString:@"New call"]){

[[UIApplication sharedApplication] applicationOpenURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://+"]]];

}


if([text isEqualToString:@"Google"]) {

   NSString *url = [NSString stringWithFormat:@"http://www.google.com"];
   [[UIApplication sharedApplication] applicationOpenURL:[NSURL URLWithString:url]];

}

if([text isEqualToString:@"Fb"]) {

   NSString *url = [NSString stringWithFormat:@"http://www.facebook.com"];
   [[UIApplication sharedApplication] applicationOpenURL:[NSURL URLWithString:url]];

}

if([text isEqualToString:@"Yahoo"]) {

   NSString *url = [NSString stringWithFormat:@"http://www.yahoo.com"];
   [[UIApplication sharedApplication] applicationOpenURL:[NSURL URLWithString:url]];

}

if([text isEqualToString:@"Bing"]) {

   NSString *url = [NSString stringWithFormat:@"http://www.bing.com"];
   [[UIApplication sharedApplication] applicationOpenURL:[NSURL URLWithString:url]];

}

if([text isEqualToString:@"Respring"]){
[[UIApplication sharedApplication] relaunchSpringBoard];
 
 }

if([text isEqualToString:@"Power off"]){
[[UIApplication sharedApplication] _powerDownNow];
}

if([text isEqualToString:@"Reboot"]){
[[UIApplication sharedApplication] _rebootNow];
}



if([text isEqualToString:@"Twitter user"]) {

UIAlertView *alertTwitter = [[UIAlertView alloc]initWithTitle:@"Twitter user" message:@"\n\n" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:@"Search",nil];
 
 textField = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 50.0, 260.0, 25.0)]; 
 [textField setBackgroundColor:[UIColor whiteColor]];
 [textField setPlaceholder:@"User"];
 textField.clearButtonMode = UITextFieldViewModeWhileEditing;
 [textField becomeFirstResponder]; 
 [alertTwitter addSubview:textField];
 [alertTwitter show];
 [alertTwitter release];

 }
} 
 
%new(v@:@@)
  
- (void)alertView:(UIAlertView *)alert didDismissWithButtonIndex:(NSInteger)buttonIndex{
if(buttonIndex == 1){
 twitterUser = textField.text;
   NSString *url = [NSString stringWithFormat:@"http://www.twitter.com/%@", twitterUser];
   [[UIApplication sharedApplication] applicationOpenURL:[NSURL URLWithString:url]];
}
}

%end
  
  
