$(function() {
  $("form").on("submit", function () {
    console.log("logged");
    console.log($(this));
    $(this).find('.new-drink').css("background-color", "red");
  });

})
