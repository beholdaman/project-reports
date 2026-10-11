
namespace rapporti.Models;

public class ReportModel
{
    public int Id {get; set;}

    public DateOnly Date {get; set;}

    public TimeOnly HourStart {get; set;}

    public TimeOnly HourEnd {get; set;}

    public string? Description {get; set;}

    public int UserModel {get; set;}

    public int ProjectModel {get; set;}

}