$(document).on('turbolinks:load', function () {
  $('.number-select').change(function () {
    // リターンのIDを取得
    var return_id_str = $(this).attr("id");
    var regExp = new RegExp("number_", "g");
    var return_id = return_id_str.replace(regExp, "");
    // リターンの数量を取得
    var return_number = $(this).val();

    // 対象リターンからpriceを取得する
    $.ajax({
      type: "GET",
      data: {
        return_id: return_id,
        return_number: return_number
      },
      dataType: "json"
    })
      .done(function (datas) {
        if (datas.length !== 0) {
          datas.forEach(function (data) {

            // 選択されているリターン
            // リターンの合計値表示
          });
        }
      })
      .fail(function () {
        alert('リターン価格の取得に失敗しました');
      });
  });
});
