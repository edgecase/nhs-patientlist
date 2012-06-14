<% if @result %>
  $row = $("tr[data-patient-id=<%= patient.pat_id %>]")
  $row.children()
    .removeClass("medium-risk")
    .removeClass("high-risk")
    .addClass("<%=patient.risk_level%>-risk")
  $('.ajax-wait', $row).hide();
<% end %>
