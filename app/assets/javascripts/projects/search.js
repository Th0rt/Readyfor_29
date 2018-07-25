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
  function show_tabs(tab){
    $(tab).hover(function(){
      $(this).find('.subdivision-links').toggle();
    },function(){
      $(this).find('.subdivision-links').toggle();
    });
  }
  function link_opacity(area_link){
    $(area_link).hover(function(){
      $(this).css('background', '#FFCC33' )
    },function(){
      $(this).css('background', '#FFA500')
    });
  }
  change_background('.show-links')
  show_tabs('.show-links')
  link_opacity('.subdivision-links .nav-menu-item')
});
