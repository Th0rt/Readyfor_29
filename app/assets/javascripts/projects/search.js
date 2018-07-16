$(document).on('turbolinks:load', function(){
  function changecolor(id){
    $(id).hover(function(){
      $(this).css('color', '#FFA500')
    },function(){
      $(this).css('color' , '')
    });
  }

  function change_background(item){
    $(item).hover(function(){
      $(this).css('background-color', '#FFA500')
      $(this).find('a').css('color', 'white')
      $(this).find('i').css('color', 'white')
    },function(){
      $(this).css('background-color' , '')
      $(this).find('a').css('color', '')
      $(this).find('i').css('color', '')
    });
  }
  changecolor('#search-category')
  changecolor('#search-area')
  change_background(".nav-menu-item")
});


