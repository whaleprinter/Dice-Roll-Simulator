#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>


int diceRoll(int n) {
    int totalRoll = 0;
    

    for (int i = 0; i < n; i++) {
        int die_roll = (rand() % 6) + 1;
        totalRoll += die_roll;
        double sqrt_val = sqrt(totalRoll);

        int int_sqrt = (int)sqrt_val;

        if (int_sqrt * int_sqrt == totalRoll) {
            totalRoll = 0;
        } 
    }
    return totalRoll;
    

}

int main(int argc, char *argv[]) {
    srand(time(NULL));
    
    int stepSize = atoi(argv[1]);
    int maxRolls = atoi(argv[2]);


    int numTrials = maxRolls/stepSize;
    int *trials = (int *)malloc(numTrials * sizeof(int)); 
    int *payoffs = (int *)malloc(numTrials * sizeof(int)); 

    int i = 0;
    int arraySum = 0;

    for (int rolls = 0; rolls < maxRolls; rolls += stepSize) {
        
        trials[i] = rolls;
        payoffs[i] = diceRoll(rolls);
        arraySum += payoffs[i];

        i++;


    }

    // Use flag -p to print every outcome
    if (argc > 3 && strcmp(argv[3], "-p") == 0) {
        for (int i = 0; i < numTrials; i++) {
            printf("Rolls: %d, Payoff: %d \n", trials[i], payoffs[i]);
        }
    }

    float average = arraySum / numTrials;
    printf("Average payoff: %f \n", average);
    

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