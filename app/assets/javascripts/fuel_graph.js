
var FuelGraph = {

	getData: function() {
		$.ajax({
			url: '/fuel_graph',
			type: 'GET',
			dataType: 'json',
			success: function(data) {
				console.log(data);
			}
		});
	},

	change: function() {
		var dropdown = d3.select('#state_source')
		var source = dropdown.node().options[dropdown.node().selectedIndex].value;
		d3.json(source, function(json) {
			console.log(source) //Test that the state is passed
		})
	},

	reset: function() {
		d3.select('#state_source').on("change", change)
		change(); //trigger json on load
	}
};

$(document).ready(function() {
	FuelGraph.change();
	FuelGraph.getData();
});