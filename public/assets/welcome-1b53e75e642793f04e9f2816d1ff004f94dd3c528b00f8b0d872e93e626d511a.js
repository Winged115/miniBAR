$(document).ready(function() {
  $('.pour') //miniBAR
    .delay(2000)
    .animate({
      height: '360px'
      }, 1500)
    .delay(1600)
    .slideUp(500);

  $('#liquid') // I Said Fill 'Er Up!
    .delay(3400)
    .animate({
      height: '185px'
    }, 2500);

  $('.beer-foam') // Keep that Foam Rollin' Toward the Top! Yahooo!
    .delay(3400)
    .animate({
      bottom: '195px'
      }, 2500);
  });
