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

