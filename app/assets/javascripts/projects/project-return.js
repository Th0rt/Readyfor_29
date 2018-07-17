$(document).on('turbolinks:load',function(){
  function change_button(button){
    $(button).hover(function(){
      $(this).css('box-shadow', 'none')
    },function(){
      $(this).css('box-shadow', '0 2px rgba(0,0,0,0.2)')
    });
  }
  change_button('.project-return__purchase .project-select-button')
});
