namespace rapporti.Models;

public class HoursModel
{
    public int Id {get;set;}
    public required string Number {get; set;}
    public required string Description {get; set;}

    public float ExpectedHours {get; set;}
    public float ActualTotalHours {get; set;}
}