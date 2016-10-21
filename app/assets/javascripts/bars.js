$(function() {
  $("#close-all").on("click", function () {
    console.log("logged");
    alert("All tabs have been closed.")
  });

  $("#discoverable").on("click"), function (){
    console.log("it's been closed");
    var $button = $(this);

  }
  $('.expander-trigger').click(function(){
    $(this).toggleClass("expander-hidden");
  });

})


