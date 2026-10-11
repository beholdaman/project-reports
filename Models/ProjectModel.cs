
namespace rapporti.Models;

public class ProjectModel
{
    public int Id {get; set;}
    public int Number {get; set;}
    public DateOnly ExpDateStart {get; set;}
    public DateOnly ExpDateEnd {get; set;}

    public float ExpHours {get; set;}

    public float ActHours {get; set;}
    public float ActHoursTasks {get; set;}

    public DateOnly CreationDate {get; set;}

    public int Origin {get; set;}
}
