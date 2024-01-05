function getDate() {
    var now = new Date();
    document.getElementById('date').innerHTML = 
    `${now.toLocaleDateString()} ${now.toLocaleTimeString()}`;
}

window.addEventListener('load', (event) => {
    getDate();
    setInterval(function () {
        getDate();
        // Every 30 seconds won't be 100% accurate, but who cares.
    }, 1000);
});