const FollowToggle = require("./follow_toggle.js");

$(".follow-toggle").each(function(){
  new FollowToggle($(this));

})


// $("li").each(function (index) {
//     console.log(index + ": " + $(this).text());
// });