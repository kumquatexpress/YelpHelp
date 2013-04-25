(function(ui, $, undefined) {
    ui.addResult = function(r) {
        var rating = "<div class='quality'><img src='img/thumbs-";
        if (r.rating > 3.0) {
            rating += "up";
        } else {
            rating += "down";
        }
        rating += ".png' /></div>";
        var name = "<div class='name'><a target='_blank' href='"+r.url+"'>"+ r.name + "</a></div>";
        var address = "<div class='address'>" + r.address + "</div>";
        var info = "<div class='info'>" + name + address + "</div>";
        var r_str = "<div class='result'>" + rating + info + "</div>";
        $('.results').append(r_str);
    };

}(window.ui = window.ui || {}, jQuery))