using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using MySqlConnector;
using rapporti.Models;

namespace rapporti.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
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

    public void Insert(ReportModel report)
    {
        using(MySqlConnection conn = new MySqlConnection("Server=localhost;Database=tecnical_call;"))
        {
            using(var tableCmd = conn.CreateCommand())
            {
                conn.Open();
                tableCmd.CommandText = "INSERT INTO reports(DATE, HOUR_START, HOUR_END, FK_USER, FK_PROJECT) VALUES"
                + $"('{report.Date}', '{report.HourStart}', '{report.HourEnd}', (SELECT ID FROM users ORDER BY RAND() LIMIT 1), {report.ProjectModel.Id})";

                try
                {
                    tableCmd.ExecuteNonQuery();
                }catch(Exception e)
                {
                    Console.WriteLine(e.Message);
                }
            }
        }
    }
}
