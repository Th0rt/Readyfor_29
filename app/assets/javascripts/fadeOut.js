$(document).on('turbolinks:load', function() {
  $('.header__right-panelNone').hide();
  $('#panel').on('click', function(){
    $('.header__right-panelNone').toggle();
  })
});
