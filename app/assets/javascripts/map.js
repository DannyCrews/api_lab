'use strict';

var Boomzilla = {};

$(document).on('ready page:load', function () {
  Boomzilla.drawMap();
});

// Boomzilla.call_ajax = function() {
//   $.ajax({
//   url: '/emitters_map',
//   dataType: 'json',
//   success: function( data ) {
//     Boomzilla.drawPoints(data);
//   }
// });
// };

// Boomzilla.drawPoints = function(emitters) {
//   $.each(emitters), function(index, value) {
//     latitude = this.latitude;
//     longitude = this.longitude;
//     county_id = this.county_id;
//     name = this.facility_name;
//     console.log(name, latitude, longitude, county_id);
//   };
// };

queue()
    .defer(d3.json, 'assets/us-counties.json')
    .defer(d3.json, 'assets/us-states.json')
    .await(Boomzilla.drawMap);

Boomzilla.drawMap = function() {

	var width = 960,
	    height = 500;

	var projection = d3.geo.albersUsa();

	var path = d3.geo.path()
	    .projection(projection);

	var svg = d3.select('#map').append('svg')
	    .attr('id', 'us_map')
	    .attr('width', width)
	    .attr('height', height)
	    .style('border', '2px black solid');

	var counties = svg.append('g')
      .attr('class', 'counties')
      .attr('class', 'Blues');

  var states = svg.append('g')
      .attr('class', 'states');
 
	d3.json('assets/us-counties.json', function(json) {
		counties.selectAll('path')
		  .data(json.features)
		  .enter().append('path')
		  // .attr('class', data ? quantize : null)
		  .attr('d', path);
	});


	d3.json('assets/us-states.json', function(json) {
		states.selectAll('path')
		.data(json.features)
		.enter().append('path')
		.attr('d', path);
	});

	// d3.json('/emitters_map', function(json) {

	//   data = json;
	//   counties.selectAll('path')
	//       .attr('class', quantize);
	// });

	function quantize(d) {
	  return 'q' + Math.min(8, ~~(data[d.id].ch4_emissions_co2e * 9 / 12)) + '-9';
	}


	// var group = svg.append('g');

	// group.attr('transform', 'scale(0.3, 0.3)');

	// d3.json('data/us.json', function(collection) {
	//   group.selectAll('path')
	//      .data(collection.features)
	//      .enter()
	//      .append('path')
	//      .attr('d', d3.geo.path().projection(projection))
	//      .attr('id', function(d){return d.properties.name;})
	//      .style('fill', 'gray')
	//      .style('stroke', 'white')
	//      .style('stroke-width', 1);
	//    }

	// group.append('path')
	// 		 .attr('d', )
	// 		 .style('fill', 'grey')
	// 		 .style('stroke', 'black')
	// 		 .style('stroke-width', 1);



	// Boomzilla.makeMyMap() {
	//     svg.append('g')
	//         .attr('class', 'counties')
	//         .selectAll('path')
	//         .data(topojson.feature(us, us.objects.counties).features)
	//         .enter()
	//         .append('path')
	//         .attr('class', function(d) {return quantize(rateById.get(d.id));})
	//         .attr('d', path);
	//     svg.append('path')
	//         .datum(topojson.mesh(us, us.objects.states, function(a, b) {return a !== b;}))
	//         .attr('class', 'states')
	//         .attr('d', path);
	//     svg.selectAll('circle')
	//        .data(data/Emitters_2011)
	//        .enter()
	//        .append('circle')
	//        .attr('cx', projection([d.latitude]))
	//        .attr('cy', projection([d.longitude]))
	//        .attr('r', 2)
	//        .style('fill', 'red');

	// };

};
