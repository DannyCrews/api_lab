# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
var Boomzilla = {};

$(function(){
  Boomzilla.get_data();
}),

Boomzilla.get_data = function(){
	$.ajax({
    type: "GET",
    url: "/facilities.js",
    dataType: "json",
    success: function(data){
      Boomzilla.render_json(data);
    }        
	});
};

Boomzilla.render_json = function(data){
  console.log(data)
};