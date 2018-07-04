$(function(){
  $('.filter-item').click(function(){
    $('.filter-list').children().removeClass('selected');
    $(this).addClass('selected')
    console.log(this)
  })

  $('#send-contributor').click(function(){
    $('.select-contributor').slideToggle();
  })
  $('#send-orner').click(function(){
    $('.select-orner').slideToggle();
  })
})

$(function(){
  $('#right-content__email').click(function(){
    $('#user-right-first').addClass('hidden')
    $('#user-right-second').removeClass('hidden')
  })
});
