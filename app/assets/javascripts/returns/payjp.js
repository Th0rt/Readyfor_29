$(document).on('turbolinks:load', function () {
  var form = $("#new_user_return"),
    card_number = form.find('#card-value'),
    cvc = form.find('#cvc-value'),
    month = form.find('#month-value'),
    year = form.find('#year-value');

  $(form).on('submit', function (e) {
    e.preventDefault();

    form.find("#new_user_return").prop("disabled", true);

    var card = {
      card_number: card_number.value,
      cvc: cvc.value,
      month: month.value,
      year: year.value
    };
    Payjp.setPublicKey('pk_test_0056da6ac88997ee48c98ac8');
    Payjp.createToken(card, function (s, response) {
      if (response.error) {
        // form.find('.payment-errors').text(response.error.message);
        form.find('button').prop('disabled', false);
        alert('決済エラーが発生しました。もう一度やり直してください。');
      }
      else {

        var token = response.id;

        form.append($('<input type="hidden" name="payjpToken" />').val(token));

        console.log(token);
        //form.get(0).submit();
      }
    });
  });
});
