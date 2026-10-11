
namespace rapporti.Models;

public class ReportModel
{
    public int Id {get;}

    public DateOnly Date {get;}

    public TimeOnly HourStart {get;}

    public TimeOnly HourEnd {get;}

    public string? Description {get;}
}