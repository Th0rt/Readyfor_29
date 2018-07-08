$(function () {
  //画像選択(あとで実装)
  $('#project-image').change(function () {
    var file = this.querySelector('input[type=file]').files[0];
    console.log(file);
  })
});
