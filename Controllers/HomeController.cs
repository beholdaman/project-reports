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

    public IActionResult HoursReport()
    {
        var l = GetAllHours();
        return View(l);
    }

    public IActionResult MonthReport(int month)
    {
        var l = GetAllAveragesByEmployee(month);
        return View(l);
    }

    public IActionResult MonthReportByTask(int month)
    {
        var l = GetAllAveragesByTask(month);
        return View(l);
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
                + $"('{report.Date.ToString("yyyy-MM-dd")}', '{report.HourStart}', '{report.HourEnd}', '{report.UserModel}', '{report.ProjectModel}');";
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

     internal HoursViewModel GetAllHours()
    {
        List<HoursModel> l = new();

        using(MySqlConnection conn = new MySqlConnection("Server=localhost;Database=tecnical_call;Uid=root;Pwd=4blat!vO"))
        {
            using(var tableCmd = conn.CreateCommand())
            {
                conn.Open();
                tableCmd.CommandText = $"SELECT id, number, description, exp_hours, act_hours + act_hours_tasks FROM projects;";

                using(var reader = tableCmd.ExecuteReader())
                {

                    if(reader.HasRows)
                    {
                        while(reader.Read())
                        {
                            l.Add(new HoursModel{
                               Id = reader.GetInt32(0),
                                Number = reader.GetString(1),
                                Description = reader.GetString(2),
                                ExpectedHours = reader.GetFloat(3),
                                ActualTotalHours = reader.GetFloat(4)
                            });
                        }
                    }
                    else
                    {
                        return new HoursViewModel{HoursList = l};
                    }
                
                }
            }

            
        }

        return new HoursViewModel{HoursList = l};
    }

     internal AverageByEmployeeViewModel GetAllAveragesByEmployee(int month)
    {
        List<AverageByEmployeeModel> l = new();

        using(MySqlConnection conn = new MySqlConnection("Server=localhost;Database=tecnical_call;Uid=root;Pwd=4blat!vO"))
        {
            using(var tableCmd = conn.CreateCommand())
            {
                conn.Open();
                tableCmd.CommandText = $"SELECT reports.fk_user, users.name, users.surname, SUM(HOUR(SUBTIME(hour_end, hour_start)) + ( MINUTE(SUBTIME(hour_end, hour_start))/60 ))/22 FROM reports JOIN projects ON reports.fk_project = projects.id JOIN users ON reports.fk_user = users.id WHERE MONTH(date) = '{month}' AND YEAR(date) = '2022' GROUP BY reports.fk_user";
                using(var reader = tableCmd.ExecuteReader())
                {

                    if(reader.HasRows)
                    {
                        while(reader.Read())
                        {
                            l.Add(new AverageByEmployeeModel{
                               Id = reader.GetInt32(0),
                               Name = reader.GetString(1),
                               Surname = reader.GetString(2),
                               AverageHoursByDay = reader.GetFloat(3)
                            });
                        }
                    }
                    else
                    {
                        return new AverageByEmployeeViewModel{AverageByEmployeeModels = l};
                    }
                
                }
            }

            
        }

        return new AverageByEmployeeViewModel{AverageByEmployeeModels = l};
    }


     internal AverageByTaskViewModel GetAllAveragesByTask(int month)
    {
        List<AverageByTaskModel> l = new();

        using(MySqlConnection conn = new MySqlConnection("Server=localhost;Database=tecnical_call;Uid=root;Pwd=4blat!vO"))
        {
            using(var tableCmd = conn.CreateCommand())
            {
                conn.Open();
                tableCmd.CommandText = $@"WITH RECURSIVE gerarchia AS (
                                                SELECT ID AS id_antenato, ID AS id_discendente
                                                FROM projects

                                                UNION ALL

                                                SELECT g.id_antenato, p.ID
                                                FROM gerarchia g
                                                JOIN projects p ON p.FK_PROJECT = g.id_discendente
                                            )
                                            SELECT
                                                p.ID,
                                                p.NUMBER,
                                                p.description,
                                                ROUND(
                                                    COALESCE(SUM(TIME_TO_SEC(TIMEDIFF(r.HOUR_END, r.HOUR_START))) / 3600, 0) / 22,
                                                2) AS ore_medie_per_giorno_lavorativo
                                            FROM projects p
                                            JOIN gerarchia g
                                                ON g.id_antenato = p.ID
                                            LEFT JOIN reports r
                                                ON r.FK_PROJECT = g.id_discendente
                                                AND MONTH(r.date) = {month}
                                            GROUP BY p.ID, p.NUMBER
                                            ORDER BY p.ID;";
                using(var reader = tableCmd.ExecuteReader())
                {

                    if(reader.HasRows)
                    {
                        while(reader.Read())
                        {
                            l.Add(new AverageByTaskModel{
                               Id = reader.GetInt32(0),
                               Number = reader.GetString(1),
                               Description = reader.GetString(2),
                               AverageHoursByDay = reader.GetFloat(3)
                            });
                        }
                    }
                    else
                    {
                        return new AverageByTaskViewModel{AverageByTaskModels = l};
                    }
                
                }
            }

            
        }

        return new AverageByTaskViewModel{AverageByTaskModels = l};
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
                tableCmd.CommandText = $"SELECT * FROM reports WHERE id = '{id}'";

                using(var reader = tableCmd.ExecuteReader())
                {

                    if(reader.HasRows)
                    {
                        reader.Read();
                        report.Id = reader.GetInt32(0);
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
                tableCmd.CommandText = $"UPDATE reports SET date = '{report.Date.ToString("yyyy-MM-dd")}', hour_start = '{report.HourStart}', hour_end = '{report.HourEnd}', fk_user = '{report.UserModel}', fk_project = '{report.ProjectModel}'"
                        + $"WHERE id = '{report.Id}'";

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
