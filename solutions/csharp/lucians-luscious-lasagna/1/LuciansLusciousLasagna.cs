class Lasagna
{
    public int ExpectedMinutesInOven(){
        return 40;
    }

    public int RemainingMinutesInOven(int x){
        return ExpectedMinutesInOven() - x;
    }

    public int PreparationTimeInMinutes(int layers){
        return 2 * layers;
    }

    public int ElapsedTimeInMinutes(int layers, int minutes){
        return PreparationTimeInMinutes(layers) + minutes;
    }
}
