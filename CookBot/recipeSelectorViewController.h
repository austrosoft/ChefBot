//
//  recipeSelectorViewController.h
//  CookBot
//
//  Created by Dominik on 2014-01-05.
//  Copyright (c) 2014 Dominik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBNetworkConnectionDelegate.h"

@interface recipeSelectorViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, CBNetworkConnectionDelegate>
{
    
    IBOutlet UIPickerView *m_typeOfMeatPicker;
    NSMutableDictionary *m_typeOfMeatDataSource;
    NSArray * m_typeOfMeatList;
}


@property (weak, nonatomic) IBOutlet UIButton *m_findARecipe;



//Picker View Related Items
@property (weak, nonatomic) IBOutlet UIPickerView *m_typeOfMeatPicker;
@property (strong, nonatomic) NSMutableDictionary *m_typeOfMeatDataSource;
@property (strong, nonatomic) NSArray * m_typeOfMeatList;


//Minute Selector Related Items
@property (weak, nonatomic) IBOutlet UILabel *m_timeSelected;
@property (weak, nonatomic) IBOutlet UISlider *m_timeSelector;

@end
