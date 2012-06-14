jQuery ($) ->
  $wardForm = $('#ward_form')
  $wardForm.find('input[type]=submit').hide()
  $wardForm.change ->
    $(@).submit() unless $('select', @).val() is '--'

  $('form.risk-level input[type]=submit').hide()
  $('form.risk-level select').change (event) ->
    $('.ajax-wait', $(this).parent() ).show()
    $(this).submit()
