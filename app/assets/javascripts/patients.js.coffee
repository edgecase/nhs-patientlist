jQuery ($) ->
  $wardForm = $('#ward_form')
  if $wardForm.length > 0
    $wardForm.find('input[type]=submit').hide()
    $wardForm.change ->
      $(@).closest("form").submit() unless $(@).val() is '--'
