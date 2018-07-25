$(document).on('turbolinks:load', function() {
  $('#panel').on('click', function(){
    $('.header__right-panelNone').toggle();
  })
});
