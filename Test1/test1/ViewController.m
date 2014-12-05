//
//  ViewController.m
//  test1
//
//  Created by Gabriele Pulcini on 28/11/14.
//  Copyright (c) 2014 Gabriele Pulcini. All rights reserved.
//

#import "ViewController.h"
#import "OrangeViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *redBox;
@property (weak, nonatomic) IBOutlet UITextField *blueBox;
@property (weak, nonatomic) IBOutlet UITextField *greenBox;
@property (weak, nonatomic) IBOutlet UILabel *redLabel;
@property (weak, nonatomic) IBOutlet UIView *overlay;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation ViewController{
   bool isOrangeViewActive;
    OrangeViewController* orangeView;
    NSTimer* timer;
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return true;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    isOrangeViewActive = false;
    self.redBox.delegate=self;
    self.greenBox.delegate=self;
    self.blueBox.delegate=self;
    
    UIFont* lato=[UIFont fontWithName:@"Lato-Light" size:14];
    [self.redLabel setFont:lato];
    
    
    self.overlay.alpha=0;
    
    
    
    //vado ad eseguire la SEGUE da programma, in qualsiasi situazione
    //anche nella valutazione web di un errore 404
    //[self performSegueWithIdentifier:@"toOrangeScreen" sender:self];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void) viewWillAppear:(BOOL)animated{
    self.overlay.alpha=0;
    [self.spinner stopAnimating];
}

- (void) viewDidAppear:(BOOL)animated
{
    if (isOrangeViewActive)
    {
        
    }
}

- (void) onTimer{
  [self performSegueWithIdentifier:@"toOrangeScreen" sender:self];
}

- (IBAction)onTouch:(id)sender {
    timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(onTimer) userInfo:nil repeats:false];
    
    // portare overlay sotto la schermata
    CGRect overlayFrame = self.overlay.frame;
    self.overlay.frame=CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
    
    
    [UIView animateWithDuration:1 animations:^{
        self.overlay.alpha=0.5;
        self.overlay.frame=overlayFrame;
    }];
    
    
    [self.spinner startAnimating];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //controllo prima identificatore della SEGUE in quanto potrei andare anche da altre parti
    if([segue.identifier isEqualToString:@"toOrangeScreen"])
    {
        //id destination = segue.destinationViewController;
        
        OrangeViewController* destination = (OrangeViewController *)segue.destinationViewController;
        destination.red = [self.redBox.text intValue];
        destination.green = [self.greenBox.text intValue];
        destination.blue = [self.blueBox.text intValue];
        
        isOrangeViewActive =false;
        
        
    }
}
@end
