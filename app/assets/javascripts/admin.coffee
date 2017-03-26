$(document).on 'turbolinks:load', () ->
  $('.sortable-list').sortable 
    update: ( event, ui ) ->
      $list = $(event.target)
      $list.addClass('updating')
      
      $.ajax
        method: "POST"
        url:    "/admin/position"
        data:   
          positions: $list.sortable('toArray')
      .done () ->
        $list.removeClass('updating')
