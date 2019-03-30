window.onload = function() {
    var dt = new Date();
    document.getElementById("date").innerHTML = dt.toLocaleDateString();
    document.getElementById("time").innerHTML = dt.toLocaleTimeString();
};
