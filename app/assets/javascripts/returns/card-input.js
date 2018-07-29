$(document).on('turbolinks:load', function () {
  $("#card-input").submit(function () {
    if ($("#card-input-form").val() == '') {
      alert('クレジットカード番号を入力してください');
      return false;
    } else if ($("#card-input-form").val().length < 16) {
      alert('クレジットカード番号の16桁が入力されていません');
      return false;
    } else if ($("#cvc-input-form").val() == '') {
      alert('CVCを入力してください');
      return false;
    } else if ($("#cvc-input-form").val().length < 3) {
      alert('CVCの3桁が入力されていません');
      return false;
    } else {
      $("#card-input").submit();
    }
  });

  $('#card-input-form').on('keypress', function () {
    if (this.value.length > 15) {
      this.value = this.value.slice(0, 15);
    }
  });

  $('#cvc-input-form').on('keypress', function () {
    if (this.value.length > 2) {
      this.value = this.value.slice(0, 2);
    }
  });
});
