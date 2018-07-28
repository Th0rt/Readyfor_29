$(document).on('turbolinks:load', function () {
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
          returns.forEach(function (return_item) {

          });
          // 全リターンのoptionオブジェクト取得
          $('.number-select').each(function () {
            console.log($(this).val());
          });
        }
      })
      .fail(function () {
        alert('リターン価格の取得に失敗しました');
      });
  });
});
