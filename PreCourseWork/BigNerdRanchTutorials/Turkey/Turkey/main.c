//
//  main.c
//  Turkey
//
//  Created by Benjamin Thomas Gurrola on 9/6/15.
//  Copyright (c) 2015 Benjamin Thomas Gurrola. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // Declare the bariable caleld 'weight' of the type float
    float weight;
    
    // Store a number in that variable
    weight = 14.2;
    
    // Log it to the user
    printf("The turkey weighs %f.\n", weight);
    
    // Declare another variable of type float
    float cookingTime;
    
    // Calculate the cooking time and store it in the variable
    // In this case, '*' means 'multiplied by'
    cookingTime = 15.0 + 15.0 * weight;
    
    // Log that to the user
    printf("Cook it for %f minutes.\n", cookingTime);
    
    // End this function and indicate success
    return 0;
}
