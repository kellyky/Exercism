class Lasagna
{
    public int ExpectedMinutesInOven() => 40;
    public int RemainingMinutesInOven(int x) => ExpectedMinutesInOven() - x;
    public int PreparationTimeInMinutes(int layers) => 2 * layers;
    public int ElapsedTimeInMinutes(int layers, int minutes) => PreparationTimeInMinutes(layers) + minutes;
}
