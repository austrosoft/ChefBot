//
//  recipeSelectorViewController.m
//  CookBot
//
//  Created by Dominik on 2014-01-05.
//  Copyright (c) 2014 Dominik. All rights reserved.
//

#import "recipeSelectorViewController.h"
#import <QuartzCore/QuartzCore.h>

//define const

NSInteger const MAXIMUM_COOKING_TIME_IN_MINUTES = 240; //4hrs max


@interface recipeSelectorViewController ()

//Network connection
@property (strong, nonatomic) CBNetworkConnection * recipeConnection;

@end

@implementation recipeSelectorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
      
        
    }  
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _m_typeOfMeatPicker.delegate = self;
    _m_typeOfMeatPicker.dataSource = self;
    
    //Setup Lists
    _m_typeOfMeatList = [[NSArray alloc] initWithObjects:
                         @"Select a Meat...", @"Pork", @"Beef", @"Chicken", @"Salmon", @"Tuna", nil];
    
    //button listener
    [_m_findARecipe addTarget:self action:@selector(findRecipeAction) forControlEvents:UIControlEventTouchUpInside];
    
    //slider listener
    [_m_timeSelector addTarget:self action:@selector(timeSelectorAction)forControlEvents:UIControlEventValueChanged];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
    On click we need to find out what the user selected and move to fetching
    the recipe.
 */
-(void) findRecipeAction
{
    NSLog((@" BUTTON CLICKED"));
    NSInteger selectedRow = [_m_typeOfMeatPicker selectedRowInComponent:0]; //only 1 component
    
    NSString * meatSelected = [_m_typeOfMeatList objectAtIndex: selectedRow];
    
    UIAlertView * message;
    if(selectedRow == 0)
    {
        
        message = [[UIAlertView alloc] initWithTitle:@"Error - No Meat Selected"
                                             message:@"You Must Select a Meat!"
                                            delegate:nil
                                   cancelButtonTitle:@"OK"
                                   otherButtonTitles:nil];
    }
    else
    {
            message = [[UIAlertView alloc] initWithTitle:@"Loading Recipe"
                                                      message:@"CookBot is designing a recipe..."
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        
        
        //Create network connection
        
    }
    
   // [message show];

    [self setRecipeConnection:[CBNetworkConnection networkConnection]];
    [[self recipeConnection] setDelegate:self];
    [[self recipeConnection] createNewConnection:nil parameters:nil ];

}


-(void) timeSelectorAction
{
    float currentSelection = [self.m_timeSelector value];
    NSInteger minutes = currentSelection * MAXIMUM_COOKING_TIME_IN_MINUTES;
    
//    NSLog([NSString stringWithFormat:@"%d", minutes] );
    
    _m_timeSelected.text = [NSString stringWithFormat:@"%d min", minutes];
}

/*
    * As slider moves, compute the time
 */


// PickerView related components
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 30.0;
}


- (NSInteger) pickerView: (UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [_m_typeOfMeatList count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return [_m_typeOfMeatList objectAtIndex:row];
}


//Network Connection Related comonents
- (void)networkConnection:(CBNetworkConnection *)networkConnection connectionError:(id)errorCode command:(NSString*)command
{
    NSLog(@"FAIL");
    
}

- (void)networkConnection:(CBNetworkConnection *)networkConnection connectionSuccessful:(id)localMessage command:(NSString*)command
{
    NSLog(@"SUCCESS");
}

@end
