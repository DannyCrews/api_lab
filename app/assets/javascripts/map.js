'use strict';

var width = 960,
    height = 500;

var rateById = d3.map();

var quantize = d3.scale.quantize()
    .domain([0, .15])
    .range(d3.range(9).map(function(i) { return 'q' + i + "-9"; }));

var path = d3.geo.path();

var svg = d3.select("body").append("svg")
    .attr("width", width)
    .attr("height", height);

queue()
    .defer(d3.json, "data/us.json")
    .defer()

// var usMap = SimpleMapD3({
//     container: '.simple-map-d3-us-map',
//     datasource: './data/us-counties.json',
//     tooltipOn: false,
//     styles: {
//       stroke: '#EDEDED',
//       fill: '#232323'
//     }
//   });