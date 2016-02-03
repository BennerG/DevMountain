//
//  main.c
//  ClassCertificates
//
//  Created by Benjamin Thomas Gurrola on 9/12/15.
//  Copyright (c) 2015 Benjamin Thomas Gurrola. All rights reserved.
//

#include <stdio.h>
#include <unistd.h>

void congratulateSutdent(char *student, char *course, int numDays)
{
    printf("%s has done as much %s Programming as could fit into %d days.\n",
           student, course, numDays);
}

int main(int argc, const char * argv[])
{
    congratulateSutdent("Kate", "Cocoa", 5);
    sleep(2);
    congratulateSutdent("Bo", "Objective-C", 2);
    sleep(2);
    congratulateSutdent("Mike", "Python", 5);
    sleep(2);
    congratulateSutdent("Liz", "iOS", 5);
    
    return 0;
}
