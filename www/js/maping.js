(function(mapping, $, undefined) {
    var geocoder = new google.maps.Geocoder();
    mapping.getCoordsFromAddress = function (address) {
        var ret = new google.maps.LatLng(30, 0);
        geocoder.geocode( { 'address': address}, function(results, status) {
            cont = true;
            if (status == google.maps.GeocoderStatus.OK) {
                ret = results[0].geometry.location;
            } else {
                console.log("Unable to geocode " + address + " because " + status);
            }
        });
        return ret;
    };
    mapping.placeMarker = function (name, address) {
        latlng = mapping.getCoordsFromAddress("3901 Locust Walk");
        console.log(latlng.toString());
    };
}(window.mapping = window.mapping || {},jQuery));