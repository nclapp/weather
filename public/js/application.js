$(document).ready(function() {

  $(document).on("click", "#radar", function(event){
    $.ajax({
      url: "/rage"
    })
      .success(function(response){
        $("#radar").replaceWith(response);
      })
  })

  $(document).on("click", "#cagerage", function(event){
    $.ajax({
      url: "/radar"
    })
      .success(function(response){
        $("#cagerage").replaceWith(response);
      })
  })

}); // end document ready


