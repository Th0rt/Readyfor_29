$(function () {
  $('ul.tabs li').click(function () {
    var index = $('.tabs li').index(this);
    $('.tab-content').removeClass('hide');
    $('.tab-content').css('display', 'none');
    $('.tab-content').eq(index).fadeIn();
    $('.tabs li').removeClass('select');
    $(this).addClass('select')
  });
});
