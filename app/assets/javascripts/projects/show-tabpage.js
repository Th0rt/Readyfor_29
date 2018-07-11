$(function () {
  $('ul.project-tabs li').click(function () {
    var index = $('ul.project-tabs li').index(this);
    $('.tab-content').removeClass('hide');
    $('.tab-content').css('display', 'none');
    $('.tab-content').eq(index).fadeIn();
    $('ul.project-tabs li').removeClass('select');
    $(this).addClass('select')
  });
});
