//
//  OrangeViewController.m
//  test1
//
//  Created by Gabriele Pulcini on 28/11/14.
//  Copyright (c) 2014 Gabriele Pulcini. All rights reserved.
//

#import "OrangeViewController.h"

@interface OrangeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *myButton;


@end

@implementation OrangeViewController {
    __weak IBOutlet UIView *myView;
    
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    //cambio il colore da arancione in blu
    //[myView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:1 alpha:1]];
    
    
    // Do any additional setup after loading the view.
}


- (IBAction)nSwipe:(id)sender {
    //facendo swipe sulla parte colorata Blu, passo alla schermata precedente
    [self dismissViewControllerAnimated:true completion:^{}];

}

    
- (IBAction)onTouch:(id)sender {
    //clicco su close e torno indietro
    [self.navigationController popViewControllerAnimated:true];
    
    //lo uso se la transizione è modale
    //[self dismissViewControllerAnimated:true completion:^{}];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) viewDidAppear:(BOOL)animated{
    [myView setBackgroundColor:[UIColor colorWithRed:(float)self.red/255.0f green:(float)self.green/255.0f blue:(float)self.blue/255.0f alpha:1]];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
