$(document).on('turbolinks:load', function () {
  function buildHTML(return_item, number) {
    var html = `<p>
                  <span>
                    ${return_item.price} × ${number}個
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

    // 対象リターンからpriceを取得する
    $.ajax({
      type: "GET",
      data: {
        return_id: return_id,
        return_number: return_number
      },
      dataType: "json"
    })
      .done(function (returns) {
        if (returns.length !== 0) {
          $('#return-price-list').text("");

          $('.number-select').each(function (index) {
            //リターンの数量
            var number = parseInt($(this).val(), 10);
            if (number != 0) {
              var html = buildHTML(returns[index], number);
              $('#return-price-list').append(html);
              sum += returns[index].price * number;
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
});
