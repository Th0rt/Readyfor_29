$(function () {
  //クリックしたときのファンクションをまとめて指定
  $('ul.tabs li').click(function () {
    //.index()を使いクリックされたタブが何番目かを調べ、
    //	indexという変数に代入します。
    var index = $('.tabs li').index(this);

    $('.tab-content').removeClass('hide');

    //コンテンツを一度すべて非表示にし、
    $('.tab-content').css('display', 'none');

    //クリックされたタブと同じ順番のコンテンツを表示します。
    $('.tab-content').eq(index).fadeIn();

    //タブについているクラスselectを消し、
    $('.tabs li').removeClass('select');

    //クリックされたタブのみにクラスselectをつけます。
    $(this).addClass('select')
  });
});
