$(document).on('turbolinks:load', function () {
  $('#project-image').change(function () {
    var file = this.querySelector('input[type=file]').files[0];
    var reader = new FileReader();
    reader.onload = function () {
      var img_src = $('#project-img-show').attr('src', reader.result);
      $('#project-img-show').html(img_src);
    }
    reader.readAsDataURL(file);
  })
});
