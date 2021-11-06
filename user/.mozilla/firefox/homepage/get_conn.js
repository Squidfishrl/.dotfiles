function toOnline() {
    var connectionStatus = document.getElementById('connection');
    connectionStatus.innerHTML = 'Online';
    connectionStatus.style.color = 'rgb(169, 202, 150)'
}

function toOffline() {
    var connectionStatus = document.getElementById('connection');
    connectionStatus.innerHTML = 'Offline';
    connectionStatus.style.color = 'rgb(211, 129, 129)'
}

window.addEventListener('offline', (event) => {
    toOffline();
});

window.addEventListener('online', (event) => {
    toOnline();
});

window.addEventListener('load', (event) => {
    if (navigator.onLine) {
        toOnline();
    } else {
        toOffline();
    }
});
