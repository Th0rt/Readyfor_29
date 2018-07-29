$(document).on('turbolinks:load', function () {
  $("#bank-input").submit(function () {
    if ($("bank_name-form").val() == '') {
      alert('銀行名を入力してください');
      return false;
    } else if ($("branch_office-form").val() == '') {
      alert('支店名を入力してください');
      return false;
    } else if ($("name-form").val() == '') {
      alert('口座氏名を入力してください');
      return false;
    } else if ($("account_number-form").val() == '') {
      alert('口座番号を入力してください');
      return false;
    } else {
      $("#bank-input").submit();
    }
  });
});
