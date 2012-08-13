_.templateSettings =
  interpolate: /\{\{([\s\S]+?)\}\}/g

jQuery ($) ->
  window.Templates =
    alert:         _.template( $('#alert').html() )
    patientList:   _.template( $('#patient-list').html() )
    patientHelper: _.template( $('#patient-helper').html() )
