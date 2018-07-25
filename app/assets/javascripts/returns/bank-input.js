$(document).on('turbolinks:load', function () {
  $("#bank-input").submit(function () {
    if ($("input[name='bank_name']").val() == '') {
      alert('銀行名を入力してください');
      return false;
    } else if ($("input[name='branch_office']").val() == '') {
      alert('支店名を入力してください');
      return false;
    } else if ($("input[name='name']").val() == '') {
      alert('口座氏名を入力してください');
      return false;
    } else if ($("input[name='account_number']").val() == '') {
      alert('口座番号を入力してください');
      return false;
    } else {
      $("#bank-input").submit();
    }
  });
});
