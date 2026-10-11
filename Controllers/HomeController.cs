using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using MySqlConnector;
using rapporti.Models;
using rapporti.Models.ViewModels;

namespace rapporti.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        var l = GetAllReports();
        return View(l);
    }

    public IActionResult Projects()
    {
        var l = GetAllProjects();
        return View(l);
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }

    public RedirectResult Insert(ReportModel report)
    {
        using(MySqlConnection conn = new MySqlConnection("Server=localhost;Database=tecnical_call;Uid=root;Pwd=4blat!vO"))
        {
            using(var tableCmd = conn.CreateCommand())
            {
                conn.Open();
                tableCmd.CommandText = $"INSERT INTO reports(DATE, HOUR_START, HOUR_END, FK_USER, FK_PROJECT) VALUES"
                + $"('2025-12-25', '{report.HourStart}', '{report.HourEnd}', '{report.UserModel}', '{report.ProjectModel}');";
                try
                {
                    tableCmd.ExecuteNonQuery();
                }catch(Exception e)
                {
                    Console.WriteLine(e.Message);
                }
            }
        }
        return Redirect("http://localhost:5162/");
    }

    internal ReportViewModel GetAllReports()
    {
        List<ReportModel> l = new();

        using(MySqlConnection conn = new MySqlConnection("Server=localhost;Database=tecnical_call;Uid=root;Pwd=4blat!vO"))
        {
            using(var tableCmd = conn.CreateCommand())
            {
                conn.Open();
                tableCmd.CommandText = $"SELECT * FROM reports";

                using(var reader = tableCmd.ExecuteReader())
                {

                    if(reader.HasRows)
                    {
                        while(reader.Read())
                        {
                            l.Add(new ReportModel
                            {
                                Id = reader.GetInt32(0),
                                Date = reader.GetDateOnly(1),
                                HourStart = reader.GetTimeOnly(2),
                                HourEnd = reader.GetTimeOnly(3),
                                UserModel = reader.GetInt32(5),
                                ProjectModel = reader.GetInt32(6)
                            });
                        }
                    }
                    else
                    {
                        return new ReportViewModel{ReportList = l};
                    }
                
                }
            }

            
        }

        return new ReportViewModel{ReportList = l};
    }

    internal ProjectViewModel GetAllProjects()
    {
        List<ProjectModel> l = new();

        using(MySqlConnection conn = new MySqlConnection("Server=localhost;Database=tecnical_call;Uid=root;Pwd=4blat!vO"))
        {
            using(var tableCmd = conn.CreateCommand())
            {
                conn.Open();
                tableCmd.CommandText = $"SELECT * FROM projects";

                using(var reader = tableCmd.ExecuteReader())
                {

                    if(reader.HasRows)
                    {
                        while(reader.Read())
                        {
                            l.Add(new ProjectModel
                            {
                                Id = reader.GetInt32(0),
                                Number = reader.GetString(1),
                                Description = reader.GetString(2),
                                ExpDateStart = reader.GetDateOnly(3),
                                ExpDateEnd = reader.GetDateOnly(4),
                                ExpHours = reader.GetFloat(5),
                                ActHours = reader.GetFloat(6),
                                ActHoursTasks = reader.GetFloat(7),
                                CreationDate = reader.GetDateTime(8)
                            });
                        }
                    }
                    else
                    {
                        return new ProjectViewModel{ProjectList = l};
                    }
                
                }
            }

            
        }

        return new ProjectViewModel{ProjectList = l};
    }

    public JsonResult DeleteReport(int id)
    {
        using( MySqlConnection conn = new MySqlConnection("Server=localhost;Database=tecnical_call;Uid=root;Pwd=4blat!vO"))
        {
            using(var tableCmd = conn.CreateCommand())
            {
                conn.Open();
                tableCmd.CommandText = $"DELETE FROM reports WHERE id = '{id}'";
                tableCmd.ExecuteNonQuery();
            }
        }
        return Json(new {});
    }

    public JsonResult PopulateForm(int id)
    {
        var report = GetReport(id);
        return Json(report);
    }

    internal ReportModel GetReport(int id)
    {
        ReportModel report = new();

        using(MySqlConnection conn = new MySqlConnection("Server=localhost;Database=tecnical_call;Uid=root;Pwd=4blat!vO"))
        {
            using(var tableCmd = conn.CreateCommand())
            {
                conn.Open();
                tableCmd.CommandText = $"SELECT * FROM reports WHERE id = '{id}''";

                using(var reader = tableCmd.ExecuteReader())
                {

                    if(reader.HasRows)
                    {
                        reader.Read();
                        report.Date = reader.GetDateOnly(1);
                        report.HourStart = reader.GetTimeOnly(2);
                        report.HourEnd = reader.GetTimeOnly(3);
                        report.UserModel = reader.GetInt32(5);
                        report.ProjectModel = reader.GetInt32(6);

                    }
                    else
                    {
                        return report;
                    }
                
                }
            }

            
        }

        return report;
        
    }

    public RedirectResult UpdateReport(ReportModel report)
    {

         using( MySqlConnection conn = new MySqlConnection("Server=localhost;Database=tecnical_call;Uid=root;Pwd=4blat!vO"))
        {
            using(var tableCmd = conn.CreateCommand())
            {
                conn.Open();
                tableCmd.CommandText = $"UPDATE reports SET date = '2025-12-25', hour_start = '{report.HourStart}', hour_end = '{report.HourEnd}', fk_user = '{report.UserModel}', fk_project = '{report.ProjectModel}'";

                try
                {
                    tableCmd.ExecuteNonQuery();

                }catch(Exception e)
                {
                    Console.Write(e.Message);
                }
            }
        }
        
        return Redirect("http://localhost:5162/");
    }


}
