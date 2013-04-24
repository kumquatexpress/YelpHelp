(function(searching, $, undefined) {
	var restaurantURL = document.location.href + "businesses/list_restaurants";
	var restaurantPathURL = document.location.href + "businesses/list_restaurants";

	searching.findRestaurants = function(dish) {
		var coords = mapping.map.getCenter();
		var data_vars = {
			"dish": dish,
			"lat": [coords.lat()],
			"long": [coords.lng()]
		};
		$.ajax({
			url: restaurantURL,
			data: data_vars,
			cache: false
		}).done(function(raw_data) {
			var restaurants = raw_data.results;
			$('.results').html('');
			mapping.clearMarkers();

			for (var i = 0; i < restaurants.length; i++) {
				var r = restaurants[i];
				ui.addResult(r);
				mapping.placeMarker(r.name, new google.maps.LatLng(r.latlng[0], r.latlng[1]));
			}
		});
	};

	searching.findRestaurantsOnRoute = function(addrs) {
		var callback = function(route) {
			var lats = [];
			var longs = [];
			for (var i = 0; i < route.length; i++) {
				lats.push(route[i].lat());
				longs.push(route[i].lng());
			}
			var data_vars = {
				"lat": lats,
				"long": longs
			};
			$.ajax({
				url: restaurantURL,
				data: data_vars,
				cache: false
			}).done(function(raw_data) {
				var restaurants = $.parseJSON(raw_data).results;
				$('.results').html('');
				mapping.clearMarkers();
				var path = [];
				for (var i = 0; i < restaurants.length; i++) {
					var r = restaurants[i];
					ui.addResult(r);
					path.push(new google.maps.LatLng(r.latlng[0], r.latlng[1]));
				}
				mapping.placeRoute(path);
			});
		};
		mapping.batchGeocodeForResult(addrs, callback);
	};

	searching.findRestaurantsRoute = function(dishes) {
		var coords = mapping.map.getCenter();
		var data_vars = {
			"dishes": dishes,
			"lat": coords.lat(),
			"long": coords.lng()
		};
		$.ajax({
			url: restaurantPathURL,
			data: data_vars,
			cache: false
		}).done(function(raw_data) {
			var restaurants = $.parseJSON(raw_data).results;
			$('.results').html('');
			mapping.clearMarkers();
			var path = [];
			for (var i = 0; i < restaurants.length; i++) {
				var r = restaurants[i];
				ui.addResult(r);
				path.push(new google.maps.LatLng(r.latlng[0], r.latlng[1]));
			}
			mapping.placeRoute(path);
		});
	};

}(window.searching = window.searching || {}, jQuery));