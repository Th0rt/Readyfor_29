$(document).on('turbolinks:load', function () {
  var card_form = $("#card-form");
  var number = $('#card-value');
  var cvc = $('#cvc-value');
  var exp_month = $('#month-value');
  var exp_year = $('#year-value');

  card_form.on('submit', function (e) {
    e.preventDefault();

    var card_info = {
      number: parseInt(number.val(), 10),
      cvc: parseInt(cvc.val(), 10),
      exp_month: parseInt(exp_month.val(), 10),
      exp_year: parseInt(exp_year.val(), 10)
    };
    Payjp.setPublicKey('pk_test_73109378c09cd7848903ae5f');
    Payjp.createToken(card_info, function (s, response) {
      if (response.error) {
        alert('決済エラーが発生しました。もう一度やり直してください。');
        card_form.append($('<input type="hidden" name="payjpToken" />').val(''));
      }
      else {
        var token = response.id;
        card_form.append($('<input type="hidden" name="payjpToken" />').val(token));
      }
      card_form.get(0).submit();
    });
  });
});
