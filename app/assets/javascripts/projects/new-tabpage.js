$(function () {
  //タブクリック時の処理
  $('#new-project .col-sm-2 .nav-sidebarul .nav.tabs li').click(function () {
    //.index()を使いクリックされたタブの順番を変数indexに代入する
    var index = $('#new-project .col-sm-2 .nav-sidebarul .nav.tabs li').index(this);
    //指定した全コンテンツを非表示にする
    $('.project-tabpage').css('display', 'none');
    //クリックされたタブと同じ順番のコンテンツのみを表示させる
    $('.project-tabpage').eq(index).css('display', 'block');
  });
});
