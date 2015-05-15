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

  $(document).on("click", "#gophooter", function(event){
    $("body").css("background-image", 'url("https://media2.giphy.com/media/tghHsahSrWTEk/200.gif")');
  });

  $(document).on("click", "#moon", function(event){
    console.log("hi");
    $("body").css("background-image", '');
  });

}); // end document ready


