(function(search, $, undefined) {
	var searchURL = "http://localhost:8080/testdata/restaurants_by_dish.json";
	search.findRestaurantsByDish = function(dish) {
		var data = {"dish" : $("#search_box").val()};
		$.ajax({
			url : searchURL,
			cache : false,
		}).done(function(raw_data) {
			var restaurants = $.parseJSON(raw_data);
			$('.results').html('');
			for(var i=0;i < restaurants.results.length;i++) {
				var r = restaurants.results[i];
				var rating = "<div class='quality'><img src='img/thumbs-";
				if(r.rating > 5.0) {
					rating += "up";
				}
				else {
					rating += "down";
				}
				rating += ".png' /></div>";
				var name = "<div class='name'>"+r.name+"</div>";
				var address = "<div class='address'>"+r.address+"</div>";
				var info = "<div class='info'>"+name+address+"</div>"
				var r_str = "<div class='result'>"+rating+info+"</div>";
				$('.results').append(r_str);
			}
		});
	};
}(window.search = window.search || {},jQuery));