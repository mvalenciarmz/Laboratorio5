//
//  ViewController.m
//  Laboratorio5
//
//  Created by Marcos on 1/28/15.
//  Copyright (c) 2015 Marcos. All rights reserved.
//

#import "ColorViewController.h"

// Intentaremos poner el label del color redondo :D
#import <QuartzCore/QuartzCore.h>

// Timer para el parpadeo
NSTimer *contadorTimer;
// Para el parpadeo 0 = oculto   1 = visible
NSInteger * blink;

@interface ColorViewController ()

@end

@implementation ColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Para redondear el label
    self.lblRGB.layer.cornerRadius = 58;
    self.lblRGB.layer.masksToBounds = YES;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Como los 3 slides de color haràn lo mismo, lo ponemos en una función que llamara cada uno de ellos
// ---------------------------------------------------------------------------------------------------
- (void)actualizaColorRGB{

    // Actualizamos el color de fondo del label
    self.lblRGB.backgroundColor = [UIColor colorWithRed: (self.slRed.value/255.0) green: (self.slGreen.value/255.0) blue: (self.slBlue.value/255.0) alpha:1.0f];
    
    // Actualizamos el texto que indica los valores actuales
    
    // Qué pachanga concatenar strings ,debe haber una manera màs fácil   :(
    NSString * strRed   = [NSString stringWithFormat:@"%d", (int) self.slRed.value];
    strRed = [strRed stringByAppendingString:@", "];
    
    NSString * strGreen = [NSString stringWithFormat:@"%d", (int) self.slGreen.value];
    strGreen = [strGreen stringByAppendingString:@", "];
    
    // Me hice pelotas concatenando más de dos strings, así que vamos a concatenarlos de 2 en 2    :(
    NSString * strColor  = [strRed stringByAppendingString:strGreen];
    
    NSString * strBlue  = [NSString stringWithFormat:@"%d", (int) self.slBlue.value];
    strColor = [strColor stringByAppendingString:strBlue];
    
    // Ponemos en el label los valores actuales de R, G, B
    self.lblRGB.text = strColor;
    
}

// Los tres sliders hacen exactamente lo mismo, asi que llamarán a la misma función
- (IBAction)slRedChange:(id)sender {
    [self actualizaColorRGB];
}

- (IBAction)slGreenChange:(id)sender {
    [self actualizaColorRGB];
}

- (IBAction)slBlueChange:(id)sender {
    [self actualizaColorRGB];
}

- (IBAction)slParpadeoChange:(id)sender {
    [self LanzarTimer];
    // Mostramos en un label cuánto vale el timer
    NSString * strBlink = [NSString stringWithFormat:@"%d", (int) self.slParpadeo.value];
    self.lblBlink.text = strBlink;
    
}


// Funciones para el mostrar/ocultar el label del color... el tiempo será determinado por el slider
// ---------------------------------------------------------------------------------------------------

// TOdos los ejemplos consultados en internet terminan el nombre de la función con 2 puntos
// investigar que significa eso
-(void)Parpadeo:(NSTimer *) elContador {
    // Si está oculto, lo mostramos
    if ( blink == 0 ) {
        //NSLog(@"el blink vale 0");
        self.lblRGB.alpha = 1;
        blink++; // si le pongo blink = 1 marca error ¿ porqué si está definido como entero ?
    // Si está visible, lo ocultamos
    } else {
        //NSLog(@"el blink vale 1");
        self.lblRGB.alpha = 0;
        blink = 0;
    }
}

// Lanzamos el timer con la periodicidad marcada en el slider
// 0 = no parpadeo
// 1 - 5 : n segundos visible, n segundos coulto
- (void) LanzarTimer {
    // Primero anulamos cualquiera que estuviera activo
    [self TerminarTimer];
    
    // Si no vale 0 lanzamos el timer
     if ( (int) self.slParpadeo.value > 0 ) {
         // Lo lanzamos con el nuevo tiempo
         contadorTimer = [NSTimer
            scheduledTimerWithTimeInterval: (int) self.slParpadeo.value
            target:self
            selector:@selector( Parpadeo: )
            userInfo:nil
            repeats:YES];
    // Si vale 0, lo mostramos
     } else {
         self.lblRGB.alpha = 1;
     }
         
}

// Cancelamos el timer actual
- (void) TerminarTimer {
    [contadorTimer invalidate];
    contadorTimer = nil;
}


@end
