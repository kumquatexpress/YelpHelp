(function(search, $, undefined) {
	var searchURL = "./testdata/restaurants_by_dish.json";
	search.findRestaurantsByDish = function(dish) {
		var data = {"dish" : $("#search_box").val()};
		alert("testing");
		$.post(searchURL,data,function(response){
			alert(response);
		});
	};
}(window.search = window.search || {},jQuery));