//
//  SlideMenuViewController.m
//  test1
//
//  Created by Gabriele Pulcini on 28/11/14.
//  Copyright (c) 2014 Gabriele Pulcini. All rights reserved.
//

#import "SlideMenuViewController.h"

@interface SlideMenuViewController ()
@property (weak, nonatomic) IBOutlet UIView *vistaPrincipale;
@property (weak, nonatomic) IBOutlet UIView *vistaMenu;

@end

@implementation SlideMenuViewController

-(void) showMenu{
    [UIView animateWithDuration:1 animations:^{
        self.vistaMenu.frame=CGRectMake(0, 0, self.vistaMenu.frame.size.width, self.vistaMenu.frame.size.height);
        
        self.vistaPrincipale.frame=CGRectMake(self.vistaMenu.frame.size.width, 0, self.vistaPrincipale.frame.size.width, self.vistaPrincipale.frame.size.height);

        
    }];
    
}


-(void) hideMenu{
    [UIView animateWithDuration:1 animations:^{
        self.vistaMenu.frame=CGRectMake(-self.vistaMenu.frame.size.width, 0, self.vistaMenu.frame.size.width, self.vistaMenu.frame.size.height);
        
        self.vistaPrincipale.frame=CGRectMake(0, 0, self.vistaPrincipale.frame.size.width, self.vistaPrincipale.frame.size.height);
        
        
    }];
    
}
- (IBAction)onSwipeRight:(id)sender {
    [self showMenu];
}
- (IBAction)onSwipeLeft:(id)sender {
    [self hideMenu];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.vistaMenu.frame=CGRectMake(-self.vistaMenu.frame.size.width, 0, self.vistaMenu.frame.size.width, self.vistaMenu.frame.size.height);
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
