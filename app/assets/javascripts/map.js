'use strict';
'use strict';
var map, pointarray, heatmap;


var setEmitterPoints = function(data) {
	var emitterData = [];

	for (var i = 0; i < data.length ; i ++ ) {
	  emitterData.push(new google.maps.LatLng(data[i].latitude, data[i].longitude));
	  i += 1;
	 }
};

$.ajax({
  type: 'GET',
  dataType: 'json',
  url: '/emitters_data',
  success: function(data){
    alert(data);
    setEmitterPoints(data);
  }
});




function initialize() {


  var mapOptions = {
    zoom: 4,
    center: new google.maps.LatLng(37.774546, -100.433523),
    mapTypeId: google.maps.MapTypeId.SATELLITE
  };

  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);

  var pointArray = new google.maps.MVCArray(emitterData);

  heatmap = new google.maps.visualization.HeatmapLayer({
    data: pointArray
  });

  heatmap.setMap(map);

}

function toggleHeatmap() {
  heatmap.setMap(heatmap.getMap() ? null : map);
}

function changeGradient() {
  var gradient = [
    'rgba(0, 255, 255, 0)',
    'rgba(0, 255, 255, 1)',
    'rgba(0, 191, 255, 1)',
    'rgba(0, 127, 255, 1)',
    'rgba(0, 63, 255, 1)',
    'rgba(0, 0, 255, 1)',
    'rgba(0, 0, 223, 1)',
    'rgba(0, 0, 191, 1)',
    'rgba(0, 0, 159, 1)',
    'rgba(0, 0, 127, 1)',
    'rgba(63, 0, 91, 1)',
    'rgba(127, 0, 63, 1)',
    'rgba(191, 0, 31, 1)',
    'rgba(255, 0, 0, 1)'
  ];
  heatmap.setOptions({
    gradient: heatmap.get('gradient') ? null : gradient
  });
}

function changeRadius() {
  heatmap.setOptions({radius: heatmap.get('radius') ? null : 20});
}

function changeOpacity() {
  heatmap.setOptions({opacity: heatmap.get('opacity') ? null : 0.2});
}

google.maps.event.addDomListener(window, 'load', initialize);

// <script type="text/javascript">
//   function initialize() {
//     var mapOptions = {
//       center: new google.maps.LatLng(37.09024, -95.712891),
//       zoom: 8,
//       mapTypeId: google.maps.MapTypeId.ROADMAP
//     };
//     var map = new google.maps.Map(document.getElementById("map-canvas"),
//       mapOptions);
//   }
//   google.maps.event.addDomListener(window, 'load', initialize);
// </script>
