$(document).ready(function() {
  $("#hidden_ajax").hide();
  $(".container").on('click', '.up_vote, .down_vote', function(e){
    e.preventDefault();
    var ajaxRequest = $.ajax({
      url: '/talks/'+this.id+'/vote',
      type: "GET",
      dataType: "json"
    });
    ajaxRequest.done(function(response){
      console.log("Success");
      if (response.attending == true) {
        $(".up_vote").prop('disabled', true); //disable by class
      };
      if (response.attending == false) {
        $(".down_vote").prop('disabled', true);
      };

      $("#vote_counter").text(response.votes + ' out of ' + response.min_votes + ' votes needed!');

    });

    ajaxRequest.fail(function(response){
      console.log("Fail!");
      $(".upvote").fadeOut();
    });
  });
});
