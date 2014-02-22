// $(function(){
// 	initialize_map();
// });


// function initialize_map(){


	var	map = L.mapbox.map('map', 'panicbus.h9kn5bph'); //.setView([37.579, 2.285], 2);

	// map.featureLayer.setGeoJSON(geoJson_features);

		// map.featureLayer.eachLayer(function(layer){
			
		// }

	// this is the marker click listener 
	map.featureLayer.on('click',function(e) {

		// ajax call to the checkins method. Passes in the marker ID from the clicked marker
		// ajax call returns the location data based on the ID of that location   
		// the .done says: once the ajax call is completed append 'info' with its data 
		$.get("/airports/" + e.layer.feature.properties.location_id, e.layer.feature.properties.location_id)
			.done(function(airports){

	    var feature = e.layer.feature;

	    var info = '<p class="site1_title"><b>' + feature.properties.title + '<b></p>' +
	               '<p class="site1_desc">' + feature.properties.description + '</p>'
	      

		}) // ends ajax 
	});

	// Closes the marker popup when map is clicked
	map.on('click',function(e){ });


// }