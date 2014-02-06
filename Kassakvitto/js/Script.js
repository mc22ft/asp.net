"use strict";

var KassaKvitto = {

    init: function (e) {

        var boxNode = document.getElementById("Total");
        boxNode.focus();
        boxNode.select();
    }
};

window.onload = KassaKvitto.init;
