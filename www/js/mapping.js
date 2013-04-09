(function(mapping, $, undefined) {
    mapping.map = null;
    var geocoder = new google.maps.Geocoder();
    var markers = [];
    var addMarker = function(the_title, latlng) {
        var marker = new google.maps.Marker({
            position : latlng,
            map : mapping.map,
            title : the_title
        });
        markers.push(marker);
    };

    mapping.init = function() {
        var mapOptions = {
          center: new google.maps.LatLng(39.955543,-75.202892),
          zoom: 14,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        mapping.map = new google.maps.Map(document.getElementById("map-canvas"),
            mapOptions);
    };

    mapping.getCoordsFromAddress = function (address, callback) {
        geocoder.geocode( { 'address': address}, function(results, status) {
            console.log("Got geocoding result");
            if (status == google.maps.GeocoderStatus.OK) {
                var loc = results[0].geometry.location;
                console.log(loc.toString());
                callback(loc);
            } else {
                console.log("Unable to geocode " + address + " because " + status);
            }
        });
    };

    mapping.placeMarker = function (name, address) {

        callback = function(latlng) {
            addMarker(name,latlng);
        };
        mapping.getCoordsFromAddress(address,callback);
    };

    mapping.clearMarkers = function() {
        if(markers) {
            for(i in markers) {
                markers[i].setMap(null);
            }
            markers.length = 0;
        }
    };
}(window.mapping = window.mapping || {},jQuery));
