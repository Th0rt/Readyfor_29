$(document).on('turbolinks:load', function () {
  var form = $("#new_user_return");
  var number = $('#card-value');
  var cvc = $('#cvc-value');
  var exp_month = $('#month-value');
  var exp_year = $('#year-value');

  form.on('submit', function (e) {
    e.preventDefault();

    var card_info = {
      number: parseInt(number.val(), 10),
      cvc: parseInt(cvc.val(), 10),
      exp_month: parseInt(exp_month.val(), 10),
      exp_year: parseInt(exp_year.val(), 10)
    };
    Payjp.setPublicKey('pk_test_0056da6ac88997ee48c98ac8');
    Payjp.createToken(card_info, function (s, response) {
      if (response.error) {
        alert('決済エラーが発生しました。もう一度やり直してください。');
        form.append($('<input type="hidden" name="payjpToken" />').val(''));
      }
      else {
        var token = response.id;
        form.append($('<input type="hidden" name="payjpToken" />').val(token));
      }
      form.get(0).submit();
    });
  });
});
