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

    public RedirectResult Insert(ReportModel report)
    {
        using(MySqlConnection conn = new MySqlConnection("Server=localhost;Database=TodoDB;Uid=cp;Pwd=4blat!vO"))
        {
            using(var tableCmd = conn.CreateCommand())
            {
                conn.Open();
                tableCmd.CommandText = "INSERT INTO reports(DATE, HOUR_START, HOUR_END, FK_USER, FK_PROJECT) VALUES"
                + $"('{report.Date}', '{report.HourStart}', '{report.HourEnd}', '{report.UserModel.Id}', '{report.ProjectModel.Id}')";

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
}
