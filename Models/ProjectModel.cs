
namespace rapporti.Models;

public class ProjectModel
{
    public int Id {get;}
    public int Number {get;}
    public DateOnly ExpDateStart {get;}
    public DateOnly ExpDateEnd {get;}

    public float ExpHours {get;}

    public float ActHours {get;}
    public float ActHoursTasks {get;}

    public DateOnly CreationDate {get;}

    public ProjectModel Origin {get;}
}
