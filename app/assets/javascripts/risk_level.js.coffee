$ ->
  $(".patient_detail").each (i, row) ->
    risk_level = $(row).find("select").val()
    $(row).find("td").removeClass("medium-risk").removeClass("high-risk").addClass("#{risk_level}-risk")
