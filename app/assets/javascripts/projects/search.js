$(document).on('turbolinks:load', function(){
  function changecolor(id){
    $(id).hover(function(){
      $(this).css('color', '#FFA500')
    },function(){
      $(this).css('color' , '')
    });
  }
  changecolor('#search-project')
  changecolor('#search-category')
  changecolor('#search-area')
});
