
namespace rapporti.Models;

public class AverageByTaskModel
{
    public int Id {get;set;}
    public string Number {get;set;}
    public string Description {set; get;}

    public float AverageHoursByDay {set; get;}
}