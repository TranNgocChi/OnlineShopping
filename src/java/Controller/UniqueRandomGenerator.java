package Controller;

import java.util.Random;

public class UniqueRandomGenerator {
    private int previousNumber;
    private final Random random;

    public UniqueRandomGenerator() {
        random = new Random();
    }

    public int generateUniqueRandomNumber(int min, int max) {
        int randomNumber;

        do {
            randomNumber = random.nextInt(max - min + 1) + min;
        } while (randomNumber == previousNumber);

        previousNumber = randomNumber;
        return randomNumber;
    }
    
}