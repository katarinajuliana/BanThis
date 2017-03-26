$(document).on 'turbolinks:load', () ->
  $('#edit-person, #cancel-edit-person').on 'click', (e) ->
    e.preventDefault()
    $('.form, .buttons').toggleClass('hidden')
  
  $page_through = $('.page-through-link')
  if $page_through.length
    $content = $('.content')
          
    scroll_listener = (e) ->
      scroll_pos = $('body').scrollTop()
      $page_through.addClass('hide')
      setTimeout( () ->  
        if scroll_pos == $('body').scrollTop()
          if scroll_pos < $content.width() * 0.66 - $content.position().top + 60
            $page_through.addClass('hide')
          else
            $page_through.removeClass('hide')
      , 200)
            
    $(window).on 'scroll', $.throttle(250, scroll_listener)
