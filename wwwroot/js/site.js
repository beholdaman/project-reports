// Please see documentation at https://learn.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
function deleteReport(r) {
    $.ajax({
        url: "Home/DeleteReport",
        type: "POST",
        data: {
            id: r
        },
        success: function() {
            window.location.reload();
        }
    })
}

function updateReport(r) {
    $.ajax({
        url: "Home/UpdateReport",
        type: "GET",
        data: {
            id: r
        },
        datatype: "JSON",
        success: function(response) {
           $('#Report_Id').val(response.id),
           $('#Report_Date').val(response.date),
           $('#Report_HourStart').val(response.hourStart),
           $('#Report_HourEnd').val(response.hourEnd),
           $('#Report_UserModel').val(response.userModel),
           $('#Report_ProjectModel').val(response.projectModel);

           $('#form-button').val("Update Report"),
           $('#form-action').attr('action', "Home/UpdateReport")

        }

    })

}