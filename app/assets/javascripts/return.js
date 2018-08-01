//returnの画像を追加した際に、画像を表示する
$(document).on('turbolinks:load', function(){
  $('#create-return-image').change(function(){
    $('#return-image-default').remove();
    var file = $(this).prop('files')[0];
    var reader = new FileReader();
    reader.onload = function(){
      var img_src = $('<img>').attr('src', reader.result);
      $('#return-image-show').html(img_src);
    }
    reader.readAsDataURL(file);
  });
  $('.remove-new-return').on("click",function(){
    $(this).parent().parent('.return-fields').html('');
  })
});
