$(document).on('turbolinks:load', function () {
  $("#bank-input").submit(function () {
    if ($("#bank_name-form").val() == '') {
      alert('銀行名を入力してください');
      return false;
    } else if ($("#branch_office-form").val() == '') {
      alert('支店名を入力してください');
      return false;
    } else if ($("#name-form").val() == '') {
      alert('口座氏名を入力してください');
      return false;
    } else if ($("#account_number-form").val() == '') {
      alert('口座番号を入力してください');
      return false;
    } else if ($("#account_number-form").val().length < 7) {
      alert('口座番号が7桁入力されていません');
      return false;
    } else {
      $("#bank-input").submit();
    }
  });
  $('#account_number-form').on('keypress', function () {
    if (this.value.length > 6) {
      this.value = this.value.slice(0, 6);
    }
  });
});
