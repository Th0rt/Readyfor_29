$(document).on('turbolinks:load', function () {
  $('#project-image').change(function () {
    $('#project-img-default').remove();
    var file = $(this).prop('files')[0];
    var reader = new FileReader();
    reader.onload = function () {
      var img_src = $('<img>').attr('src', reader.result);
      $('#project-img-show').html(img_src);
    }
    reader.readAsDataURL(file);
  })
});
