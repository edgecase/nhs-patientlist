jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
        
  $(".date-picker").datepicker({ dateFormat: "yy-mm-dd" }) 