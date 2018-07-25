// 通知表示後、一定時間経過で非表示にする。
$(document).on('turbolinks:load', function () {
  setTimeout(function () {
    $('#flash').remove();
  }, 3000);
});
