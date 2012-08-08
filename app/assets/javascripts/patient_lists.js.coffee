jQuery ($) ->
  $('#new_own_patient_list').bind
    'ajax:before': (event) ->
      $('input[type="submit"]', event.target).attr 'disabled', 'true'
      #disable submit button
    'ajax:success': (event, data) ->
      $('.error', event.target).removeClass 'error'
      $('div.messages', event.target).html ''
      $("""<li><a href="/users/#{data['user_id']}/patient_lists/#{data['id']}">#{data['name']}</a></li>""").appendTo '#patient-list-index'
    'ajax:error': (event, data) ->
      $('div.messages', event.target).text JSON.parse(data['responseText'])['name']
      $('#new-list-name', event.target).addClass 'error'
    'ajax:complete': (event) ->
      $('input[type="submit"]', event.target).removeAttr 'disabled'

  $('#main table tr').draggable
    helper: (event) ->
      $target = $(event.target).closest('tr')
      $("""<div class="dragging"></div>""")
        .append($target.find('td:eq(3)').clone())
        .insertAfter('#main table')
    scope: 'patient'
    cursor: 'move'
    cursorAt:
      top: -5
      left: -5
    revert: 'invalid'
  $('#sidebar ul li a').droppable
    scope: 'patient'
    tolerance: 'pointer'
    hoverClass: 'drop-hover'
    drop: (event, ui) ->
      console.log event
