$(document).on('turbolinks:load', function(){
  // メッセージ作成の送信先の表示切り替え
  $(function(){
    $('#send-contributor').click(function(){
      $('.select-contributor').slideToggle();
    })
    $('#send-orner').click(function(){
      $('.select-orner').slideToggle();
    })
  })

  //sign-upページの新規登録の赤タブをクリックした際に発火
  $(function(){
    $('#right-content-email').click(function(){
      $('#user-right-first').addClass('hidden')
      $('#user-right-second').removeClass('hidden')
    })
  });

  //関数化
  $(function(){
    function editButton(button, explain, edit){
      $(button).click(function(){
        $(explain).toggleClass('hidden');
        $(edit).toggleClass('hidden');
        var result = $(button)[0].innerText
        if ( result === '編集' ){
          $(button).text('キャンセル')
        }else{
          $(button).text('編集')
        }
      })
    }
    // 名前(ニックネーム)編集ボタン
    editButton("#nickname-edit-button", "#user-nickname-explain", "#user-edit-nickname");
    // メールアドレス編集ボタン
    editButton("#email-edit-button", "#user-email-explain","#user-edit-email");
    //パスワード編集ボタン
    editButton("#password-edit-button","#user-password-explain","#user-edit-password");
    //プロフィール編集ボタン
    editButton("#content-edit-button","#user-content-explain","#user-edit-content");
    //プロフィール画像編集ボタン
    editButton("#image-edit-button","#user-image-explain","#user-edit-image");
    //表示するWebサイト
    editButton("#website-edit-button","#website-image-explain","#user-edit-website");
    //支援情報の公開
    editButton("#return-edit-button","#user-return-explain","#user-edit-return");
    editButton("#alertmail-edit-button","#user-alertmail-explain","#user-edit-alertmail");
  })
});
