//
//  ViewController.h
//  Laboratorio5
//
//  Created by Marcos on 1/28/15.
//  Copyright (c) 2015 Marcos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorViewController : UIViewController


// propiedades
@property (weak, nonatomic) IBOutlet UILabel *lblRGB;

@property (weak, nonatomic) IBOutlet UISlider *slRed;
@property (weak, nonatomic) IBOutlet UISlider *slGreen;
@property (weak, nonatomic) IBOutlet UISlider *slBlue;

@property (weak, nonatomic) IBOutlet UISlider *slParpadeo;
@property (weak, nonatomic) IBOutlet UILabel *lblBlink;








// acciones
- (IBAction)slRedChange:(id)sender;
- (IBAction)slGreenChange:(id)sender;
- (IBAction)slBlueChange:(id)sender;

- (IBAction)slParpadeoChange:(id)sender;




@end

