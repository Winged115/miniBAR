$(document).on('turbolinks:load', function() {
  var total = $("#total").html();
  $("#twenty").on("click", function() {
    var twenty = Math.round(total * 0.20 * 100) / 100
    $("#tip").val(twenty);
  })
  $("#twenty-five").on("click", function() {
    var twentyFive = Math.round(total * 0.25 * 100) / 100
    $("#tip").val(twentyFive);
  })
  $("#other").on("click", function() {
    $("#tip").val("0.00");
  })

})
;
