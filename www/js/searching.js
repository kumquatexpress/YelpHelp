(function(test) {
	test.my_func = function() {
		alert("Yo it works!");
	}
}(window.test));

(function(search, $, undefined) {
	var searchURL = "./testdata/restaurants_by_dish.json";
	search.findRestaurantsByDish = function(dish) {
		var data = {"dish" : $("#search_box").val()};
		test.my_func();
		$.post(searchURL,data,function(response){
			alert("post successful")
		});
	};
}(window.search = window.search || {},jQuery));