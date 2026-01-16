/*
Dice roll question posed by Conrad Qu before going to bet. This program calculates the payoff for various numbers of rolls and provides the average and maximum payoffs. 
To run: ./DiceRoll <Step Size> <Max Rolls> 
Use "-p" flag to print every outcome to the terminal

Roshan Sundaram
1/16/2026
*/

#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <time.h>


int updateRoll(int currentTotal, int newRolls) {
    for (int i = 0; i < newRolls; i++) {
        int die = (rand() % 6) + 1;

        currentTotal += die;

        int r = (int)sqrt(currentTotal);
        if (r * r == currentTotal) {
            currentTotal = 0;
        }
    }
    return currentTotal;
}

int main(int argc, char *argv[]) {
    srand(time(NULL));
    
    int stepSize = atoi(argv[1]);
    int maxRolls = atoi(argv[2]);


    int numTrials = maxRolls/stepSize;
    int *trials = (int *)malloc(numTrials * sizeof(int)); 
    int *payoffs = (int *)malloc(numTrials * sizeof(int)); 

    int i = 0;
    int total = 0;
    int arraySum = 0;
    int maxPayoff = 0;

    clock_t beginTime = clock();
    for (int rolls = 0; rolls < maxRolls; rolls += stepSize) {
        
        trials[i] = rolls;
        total = updateRoll(total, stepSize); 
        payoffs[i] = total;
        arraySum += payoffs[i];
        if (total >= maxPayoff) {
            maxPayoff = total;
        }
        i++;
    }

    clock_t endTime = clock();

    // Use flag -p to print every outcome
    if (argc > 3 && strcmp(argv[3], "-p") == 0) {
        for (int i = 0; i < numTrials; i++) {
            printf("Rolls: %d, Payoff: %d \n", trials[i], payoffs[i]);
        }
    }

    
    float average = arraySum / numTrials;
    printf("Average payoff: %f \n", average);
    printf("Maximum payoff: %d \n", maxPayoff);
    printf("Elapsed: %f seconds\n", (double)(endTime - beginTime) / CLOCKS_PER_SEC);
    


    FILE *file;
    char filename[50];
    sprintf(filename, "%s_%s.csv", argv[1], argv[2]);
    
    
    file = fopen(filename, "w");
    fprintf(file, "Rolls,Payoff\n");
    for (int i = 0; i < numTrials; i++) {
        fprintf(file, "%d,%d\n", trials[i], payoffs[i]);
    }
    fclose(file);
    
    free(trials);
    free(payoffs);
    


}