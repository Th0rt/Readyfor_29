// マイページの左側のタグの色の切り替え
$(function(){
  $('.filter-item').click(function(){
    $(this).addClass('selected')
  })
  $('.mypage-edit').click(function(){
    $('.filter-list').children().removeClass('selected');
  })
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

// 名前(ニックネーム)編集ボタン
$(function(){
  $("#nickname-edit-button").click(function(){
    $("#user-nickname-explain").toggleClass('hidden');
    $("#user-edit-nickname").toggleClass('hidden');
    var result = document.getElementById("nickname-edit-button").textContent
    console.log(result)
    if (result  === "編集" ){
      $("#nickname-edit-button").text('キャンセル')
    }
    else{
      $("#nickname-edit-button").text("編集")
    }
  })
})

// メールアドレス編集ボタン
$(function(){
  $("#email-edit-button").click(function(){
    $("#user-email-explain").toggleClass('hidden');
    $("#user-edit-email").toggleClass('hidden');
    var result = document.getElementById("email-edit-button").textContent
    console.log(result)
    if (result  === "編集" ){
      $("#email-edit-button").text('キャンセル')
    }
    else{
      $("#email-edit-button").text("編集")
    }
  })
})

//パスワード編集ボタン
$(function(){
  $("#password-edit-button").click(function(){
    $("#user-password-explain").toggleClass('hidden');
    $("#user-edit-password").toggleClass('hidden');
    var result = document.getElementById("password-edit-button").textContent
    console.log(result)
    if (result  === "編集" ){
      $("#password-edit-button").text('キャンセル')
    }
    else{
      $("#password-edit-button").text("編集")
    }
  })
})

//プロフィール編集ボタン
$(function(){
  $("#content-edit-button").click(function(){
    $("#user-content-explain").toggleClass('hidden');
    $("#user-edit-content").toggleClass('hidden');
    var result = document.getElementById("content-edit-button").textContent
    console.log(result)
    if (result  === "編集" ){
      $("#content-edit-button").text('キャンセル')
    }
    else{
      $("#content-edit-button").text("編集")
    }
  })
})


//プロフィール画像編集ボタン
$(function(){
  $("#image-edit-button").click(function(){
    $("#user-image-explain").toggleClass('hidden');
    $("#user-edit-image").toggleClass('hidden');
    var result = document.getElementById("image-edit-button").textContent
    console.log(result)
    if (result  === "編集" ){
      $("#image-edit-button").text('キャンセル')
    }
    else{
      $("#image-edit-button").text("編集")
    }
  })
})

//表示するWebサイト
$(function(){
  $("#website-edit-button").click(function(){
    $("#website-image-explain").toggleClass('hidden');
    $("#user-edit-website").toggleClass('hidden');
    var result = document.getElementById("website-edit-button").textContent
    console.log(result)
    if (result  === "編集" ){
      $("#website-edit-button").text('キャンセル')
    }
    else{
      $("#website-edit-button").text("編集")
    }
  })
})

//支援情報の公開
$(function(){
  $("#return-edit-button").click(function(){
    $("#user-return-explain").toggleClass('hidden');
    $("#user-edit-return").toggleClass('hidden');
    var result = document.getElementById("return-edit-button").textContent
    console.log(result)
    if (result  === "編集" ){
      $("#return-edit-button").text('キャンセル')
    }
    else{
      $("#return-edit-button").text("編集")
    }
  })
})

//メール通知設定
$(function(){
  $("#alertmail-edit-button").click(function(){
    $("#user-alertmail-explain").toggleClass('hidden');
    $("#user-edit-alertmail").toggleClass('hidden');
    var result = document.getElementById("alertmail-edit-button").textContent
    console.log(result)
    if (result  === "編集" ){
      $("#alertmail-edit-button").text('キャンセル')
    }
    else{
      $("#alertmail-edit-button").text("編集")
    }
  })
})
