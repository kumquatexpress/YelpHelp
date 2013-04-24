(function(mapping, $, undefined) {
    mapping.map = null;
    var geocoder = new google.maps.Geocoder();
    var directionsService = new google.maps.DirectionsService();
    var directionsDisplay = null;
    var geocodes = {};
    var markers = [];
    var path = [];
    mapping.placeMarker = function(the_title, latlng) {
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
        directionsDisplay = new google.maps.DirectionsRenderer({map : mapping.map});
    };

    mapping.getCoordsFromAddress = function (address, callback) {
        if (geocodes[address] !== undefined) {
            callback(geocodes[address]);
            return;
        }
        geocoder.geocode( { 'address': address}, function(results, status) {
            console.log("Got geocoding result");
            if (status == google.maps.GeocoderStatus.OK) {
                var loc = results[0].geometry.location;
                console.log(loc.toString());
                geocodes[address] = loc;
                callback(loc);
            } else {
                console.log("Unable to geocode " + address + " because " + status);
            }
        });
    };

    mapping.placeMarkerAtAddress = function (name, address) {
        var callback = function(latlng) {
            mapping.placeMarker(name,latlng);
        };
        mapping.getCoordsFromAddress(address,callback);
    };

    mapping.clearMarkers = function() {
        if(markers) {
            for(var i in markers) {
                markers[i].setMap(null);
            }
            markers.length = 0;
        }
    };

    mapping.placeRoute = function(address_list){
        path.length = 0;
        var callback = function(loc) {
            path.push(loc);
        };
        for(var i=0;i<address_list.length;i++) {
            mapping.getCoordsFromAddress(address_list[i],callback);
        }
        listening.showLoading();
        setTimeout(function() {
            if (path.length < 2) {
                return;
            }
            var wps = [];
            var orig = path[0];
            var dest = path[1];
            if (path.length == 3) {
                wps.push({location:path[1]});
                dest = path[2];
            }
            var request = {
                origin: orig,
                destination: dest,
                waypoints: wps,
                travelMode: google.maps.DirectionsTravelMode.DRIVING
            };
            directionsService.route(request, function(response,status) {
                if (response.status ==  "OK") {
                    directionsDisplay.setDirections(response);
                }
                else {
                    alert("Failed");
                    console.log(response);
                    console.log(status);
                }
            });
            listening.hideLoading();
        },2000);
    };
}(window.mapping = window.mapping || {},jQuery));
