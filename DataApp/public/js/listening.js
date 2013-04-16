(function(listening, $, undefined) {

    listening.init = function() {
        listening.plotPath();
    };

    listening.plotPath = function() {
        $("#plot-path").click(function() {
            var vals =  [$("#stop-1").val(), $("#stop-2").val(), $("#stop-3").val()];
            var addrs = [];
            for(var i=0;i<vals.length;i++) {
                if (vals[i].length > 3) {
                    addrs.push(vals[i]);
                }
            }
            if(addrs.length > 1) {
                mapping.placeRoute(addrs);
            }
            else {
                alert("Not enough stops for a route!");
            }
        });
    };

    listening.showLoading = function() {
        $("#loading").show();
    };

    listening.hideLoading = function() {
        $("#loading").hide();
    };
}(window.listening = window.listening || {},jQuery))