$(document).ready(function() {
  $("#hidden_ajax").hide();
  $(".up_vote").text("THIS IS A TEST")
  $("body").on("click", ".up_vote, .down_vote", function(e){
    e.preventDefault();
    console.log("CLICK!")
    var ajaxRequest = $.ajax({
      url: '/talks/'+this.id+'/vote',
      type: "GET",
      dataType: "json"
    });
    ajaxRequest.done(function(response){
      console.log("Success");
      if (response.attending === true) {
        $(".up_vote").prop('disabled', true);
        $(".down_vote").prop('disabled', false); //disable by class
      };
      if (response.attending === false) {
        $(".down_vote").prop('disabled', true);
        $(".up_vote").prop('disabled', false);
      };

      $("#vote_counter").text(response.votes + ' out of ' + response.min_votes + ' votes needed!');
      //$("#vote_counter").text('CURRENT ATTENDING STAT: ' + response.attending);
    });

    ajaxRequest.fail(function(response){
      console.log("Fail!");
      $(".upvote").fadeOut();
    });
  });
});
