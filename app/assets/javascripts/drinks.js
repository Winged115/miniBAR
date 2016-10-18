$(document).on('turbolinks:load', function() {
  $("form").on("submit", function () {
    console.log("logged");
    console.log($(this));
    $(this).find('.new-drink').css("background-color", "red");
  });

  $("ul").on("click", "#remove-drink", function () {
    console.log("logged");
    var $listItem = $(this).closest('li');
    console.log($listItem);
    $listItem.fadeOut("slow");
  });

})
