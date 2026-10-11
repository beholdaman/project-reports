
namespace rapporti.Models;

public class ProjectModel
{
    public int Id {get; set;}
    public string Number {get; set;}
    public string Description {get; set;}
    public DateOnly ExpDateStart {get; set;}
    public DateOnly ExpDateEnd {get; set;}

    public float ExpHours {get; set;}

    public float ActHours {get; set;}
    public float ActHoursTasks {get; set;}

    public DateTime CreationDate {get; set;}

    public int Origin {get; set;}
}
