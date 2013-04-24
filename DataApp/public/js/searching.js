(function(searching, $, undefined) {
	var restaurantURL = document.location.href + "businesses/list_restaurants";
	searching.findRestaurants = function(dish) {
		var coords = mapping.map.getCenter();
		var data_vars = {"dish" : dish, "lat" : coords.lat(),"long" : coords.lng()};
		$.ajax({
			url : restaurantURL,
			data : data_vars,
			cache : false
		}).done(function(raw_data) {
			var restaurants = raw_data;
			$('.results').html('');
			mapping.clearMarkers();

			for(var i=0;i < restaurants.results.length;i++) {
				var r = restaurants.results[i];
				var rating = "<div class='quality'><img src='img/thumbs-";
				if(r.rating > 3.0) {
					rating += "up";
				}
				else {
					rating += "down";
				}
				rating += ".png' /></div>";
				var name = "<div class='name'>"+r.name+"</div>";
				var address = "<div class='address'>"+r.address+"</div>";
				var info = "<div class='info'>"+name+address+"</div>";
				var r_str = "<div class='result'>"+rating+info+"</div>";
				$('.results').append(r_str);
				mapping.placeMarker(r.name,r.latlng);
			}
		});
	};
}(window.searching = window.searching || {},jQuery));