(function(listening, $, undefined) {

    listening.init = function() {
        listening.plotPath();
        $("#search_box").keydown(function(e) {
            if (e.keyCode == 13) {
                searching.findRestaurants($(this).val());
            }
        });
    };

    listening.plotPath = function() {
        $("#plot-path").click(function() {
            var vals = [$("#stop-1").val(), $("#stop-2").val(), $("#stop-3").val()];
            var addrs = [];
            for (var i = 0; i < vals.length; i++) {
                if (vals[i].length > 3) {
                    addrs.push(vals[i]);
                }
            }
            if (addrs.length > 1) {
                mapping.placeRouteByAddress(addrs);
            } else {
                alert("Not enough stops for a route!");
            }
        });
    };

    listening.plotMeals = function() {
        $("#plot-meals").click(function() {
            var vals = [$("#dish-1").val(), $("#dish-2").val(), $("#dish-3").val()];
            var dishes = [];
            for (var i = 0; i < vals.length; i++) {
                if (vals[i].length > 3) {
                    dishes.push(vals[i]);
                }
            }
            if (dishes.length > 0) {
                searching.findRestaurantsRoute(dishes);
            } else {
                alert("Not enough stops for a route!");
            }
        });
    };

    listening.plotRandom = function() {
        $("#plot-random").click(function() {
            var val = $("#place").val();
            if (val.length > 0) {
                var callback = function(pos) {
                    mapping.map.setCenter(pos);
                    searching.findRestaurants(undefined);
                }
                mapping.getCoordsFromAddress(val, callback);
            } else {
                alert("Please enter a place!");
            }
        });
    };

}(window.listening = window.listening || {}, jQuery))