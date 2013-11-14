
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
	}

};

$(function() {
	var dropdown = d3.select('#state_source');
	dropdown.on('change', FuelGraph.change)
	FuelGraph.change();
	FuelGraph.change();
	FuelGraph.getData();
});