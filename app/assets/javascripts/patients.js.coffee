jQuery ($) ->
  $wardForm = $('#ward_form')
  $wardForm.find('input[type="submit"]').hide()
  $wardForm.change ->
    $(@).submit() unless $('select', @).val() is ''

  $('form.risk-level input[type]=submit').hide()
  $('form.risk-level select').change (event) ->
    console.log event
    $riskForm = $(this).closest('form')
    $ajaxWait = $('.ajax-wait', $(this).parent() )
    $ajaxWait.show()
    $riskForm.bind 'ajax:error', ->
      alert "There was a problem. Reloading."
      location.reload()
    $riskForm.bind 'ajax:complete', ->
      $ajaxWait.hide()
    $riskForm.submit()
