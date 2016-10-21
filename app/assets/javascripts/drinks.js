$(document).on('turbolinks:load', function() {
  $("#patron-drink-show").on("submit", "form", function () {
    console.log("logged");
    console.log($(this));
    $(this).find('.new-drink').css("background-color", "red");
  });

  $(".patron-drink-show").on("click", ".remove-drink", function () {
    console.log("logged");
    var $itemRow = $(this).closest('.tab-item');
    $itemRow.slideUp();
  });

})
