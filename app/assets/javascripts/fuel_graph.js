// JS for the FuelGraph to add an event listener to the state dropdown and to pull per state data.
var FuelGraph = {

	getData: function(state_abbr) {
		$.ajax({
			url: '/fuel_graph',
			data: {state_abbr: state_abbr},
			type: 'GET',
			dataType: 'json',
			success: function(data) {
				console.log(data);
			}
		});
	},

	change: function() {
		var dropdown = d3.select('#state_source');
		var state_abbr = dropdown.node().options[dropdown.node().selectedIndex].value;
		d3.json(state_abbr, function(json) {
			console.log(state_abbr); //Test that the state is passed
				FuelGraph.getData(state_abbr);

		})
	}

};

$(function() {
	var dropdown = d3.select('#state_source');
	dropdown.on('change', FuelGraph.change)
	FuelGraph.change();
});