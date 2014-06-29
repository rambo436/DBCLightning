$(document).ready(function() {
  $("#hidden_ajax").hide();
  $(".container").on("click", ".upvote", function(e){
    e.preventDefault();
    var ajaxRequest = $.ajax({
      url: '/talks/'+this.id+'/vote',
      type: "GET",
      dataType: "json"
    });
    ajaxRequest.done(function(response){
      console.log("Success");
      $(".upvote").fadeOut();
      $("#hidden_ajax").fadeIn();
      $("#vote_counter").text(response.votes + ' out of ' + response.min_votes + ' votes to go live!')
      if (response.votes >= response.min_votes) {
        $("#vote_counter").text('Lightning! ' + response.votes + ' out of ' + response.min_votes + " votes - we're live!")
      }
    });
    ajaxRequest.fail(function(response){
      console.log("Fail!");
      $(".upvote").fadeOut();
    });
  });
});
