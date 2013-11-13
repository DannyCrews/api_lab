// window on change call ajax
//ajax, go to fuel controller index and fetch me my data, please
// success: show me the data in my chosen format (or alert(data))

var = FuelGraph {}

var FuelGraph.getData = function() {
	$.ajax({
		url: '/fuel_graph',
		type: 'GET',
		dataType: 'json',
		success: function(data) {
			console.log(data);
		}
	});
};

$(document).ready(function() {
	FuelGraph.getData();
});