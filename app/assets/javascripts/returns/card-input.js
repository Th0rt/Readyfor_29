$(document).on('turbolinks:load', function () {
  $("#card-input").submit(function () {
    if ($("input[name='card']").val() == '') {
      alert('クレジットカード番号を入力してください');
      return false;
    } else if ($("input[name='cvc']").val() == '') {
      alert('CVCを入力してください');
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
