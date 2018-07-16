$(document).on('turbolinks:load',function(){
  function change_background(item){
    $(item).hover(function(){
      $(this).css('background-color', '#FFA500')
      $(this).find('a').css('color', 'white')
      $(this).find('i').css('color', 'white')
    },function(){
      $(this).css('background-color', '')
      $(this).find('a').css('color', '')
      $(this).find('i').css('color', '')
    });
  }
  change_background('.nav-menu-item')
});
