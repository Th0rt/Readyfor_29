$(document).on('turbolinks:load', function () {
  function buildHTML(return_item, number) {
    var html = `<p>
                  <span>
                    ${return_item.price}円 × ${number}個
                  </span>
                </p>`;
    return html;
  }

  $('.number-select').change(function () {
    // リターンのIDを取得
    var return_id_str = $(this).attr("id");
    var regExp = new RegExp("number_", "g");
    var return_id = parseInt(return_id_str.replace(regExp, ""), 10);
    // リターンの数量を取得
    var return_number = parseInt($(this).val(), 10);

    var sum = 0;

    $.ajax({
      type: "GET",
      data: {
        return_id: return_id,
        return_number: return_number
      },
      dataType: "json",
      processData: false,
      contentType: false
    })
      .done(function (returns) {
        if (returns.length !== 0) {
          var return_item_hashs = {};

          returns.forEach(function (return_item) {
            return_item_hashs[return_item.id] = return_item;
          });

          $('#return-price-list').text("");

          $('.number-select').each(function (index) {
            var return_id_str = $(this).attr("id");
            var regExp = new RegExp("number_", "g");
            var return_id = parseInt(return_id_str.replace(regExp, ""), 10);
            var number = parseInt($(this).val(), 10);
            if (number != 0) {
              var html = buildHTML(return_item_hashs[return_id], number);
              $('#return-price-list').append(html);
              sum += return_item_hashs[return_id].price * number;
              $(`#return-check-image${return_item_hashs[return_id].id}`).addClass('return-check-image-show');
              $(`#return-price-text${return_item_hashs[return_id].id}`).addClass('return-price-text-blue');
            } else {
              $(`#return-check-image${return_item_hashs[return_id].id}`).removeClass('return-check-image-show');
              $(`#return-price-text${return_item_hashs[return_id].id}`).removeClass('return-price-text-blue');
            }
          });

          // 合計金額表示
          $('#return-sum').text(`${sum}円`);
        }
      })
      .fail(function () {
        alert('リターン価格の取得に失敗しました');
      });
  });

  $('#choice-form').on('submit', function (e) {
    e.preventDefault();

    var sum_str = $('#return-sum').text();
    var regExp = new RegExp("円", "g");
    var sum = parseInt(sum_str.replace(regExp, ""), 10);

    if (sum != 0) {
      $('#choice-form').get(0).submit();
    } else {
      $('#choice-form').prop("disabled", true);
      alert('合計金額が0円です。リターンの数量を選択してください。');
    }
  });
});
