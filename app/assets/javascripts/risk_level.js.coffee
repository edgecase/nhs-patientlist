$ ->
  $(".patient_detail").each (i, row) ->
    $(row).find("select").change (evt) ->
      risk_level = $(this).val()
      $(row).find("td").removeClass("medium-risk").removeClass("high-risk").addClass("#{risk_level}-risk")