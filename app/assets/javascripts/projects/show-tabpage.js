$(document).on('turbolinks:load', function () {
  $('.project-tabs').click(function () {
    var index = $('.project-tabs').index(this);
    $('.tab-content').removeClass('hide');
    $('.tab-content').css('display', 'none');
    $('.tab-content').eq(index).fadeIn();
    $('.project-tabs').removeClass('select');
    $(this).addClass('select')
  });
});
